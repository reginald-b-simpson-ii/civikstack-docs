"use client";

import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { Menu } from "lucide-react";
import { SidebarContent } from "./sidebar";
import { ScrollArea } from "@/components/ui/scroll-area";
import type { SidebarGroupWithPages } from "@/lib/supabase";
import { useState, useEffect } from "react";
import { usePathname } from "next/navigation";

interface MobileSidebarProps {
  groups: SidebarGroupWithPages[];
  sectionSlug: string;
}

export function MobileSidebar({ groups, sectionSlug }: MobileSidebarProps) {
  const [open, setOpen] = useState(false);
  const pathname = usePathname();

  useEffect(() => {
    setOpen(false);
  }, [pathname]);

  return (
    <Sheet open={open} onOpenChange={setOpen}>
      <SheetTrigger asChild>
        <button
          className="md:hidden fixed bottom-4 left-4 z-40 flex h-12 w-12 items-center justify-center rounded-full bg-primary text-primary-foreground shadow-lg hover:opacity-90 transition-opacity"
          aria-label="Open navigation"
        >
          <Menu className="h-5 w-5" />
        </button>
      </SheetTrigger>
      <SheetContent side="left" className="w-72 p-0">
        <ScrollArea className="h-full py-6 px-4">
          <SidebarContent groups={groups} sectionSlug={sectionSlug} />
        </ScrollArea>
      </SheetContent>
    </Sheet>
  );
}
