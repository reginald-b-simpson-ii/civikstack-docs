"use client";

import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";

interface TocItem {
  id: string;
  text: string;
  level: number;
}

interface TableOfContentsProps {
  content: string;
}

function extractHeadings(html: string): TocItem[] {
  const headingRegex = /<h([23])\s+id="([^"]+)"[^>]*>([^<]+)<\/h[23]>/g;
  const items: TocItem[] = [];
  let match;

  while ((match = headingRegex.exec(html)) !== null) {
    items.push({
      level: parseInt(match[1]),
      id: match[2],
      text: match[3],
    });
  }

  return items;
}

export function TableOfContents({ content }: TableOfContentsProps) {
  const [activeId, setActiveId] = useState<string>("");
  const headings = extractHeadings(content);

  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setActiveId(entry.target.id);
          }
        });
      },
      { rootMargin: "-80px 0px -80% 0px", threshold: 0 }
    );

    headings.forEach((heading) => {
      const element = document.getElementById(heading.id);
      if (element) observer.observe(element);
    });

    return () => observer.disconnect();
  }, [headings]);

  if (headings.length === 0) return null;

  return (
    <aside className="hidden xl:block w-56 shrink-0">
      <div className="sticky top-[6.75rem] h-[calc(100vh-6.75rem)] py-6 pl-4">
        <div className="space-y-1">
          <p className="ff-p-14 bold text-foreground mb-3">
            On This Page
          </p>
          <nav className="space-y-0.5">
            {headings.map((heading) => (
              <a
                key={heading.id}
                href={`#${heading.id}`}
                onClick={(e) => {
                  e.preventDefault();
                  const el = document.getElementById(heading.id);
                  if (el) {
                    el.scrollIntoView({ behavior: "smooth" });
                    setActiveId(heading.id);
                  }
                }}
                className={cn(
                  "block ff-p-12 py-1 transition-colors border-l-2",
                  heading.level === 3 ? "pl-6" : "pl-3",
                  activeId === heading.id
                    ? "border-primary text-primary medium"
                    : "border-transparent text-muted-foreground hover:text-foreground"
                )}
              >
                {heading.text}
              </a>
            ))}
          </nav>
        </div>
      </div>
    </aside>
  );
}
