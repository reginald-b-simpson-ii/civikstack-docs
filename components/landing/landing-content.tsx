"use client";

import Link from "next/link";
import {
  ArrowRight,
  Layers,
  Activity,
  Shield,
  Building2,
  Users,
  Scale,
} from "lucide-react";
import { ThemeToggle } from "@/components/docs/theme-toggle";
import type { DocMeta, NavSection } from "@/lib/supabase";

interface LandingContentProps {
  meta: DocMeta | null;
  sections: NavSection[];
}

const features = [
  {
    icon: Activity,
    title: "Access Reliability Measurement",
    description:
      "Step-level telemetry measures whether service pathways actually work when residents try to use them.",
  },
  {
    icon: Shield,
    title: "Privacy as Architecture",
    description:
      "The Privacy Envelope structurally separates telemetry from personally identifiable information at the data layer.",
  },
  {
    icon: Scale,
    title: "Open Governance",
    description:
      "Constitutional governance with an irrevocable non-assertion covenant prevents ecosystem capture by any entity.",
  },
  {
    icon: Building2,
    title: "Ten Vertical Applications",
    description:
      "Housing, benefits, workforce, reentry, behavioral health, healthcare, and more — each built on the same measurement foundation.",
  },
  {
    icon: Users,
    title: "Community-Governed Standards",
    description:
      "Shared segments, schemas, and compliance mappings governed by working groups through an RFC process.",
  },
  {
    icon: Layers,
    title: "Desktop to Data Center",
    description:
      "Five scale tiers from a single laptop for evaluation to multi-county federation for production deployment.",
  },
];

const navLinks = [
  {
    title: "Why CivikStack",
    description:
      "The case for measuring whether civic services actually work when residents try to use them.",
    href: "/docs/why-civikstack",
  },
  {
    title: "How It Works",
    description:
      "The mechanism from pathway artifacts through drift detection to governance and correction.",
    href: "/docs/how-it-works",
  },
  {
    title: "Get Started",
    description:
      "Deployment paths for counties, agencies, frontline workers, and compliance officers.",
    href: "/docs/get-started",
  },
  {
    title: "Build",
    description:
      "Technical reference for developers building on or extending CivikStack infrastructure.",
    href: "/docs/build",
  },
  {
    title: "Govern",
    description:
      "Constitutional framework, RFC process, working groups, and federal compliance alignment.",
    href: "/docs/govern",
  },
  {
    title: "Community",
    description:
      "For advocates, residents, practitioners, researchers, and journalists.",
    href: "/docs/community",
  },
];

export function LandingContent({ meta, sections }: LandingContentProps) {
  return (
    <div className="min-h-screen flex flex-col">
      <header className="sticky top-0 z-50 w-full border-b bg-background/80 backdrop-blur-lg supports-[backdrop-filter]:bg-background/60">
        <div className="mx-auto flex h-14 max-w-[90rem] items-center px-4 sm:px-6 lg:px-8">
          <Link href="/" className="flex items-center gap-2 mr-6">
            <Layers className="h-5 w-5 text-primary" />
            <span className="ff-p-16 bold">
              {meta?.logo_text || "CivikStack docs"}
            </span>
          </Link>

          <nav className="hidden lg:flex items-center gap-0.5 flex-1">
            {sections.map((section) => (
              <Link
                key={section.slug}
                href={`/docs/${section.slug}`}
                className="px-3 py-1.5 ff-p-14 text-muted-foreground hover:text-foreground hover:bg-muted/50 rounded-md transition-colors whitespace-nowrap"
              >
                {section.label}
              </Link>
            ))}
          </nav>

          <div className="flex items-center gap-2 ml-auto">
            <ThemeToggle />
          </div>
        </div>
      </header>

      <main className="flex-1">
        <section className="relative overflow-hidden">
          <div className="absolute inset-0 bg-gradient-to-b from-primary/5 via-transparent to-transparent" />
          <div className="relative mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 pt-20 pb-16 sm:pt-32 sm:pb-24 text-center">
            <div className="inline-flex items-center gap-2 rounded-full border bg-muted/50 px-3.5 py-1 ff-p-14 text-muted-foreground mb-8">
              <Activity className="h-3.5 w-3.5 text-primary" />
              Open infrastructure for civic service measurement
            </div>

            <h1 className="ff-p-48 bold mb-6">
              Measure whether civic services{" "}
              <span className="text-primary">actually work</span>
            </h1>

            <p className="ff-p-16 text-muted-foreground max-w-2xl mx-auto mb-10">
              {meta?.site_description ||
                "Open infrastructure for measuring whether civic services actually work when residents try to use them."}
            </p>

            <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
              <Link
                href="/docs/why-civikstack"
                className="inline-flex items-center gap-2 rounded-full bg-primary px-5 py-2.5 ff-p-14 medium text-primary-foreground hover:opacity-90 transition-opacity shadow-md"
              >
                Why CivikStack
                <ArrowRight className="h-3.5 w-3.5" />
              </Link>
              <Link
                href="/docs/get-started"
                className="inline-flex items-center gap-2 rounded-full border px-5 py-2.5 ff-p-14 medium hover:bg-muted transition-colors"
              >
                Get Started
              </Link>
            </div>
          </div>
        </section>

        <section className="border-t bg-muted/30">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
            <div className="text-center mb-12">
              <h2 className="ff-p-24 bold mb-5">
                The infrastructure gap in civic services
              </h2>
              <p className="ff-p-16 text-muted-foreground max-w-2xl mx-auto">
                Billions flow into civic services annually. Almost none is measured
                by whether the service actually worked when a resident tried to
                use it. CivikStack closes that gap.
              </p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
              {features.map((feature) => (
                <div
                  key={feature.title}
                  className="rounded-xl border bg-card p-6 transition-all hover:shadow-md hover:border-primary/20"
                >
                  <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary/10 mb-4">
                    <feature.icon className="h-5 w-5 text-primary" />
                  </div>
                  <h3 className="ff-p-16 medium mb-3">{feature.title}</h3>
                  <p className="ff-p-14 text-muted-foreground">
                    {feature.description}
                  </p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="border-t">
          <div className="mx-auto max-w-6xl px-4 sm:px-6 lg:px-8 py-16 sm:py-24">
            <div className="text-center mb-12">
              <h2 className="ff-p-24 bold mb-5">
                Find your path
              </h2>
              <p className="ff-p-16 text-muted-foreground max-w-xl mx-auto">
                Six entry points, each designed for a distinct intent. None
                requires you to already understand the system to begin.
              </p>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 max-w-5xl mx-auto">
              {navLinks.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  className="group rounded-xl border bg-card p-6 transition-all hover:shadow-md hover:border-primary/30"
                >
                  <h3 className="ff-p-16 medium mb-3 group-hover:text-primary transition-colors">
                    {link.title}
                  </h3>
                  <p className="ff-p-14 text-muted-foreground mb-3">
                    {link.description}
                  </p>
                  <span className="inline-flex items-center gap-1 ff-p-14 text-primary medium">
                    Explore
                    <ArrowRight className="h-3.5 w-3.5 group-hover:translate-x-0.5 transition-transform" />
                  </span>
                </Link>
              ))}
            </div>
          </div>
        </section>

        <section className="border-t bg-muted/30">
          <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8 py-16 sm:py-24 text-center">
            <h2 className="ff-p-24 bold mb-5">
              Built for trust. Governed by community.
            </h2>
            <p className="ff-p-16 text-muted-foreground max-w-xl mx-auto mb-8">
              Open source with an irrevocable non-assertion covenant. No entity
              can capture this infrastructure. Counties control their own
              deployments and data.
            </p>
            <Link
              href="/docs/get-started"
              className="inline-flex items-center gap-2 rounded-full bg-primary px-5 py-2.5 ff-p-14 medium text-primary-foreground hover:opacity-90 transition-opacity shadow-md"
            >
              Start deploying
              <ArrowRight className="h-3.5 w-3.5" />
            </Link>
          </div>
        </section>
      </main>

      <footer className="border-t">
        <div className="mx-auto max-w-[90rem] px-4 sm:px-6 lg:px-8 py-8 flex flex-col sm:flex-row items-center justify-between gap-4">
          <p className="ff-p-14 text-muted-foreground">
            {meta?.footer_text || "CivikStack Foundation"}
          </p>
          <p className="ff-p-14 text-muted-foreground">
            Open infrastructure for civic service measurement
          </p>
        </div>
      </footer>
    </div>
  );
}
