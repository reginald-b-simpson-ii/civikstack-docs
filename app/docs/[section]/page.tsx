import { getNavSection, getSidebarForSection } from "@/lib/supabase";
import { notFound } from "next/navigation";
import Link from "next/link";
import { ArrowRight } from "lucide-react";
import VideoPlaceholder from "@/components/docs/video-placeholder";

export const dynamic = "force-dynamic";
export const revalidate = 0;

interface SectionPageProps {
  params: {
    section: string;
  };
}

export default async function SectionLandingPage({ params }: SectionPageProps) {
  const [section, groups] = await Promise.all([
    getNavSection(params.section),
    getSidebarForSection(params.section),
  ]);

  if (!section) {
    notFound();
  }

  return (
    <div className="py-8 px-0 md:px-8 max-w-3xl">
      <div className="mb-10">
        <VideoPlaceholder
          videoUrl={section.video_url}
          sectionTitle={section.landing_title}
          sectionSlug={params.section}
        />
      </div>

      <p className="ff-p-16 text-muted-foreground mb-8 leading-relaxed">
        {section.landing_subtitle}
      </p>
      <p className="ff-p-14 text-muted-foreground mb-10 leading-relaxed">
        {section.landing_body}
      </p>

      <div className="space-y-6">
        {groups.map((group) => (
          <div key={group.id} className="rounded-lg border bg-card p-5">
            <h3 className="ff-p-16 medium mb-3">{group.title}</h3>
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              {group.pages.slice(0, 6).map((page) => (
                <Link
                  key={page.id}
                  href={`/docs/${params.section}/${page.slug}`}
                  className="group flex items-center gap-2 rounded-md px-3 py-2 ff-p-14 text-muted-foreground hover:text-foreground hover:bg-muted/50 transition-colors"
                >
                  <ArrowRight className="h-3 w-3 shrink-0 opacity-0 -ml-5 group-hover:opacity-100 group-hover:ml-0 transition-all" />
                  <span className="truncate">{page.title}</span>
                </Link>
              ))}
              {group.pages.length > 6 && (
                <span className="px-3 py-2 ff-p-12 text-muted-foreground">
                  +{group.pages.length - 6} more
                </span>
              )}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
