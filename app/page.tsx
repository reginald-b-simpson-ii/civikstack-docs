import { getDocMeta, getNavSections } from "@/lib/supabase";
import { LandingContent } from "@/components/landing/landing-content";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default async function Home() {
  const [meta, sections] = await Promise.all([
    getDocMeta(),
    getNavSections(),
  ]);

  return <LandingContent meta={meta} sections={sections} />;
}
