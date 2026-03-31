"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter } from "next/navigation";
import { FileText, Hash } from "lucide-react";
import {
  CommandDialog,
  CommandInput,
  CommandList,
  CommandEmpty,
  CommandGroup,
  CommandItem,
} from "@/components/ui/command";
import { supabase } from "@/lib/supabase";
import type { SectionPage, SidebarGroup, NavSection } from "@/lib/supabase";

interface SearchResult {
  page: SectionPage;
  group: SidebarGroup;
  section: NavSection;
}

interface SearchDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
}

export function SearchDialog({ open, onOpenChange }: SearchDialogProps) {
  const router = useRouter();
  const [results, setResults] = useState<SearchResult[]>([]);
  const [query, setQuery] = useState("");

  useEffect(() => {
    const down = (e: KeyboardEvent) => {
      if (e.key === "k" && (e.metaKey || e.ctrlKey)) {
        e.preventDefault();
        onOpenChange(!open);
      }
    };
    document.addEventListener("keydown", down);
    return () => document.removeEventListener("keydown", down);
  }, [onOpenChange, open]);

  const handleSearch = useCallback(async (value: string) => {
    setQuery(value);
    if (value.length < 2) {
      setResults([]);
      return;
    }

    const { data: sections } = await supabase
      .from("nav_sections")
      .select("*");

    const { data: groups } = await supabase
      .from("sidebar_groups")
      .select("*");

    const { data: pages } = await supabase
      .from("section_pages")
      .select("*")
      .or(
        `title.ilike.%${value}%,description.ilike.%${value}%,content.ilike.%${value}%`
      )
      .limit(12);

    if (!sections || !groups || !pages) return;

    setResults(
      pages.map((page) => {
        const group = groups.find((g) => g.id === page.group_id)!;
        const section = sections.find((s) => s.id === group.section_id)!;
        return { page, group, section };
      })
    );
  }, []);

  const handleSelect = (sectionSlug: string, pageSlug: string) => {
    router.push(`/docs/${sectionSlug}/${pageSlug}`);
    onOpenChange(false);
    setQuery("");
    setResults([]);
  };

  const groupedResults = results.reduce<Record<string, SearchResult[]>>(
    (acc, result) => {
      const key = result.section.label;
      if (!acc[key]) acc[key] = [];
      acc[key].push(result);
      return acc;
    },
    {}
  );

  return (
    <CommandDialog open={open} onOpenChange={onOpenChange}>
      <CommandInput
        placeholder="Search documentation..."
        value={query}
        onValueChange={handleSearch}
      />
      <CommandList>
        <CommandEmpty>
          {query.length < 2
            ? "Type at least 2 characters to search..."
            : "No results found."}
        </CommandEmpty>
        {Object.entries(groupedResults).map(([sectionLabel, items]) => (
          <CommandGroup key={sectionLabel} heading={sectionLabel}>
            {items.map((result) => (
              <CommandItem
                key={result.page.id}
                value={`${result.section.slug}/${result.page.slug} ${result.page.title}`}
                onSelect={() =>
                  handleSelect(result.section.slug, result.page.slug)
                }
                className="flex items-center gap-3 py-3 cursor-pointer"
              >
                <FileText className="h-4 w-4 shrink-0 text-muted-foreground" />
                <div className="flex flex-col gap-0.5 min-w-0">
                  <span className="ff-p-14 medium truncate">
                    {result.page.title}
                  </span>
                  {result.page.description && (
                    <span className="ff-p-12 text-muted-foreground truncate">
                      {result.page.description}
                    </span>
                  )}
                </div>
                <Hash className="ml-auto h-3 w-3 shrink-0 text-muted-foreground/50" />
              </CommandItem>
            ))}
          </CommandGroup>
        ))}
      </CommandList>
    </CommandDialog>
  );
}
