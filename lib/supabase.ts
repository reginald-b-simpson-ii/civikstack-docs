import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export interface DocMeta {
  id: string;
  site_title: string;
  site_description: string;
  logo_text: string;
  banner_text: string;
  banner_enabled: boolean;
  banner_link: string;
  footer_text: string;
  github_url: string;
}

export interface NavSection {
  id: string;
  label: string;
  slug: string;
  sort_order: number;
  landing_title: string;
  landing_subtitle: string;
  landing_body: string;
  video_url: string | null;
}

export interface SidebarGroup {
  id: string;
  section_id: string;
  title: string;
  slug: string;
  sort_order: number;
}

export interface SectionPage {
  id: string;
  group_id: string;
  title: string;
  slug: string;
  description: string;
  content: string;
  sort_order: number;
  created_at: string;
  updated_at: string;
}

export interface SidebarGroupWithPages extends SidebarGroup {
  pages: SectionPage[];
}

export async function getDocMeta(): Promise<DocMeta | null> {
  const { data } = await supabase
    .from('doc_meta')
    .select('*')
    .maybeSingle();
  return data;
}

export async function getNavSections(): Promise<NavSection[]> {
  const { data } = await supabase
    .from('nav_sections')
    .select('*')
    .order('sort_order');
  return data || [];
}

export async function getSidebarForSection(
  sectionSlug: string
): Promise<SidebarGroupWithPages[]> {
  const { data: section } = await supabase
    .from('nav_sections')
    .select('id')
    .eq('slug', sectionSlug)
    .maybeSingle();

  if (!section) return [];

  const { data: groups } = await supabase
    .from('sidebar_groups')
    .select('*')
    .eq('section_id', section.id)
    .order('sort_order');

  if (!groups || groups.length === 0) return [];

  const groupIds = groups.map((g) => g.id);
  const { data: pages } = await supabase
    .from('section_pages')
    .select('*')
    .in('group_id', groupIds)
    .order('sort_order');

  return groups.map((group) => ({
    ...group,
    pages: (pages || []).filter((p) => p.group_id === group.id),
  }));
}

export async function getNavSection(
  sectionSlug: string
): Promise<NavSection | null> {
  const { data } = await supabase
    .from('nav_sections')
    .select('*')
    .eq('slug', sectionSlug)
    .maybeSingle();
  return data;
}

export async function getSectionPage(
  sectionSlug: string,
  pageSlug: string
): Promise<{
  page: SectionPage;
  group: SidebarGroup;
  section: NavSection;
} | null> {
  const { data: section } = await supabase
    .from('nav_sections')
    .select('*')
    .eq('slug', sectionSlug)
    .maybeSingle();

  if (!section) return null;

  const { data: groups } = await supabase
    .from('sidebar_groups')
    .select('*')
    .eq('section_id', section.id);

  if (!groups || groups.length === 0) return null;

  const groupIds = groups.map((g) => g.id);
  const { data: page } = await supabase
    .from('section_pages')
    .select('*')
    .in('group_id', groupIds)
    .eq('slug', pageSlug)
    .maybeSingle();

  if (!page) return null;

  const group = groups.find((g) => g.id === page.group_id)!;
  return { page, group, section };
}

export async function searchSectionPages(
  query: string
): Promise<{ page: SectionPage; group: SidebarGroup; section: NavSection }[]> {
  const { data: sections } = await supabase
    .from('nav_sections')
    .select('*');

  const { data: groups } = await supabase
    .from('sidebar_groups')
    .select('*');

  const { data: pages } = await supabase
    .from('section_pages')
    .select('*')
    .or(
      `title.ilike.%${query}%,description.ilike.%${query}%,content.ilike.%${query}%`
    )
    .limit(12);

  if (!sections || !groups || !pages) return [];

  return pages.map((page) => {
    const group = groups.find((g) => g.id === page.group_id)!;
    const section = sections.find((s) => s.id === group.section_id)!;
    return { page, group, section };
  });
}
