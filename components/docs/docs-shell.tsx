"use client";

import { useState } from "react";
import { Navbar } from "./navbar";
import { Banner } from "./banner";
import { SearchDialog } from "./search-dialog";
import type { DocMeta, NavSection, SidebarGroupWithPages } from "@/lib/supabase";
import { Sidebar } from "./sidebar";
import { MobileSidebar } from "./mobile-sidebar";
import { DocFooter } from "./doc-footer";
import { HeroBanner } from "./hero-banner";

interface DocsShellProps {
  meta: DocMeta | null;
  sections: NavSection[];
  sidebarGroups: SidebarGroupWithPages[];
  currentSectionSlug: string;
  children: React.ReactNode;
}

export function DocsShell({
  meta,
  sections,
  sidebarGroups,
  currentSectionSlug,
  children,
}: DocsShellProps) {
  const [searchOpen, setSearchOpen] = useState(false);

  return (
    <div className="min-h-screen flex flex-col">
      <Banner meta={meta} />
      <Navbar
        meta={meta}
        sections={sections}
        onSearchOpen={() => setSearchOpen(true)}
      />
      <SearchDialog open={searchOpen} onOpenChange={setSearchOpen} />
      <HeroBanner title={sections.find((s) => s.slug === currentSectionSlug)?.landing_title} />

      <div className="mx-auto w-full max-w-[90rem] flex-1 flex px-4 sm:px-6 lg:px-8">
        <Sidebar groups={sidebarGroups} sectionSlug={currentSectionSlug} />
        <div className="hidden md:block w-px bg-border shrink-0" />
        <main className="flex-1 min-w-0">{children}</main>
      </div>

      <DocFooter meta={meta} />
      <MobileSidebar
        groups={sidebarGroups}
        sectionSlug={currentSectionSlug}
      />
    </div>
  );
}
