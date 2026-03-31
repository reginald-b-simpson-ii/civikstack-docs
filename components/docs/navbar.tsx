"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Search, Menu, X, Layers } from "lucide-react";
import { cn } from "@/lib/utils";
import { useState } from "react";
import type { DocMeta, NavSection } from "@/lib/supabase";
import { ThemeToggle } from "./theme-toggle";

interface NavbarProps {
  meta: DocMeta | null;
  sections: NavSection[];
  onSearchOpen: () => void;
}

export function Navbar({ meta, sections, onSearchOpen }: NavbarProps) {
  const pathname = usePathname();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 w-full bg-background/80 backdrop-blur-lg supports-[backdrop-filter]:bg-background/60">
      <div className="border-b">
        <div className="mx-auto flex h-14 max-w-[90rem] items-center px-4 sm:px-6 lg:px-8">
          <Link href="/" className="flex items-center gap-2 mr-6 shrink-0">
            <Layers className="h-5 w-5 text-primary" />
            <span className="ff-p-16 bold">
              {meta?.logo_text || "CivikStack docs"}
            </span>
          </Link>

          <div className="flex items-center gap-2 ml-auto">
            <button
              onClick={onSearchOpen}
              className="hidden sm:flex items-center gap-2 rounded-full border bg-muted/50 px-2.5 py-1 ff-p-14 text-muted-foreground hover:bg-muted transition-colors"
            >
              <Search className="h-3.5 w-3.5" />
              <span>Search docs...</span>
              <kbd className="pointer-events-none hidden h-5 select-none items-center gap-1 rounded border bg-background px-1.5 font-mono text-[10px] font-medium opacity-100 sm:flex">
                <span className="text-xs">&#8984;</span>K
              </kbd>
            </button>

            <button
              onClick={onSearchOpen}
              className="sm:hidden p-2 text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Search"
            >
              <Search className="h-5 w-5" />
            </button>

            <ThemeToggle />

            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="md:hidden p-2 text-muted-foreground hover:text-foreground transition-colors"
              aria-label="Toggle menu"
            >
              {mobileMenuOpen ? (
                <X className="h-5 w-5" />
              ) : (
                <Menu className="h-5 w-5" />
              )}
            </button>
          </div>
        </div>
      </div>

      <div className="border-b hidden md:block">
        <div className="mx-auto max-w-[90rem] px-4 sm:px-6 lg:px-8">
          <nav className="flex items-center gap-0 -mb-px overflow-x-auto scrollbar-hide">
            {sections.map((section) => {
              const href = `/docs/${section.slug}`;
              const isActive = pathname?.startsWith(href);
              return (
                <Link
                  key={section.slug}
                  href={href}
                  className={cn(
                    "relative px-4 py-3 ff-p-14 whitespace-nowrap transition-colors border-b-2",
                    isActive
                      ? "text-primary medium border-primary"
                      : "text-muted-foreground hover:text-foreground border-transparent hover:border-muted-foreground/30"
                  )}
                >
                  {section.label}
                </Link>
              );
            })}
          </nav>
        </div>
      </div>

      {mobileMenuOpen && (
        <div className="md:hidden border-b bg-background">
          <nav className="flex flex-col p-3 gap-0.5">
            {sections.map((section) => {
              const href = `/docs/${section.slug}`;
              const isActive = pathname?.startsWith(href);
              return (
                <Link
                  key={section.slug}
                  href={href}
                  onClick={() => setMobileMenuOpen(false)}
                  className={cn(
                    "px-3 py-2.5 ff-p-14 rounded-md transition-colors",
                    isActive
                      ? "text-primary medium bg-primary/5 border-l-2 border-primary"
                      : "text-muted-foreground hover:text-foreground hover:bg-muted/50"
                  )}
                >
                  {section.label}
                </Link>
              );
            })}
          </nav>
        </div>
      )}
    </header>
  );
}
