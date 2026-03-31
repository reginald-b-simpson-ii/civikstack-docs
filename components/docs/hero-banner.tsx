interface HeroBannerProps {
  title?: string;
}

export function HeroBanner({ title }: HeroBannerProps) {
  return (
    <div className="w-full h-48 md:h-64 relative overflow-hidden">
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src="https://images.unsplash.com/photo-1614850523011-8f49ffc73908?auto=format&fit=crop&w=2000&q=80"
        alt=""
        className="w-full h-full object-cover"
      />
      {title && (
        <div className="absolute inset-0 flex items-center justify-center bg-black/20">
          <h1 className="text-white text-4xl md:text-5xl font-bold tracking-tight drop-shadow-lg">
            {title}
          </h1>
        </div>
      )}
    </div>
  );
}
