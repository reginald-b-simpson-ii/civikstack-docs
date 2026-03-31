import { DocsShell } from "@/components/docs/docs-shell";
import { getDocMeta, getNavSections, getSidebarForSection } from "@/lib/supabase";
import { notFound } from "next/navigation";

export const dynamic = "force-dynamic";
export const revalidate = 0;

interface SectionLayoutProps {
  children: React.ReactNode;
  params: {
    section: string;
  };
}

export default async function SectionLayout({
  children,
  params,
}: SectionLayoutProps) {
  const [meta, sections, sidebarGroups] = await Promise.all([
    getDocMeta(),
    getNavSections(),
    getSidebarForSection(params.section),
  ]);

  const currentSection = sections.find((s) => s.slug === params.section);
  if (!currentSection) {
    notFound();
  }

  return (
    <DocsShell
      meta={meta}
      sections={sections}
      sidebarGroups={sidebarGroups}
      currentSectionSlug={params.section}
    >
      {children}
    </DocsShell>
  );
}
