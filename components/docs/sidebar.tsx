"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { ChevronRight } from "lucide-react";
import { cn } from "@/lib/utils";
import { useState, useEffect } from "react";
import type { SidebarGroupWithPages } from "@/lib/supabase";
import { ScrollArea } from "@/components/ui/scroll-area";

interface SidebarProps {
  groups: SidebarGroupWithPages[];
  sectionSlug: string;
}

export function Sidebar({ groups, sectionSlug }: SidebarProps) {
  return (
    <aside className="hidden md:block w-64 shrink-0">
      <div className="sticky top-[6.75rem] h-[calc(100vh-6.75rem)]">
        <ScrollArea className="h-full py-6 pr-4">
          <SidebarContent groups={groups} sectionSlug={sectionSlug} />
        </ScrollArea>
      </div>
    </aside>
  );
}

export function SidebarContent({ groups, sectionSlug }: SidebarProps) {
  const pathname = usePathname();

  return (
    <nav className="space-y-1">
      {groups.map((group) => (
        <SidebarGroupItem
          key={group.id}
          group={group}
          sectionSlug={sectionSlug}
          pathname={pathname}
        />
      ))}
    </nav>
  );
}

function SidebarGroupItem({
  group,
  sectionSlug,
  pathname,
}: {
  group: SidebarGroupWithPages;
  sectionSlug: string;
  pathname: string;
}) {
  const hasActiveChild = group.pages.some(
    (page) => pathname === `/docs/${sectionSlug}/${page.slug}`
  );
  const [isOpen, setIsOpen] = useState(hasActiveChild);

  useEffect(() => {
    if (hasActiveChild) {
      setIsOpen(true);
    }
  }, [hasActiveChild]);

  return (
    <div className="mb-1">
      <button
        onClick={() => setIsOpen(!isOpen)}
        className={cn(
          "flex w-full items-center justify-between rounded-md px-3 py-2 ff-p-14 transition-colors",
          hasActiveChild
            ? "text-foreground medium"
            : "text-muted-foreground hover:text-foreground"
        )}
      >
        <span className="text-left">{group.title}</span>
        <ChevronRight
          className={cn(
            "h-3.5 w-3.5 shrink-0 transition-transform duration-200",
            isOpen && "rotate-90"
          )}
        />
      </button>

      {isOpen && (
        <div className="ml-3 mt-0.5 space-y-0.5 border-l border-border pl-3">
          {group.pages.map((page) => {
            const href = `/docs/${sectionSlug}/${page.slug}`;
            const isPageActive = pathname === href;

            return (
              <Link
                key={page.id}
                href={href}
                className={cn(
                  "block rounded-md px-3 py-1.5 ff-p-14 transition-colors",
                  isPageActive
                    ? "bg-primary/10 text-primary medium"
                    : "text-muted-foreground hover:text-foreground hover:bg-muted/50"
                )}
              >
                {page.title}
              </Link>
            );
          })}
        </div>
      )}
    </div>
  );
}
