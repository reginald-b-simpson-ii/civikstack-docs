import Link from "next/link";
import { ChevronLeft, ChevronRight } from "lucide-react";

interface PageLink {
  title: string;
  href: string;
  category: string;
}

interface PageNavigationProps {
  prev: PageLink | null;
  next: PageLink | null;
}

export function PageNavigation({ prev, next }: PageNavigationProps) {
  return (
    <div className="mt-12 flex items-stretch gap-4 border-t pt-8">
      {prev ? (
        <Link
          href={prev.href}
          className="group flex flex-1 flex-col items-start gap-1 rounded-lg border p-4 transition-all hover:border-primary/50 hover:shadow-sm"
        >
          <span className="flex items-center gap-1 ff-p-12 text-muted-foreground">
            <ChevronLeft className="h-3 w-3" />
            {prev.category}
          </span>
          <span className="ff-p-14 medium text-foreground group-hover:text-primary transition-colors">
            {prev.title}
          </span>
        </Link>
      ) : (
        <div className="flex-1" />
      )}

      {next ? (
        <Link
          href={next.href}
          className="group flex flex-1 flex-col items-end gap-1 rounded-lg border p-4 transition-all hover:border-primary/50 hover:shadow-sm"
        >
          <span className="flex items-center gap-1 ff-p-12 text-muted-foreground">
            {next.category}
            <ChevronRight className="h-3 w-3" />
          </span>
          <span className="ff-p-14 medium text-foreground group-hover:text-primary transition-colors">
            {next.title}
          </span>
        </Link>
      ) : (
        <div className="flex-1" />
      )}
    </div>
  );
}
