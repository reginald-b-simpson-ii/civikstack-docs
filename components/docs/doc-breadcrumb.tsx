import Link from "next/link";
import { ChevronRight } from "lucide-react";

interface DocBreadcrumbProps {
  sectionLabel: string;
  sectionSlug: string;
  groupTitle: string;
  pageTitle: string;
}

export function DocBreadcrumb({
  sectionLabel,
  sectionSlug,
  groupTitle,
  pageTitle,
}: DocBreadcrumbProps) {
  return (
    <nav className="flex items-center gap-1.5 ff-p-12 text-muted-foreground mb-4 flex-wrap">
      <Link
        href={`/docs/${sectionSlug}`}
        className="hover:text-foreground transition-colors"
      >
        {sectionLabel}
      </Link>
      <ChevronRight className="h-3.5 w-3.5 shrink-0" />
      <span className="text-muted-foreground">
        {groupTitle}
      </span>
      <ChevronRight className="h-3.5 w-3.5 shrink-0" />
      <span className="text-foreground medium">{pageTitle}</span>
    </nav>
  );
}
