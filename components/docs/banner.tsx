"use client";

import { useState, useEffect } from "react";
import { X, ArrowRight } from "lucide-react";
import Link from "next/link";
import type { DocMeta } from "@/lib/supabase";

interface BannerProps {
  meta: DocMeta | null;
}

const BANNER_DISMISSED_KEY = "civikstack-banner-dismissed";

export function Banner({ meta }: BannerProps) {
  const [dismissed, setDismissed] = useState(true);

  useEffect(() => {
    const wasDismissed = localStorage.getItem(BANNER_DISMISSED_KEY);
    setDismissed(wasDismissed === "true");
  }, []);

  if (!meta?.banner_enabled || !meta?.banner_text || dismissed) {
    return null;
  }

  const handleDismiss = () => {
    setDismissed(true);
    localStorage.setItem(BANNER_DISMISSED_KEY, "true");
  };

  const content = (
    <span className="flex items-center gap-2 ff-p-14 medium">
      {meta.banner_text}
      <ArrowRight className="h-3.5 w-3.5" />
    </span>
  );

  return (
    <div className="relative flex items-center justify-center bg-primary px-4 py-2.5 text-primary-foreground">
      {meta.banner_link ? (
        <Link href={meta.banner_link} className="hover:underline">
          {content}
        </Link>
      ) : (
        content
      )}
      <button
        onClick={handleDismiss}
        className="absolute right-4 p-1 rounded-md hover:bg-primary-foreground/10 transition-colors"
        aria-label="Dismiss banner"
      >
        <X className="h-4 w-4" />
      </button>
    </div>
  );
}
