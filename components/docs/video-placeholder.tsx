"use client";

import React from "react";
import { Play } from "lucide-react";
import dynamic from "next/dynamic";

const VideoPlayer = dynamic(() => import("./video-player"), { ssr: false });

const sectionAccents: Record<string, { from: string; to: string; icon: string }> = {
  "why-civikstack": { from: "from-sky-950", to: "to-slate-900", icon: "bg-sky-500/20" },
  "how-it-works": { from: "from-teal-950", to: "to-slate-900", icon: "bg-teal-500/20" },
  "get-started": { from: "from-emerald-950", to: "to-slate-900", icon: "bg-emerald-500/20" },
  "build": { from: "from-amber-950", to: "to-slate-900", icon: "bg-amber-500/20" },
  "govern": { from: "from-rose-950", to: "to-slate-900", icon: "bg-rose-500/20" },
  "community": { from: "from-cyan-950", to: "to-slate-900", icon: "bg-cyan-500/20" },
};

const defaultAccent = { from: "from-slate-950", to: "to-slate-900", icon: "bg-slate-500/20" };

interface VideoPlaceholderProps {
  videoUrl: string | null;
  sectionTitle: string;
  sectionSlug: string;
}

export default function VideoPlaceholder({
  videoUrl,
  sectionTitle,
  sectionSlug,
}: VideoPlaceholderProps) {
  if (videoUrl) {
    return <VideoPlayer src={videoUrl} />;
  }

  const accent = sectionAccents[sectionSlug] || defaultAccent;

  return (
    <div
      className={`relative w-full rounded-xl overflow-hidden bg-gradient-to-br ${accent.from} ${accent.to} border border-white/[0.06]`}
    >
      <div className="aspect-video flex flex-col items-center justify-center gap-4 relative">
        <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_rgba(255,255,255,0.03)_0%,_transparent_70%)]" />

        <div className="absolute top-4 left-4 flex items-center gap-2 opacity-40">
          <div className="w-2.5 h-2.5 rounded-full bg-white/30" />
          <div className="w-2.5 h-2.5 rounded-full bg-white/20" />
          <div className="w-2.5 h-2.5 rounded-full bg-white/10" />
        </div>

        <div
          className={`relative z-10 w-16 h-16 sm:w-20 sm:h-20 rounded-full ${accent.icon} flex items-center justify-center border border-white/10 transition-transform hover:scale-105`}
        >
          <Play className="w-7 h-7 sm:w-8 sm:h-8 text-white/60 ml-1" />
        </div>

        <div className="relative z-10 text-center px-4">
          <p className="text-white/70 text-sm sm:text-base font-medium">
            {sectionTitle}
          </p>
          <p className="text-white/30 text-xs sm:text-sm mt-1">
            Video coming soon
          </p>
        </div>

        <div className="absolute bottom-4 left-4 right-4 z-10">
          <div className="flex items-center gap-2">
            <div className="h-0.5 flex-1 bg-white/10 rounded-full overflow-hidden">
              <div className="h-full w-0 bg-white/30 rounded-full" />
            </div>
            <span className="text-white/20 text-xs">0:00</span>
          </div>
        </div>
      </div>
    </div>
  );
}
