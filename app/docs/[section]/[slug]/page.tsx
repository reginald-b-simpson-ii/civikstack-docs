import { getSectionPage, getSidebarForSection } from "@/lib/supabase";
import { DocBreadcrumb } from "@/components/docs/doc-breadcrumb";
import { PageNavigation } from "@/components/docs/page-navigation";
import { TableOfContents } from "@/components/docs/table-of-contents";
import { notFound } from "next/navigation";
import { Calendar } from "lucide-react";

export const dynamic = "force-dynamic";
export const revalidate = 0;

interface DocPageProps {
  params: {
    section: string;
    slug: string;
  };
}

export default async function DocPage({ params }: DocPageProps) {
  const result = await getSectionPage(params.section, params.slug);

  if (!result) {
    notFound();
  }

  const { page, group, section } = result;
  const sidebarData = await getSidebarForSection(params.section);

  const allPages = sidebarData.flatMap((g) =>
    g.pages.map((p) => ({
      title: p.title,
      href: `/docs/${params.section}/${p.slug}`,
      category: g.title,
    }))
  );

  const currentIndex = allPages.findIndex(
    (p) => p.href === `/docs/${params.section}/${params.slug}`
  );

  const prev = currentIndex > 0 ? allPages[currentIndex - 1] : null;
  const next =
    currentIndex < allPages.length - 1 ? allPages[currentIndex + 1] : null;

  const updatedDate = new Date(page.updated_at).toLocaleDateString("en-US", {
    year: "numeric",
    month: "long",
    day: "numeric",
  });

  return (
    <div className="flex">
      <article className="flex-1 min-w-0 py-6 px-0 md:px-8">
        <DocBreadcrumb
          sectionLabel={section.label}
          sectionSlug={section.slug}
          groupTitle={group.title}
          pageTitle={page.title}
        />

        <h1 className="ff-p-24 bold mb-2">{page.title}</h1>

        {page.description && (
          <p className="ff-p-16 text-muted-foreground mb-6">
            {page.description}
          </p>
        )}

        <div
          className="doc-content"
          dangerouslySetInnerHTML={{ __html: page.content }}
        />

        <div className="mt-10 flex items-center gap-2 ff-p-12 text-muted-foreground">
          <Calendar className="h-3.5 w-3.5" />
          <span>Last updated on {updatedDate}</span>
        </div>

        <PageNavigation prev={prev} next={next} />
      </article>

      <TableOfContents content={page.content} />
    </div>
  );
}
