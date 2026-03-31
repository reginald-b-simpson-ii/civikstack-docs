import type { DocMeta } from "@/lib/supabase";

interface DocFooterProps {
  meta: DocMeta | null;
}

export function DocFooter({ meta }: DocFooterProps) {
  return (
    <footer className="border-t mt-auto">
      <div className="mx-auto max-w-[90rem] flex items-center justify-between px-4 sm:px-6 lg:px-8 py-6">
        <p className="ff-p-14 text-muted-foreground">
          {meta?.footer_text || "CivikStack Foundation"}
        </p>
        <p className="ff-p-14 text-muted-foreground">
          Open infrastructure for civic service measurement
        </p>
      </div>
    </footer>
  );
}
