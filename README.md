# CivikStack Documentation

Open infrastructure for measuring whether civic services actually work when residents try to use them.

## Overview

CivikStack is the infrastructure that closes the gap between promised and actual civic services. Every year, billions of dollars flow into civic services — almost none of it is measured by whether the service actually worked when a resident tried to use it. CivikStack closes that gap.

This repository contains the CivikStack documentation site — a Next.js application backed by Supabase, covering the full CivikStack ecosystem including architecture, deployment, governance, and community resources.

## Documentation Sections

| Section | Description |
|---|---|
| **Why CivikStack** | The case for measuring whether civic services actually work |
| **How It Works** | The mechanism from pathway artifacts through drift detection to governance |
| **Get Started** | Deployment paths for counties, agencies, frontline workers, and compliance officers |
| **Build** | Technical reference for developers building on or extending CivikStack |
| **Govern** | Constitutional framework, RFC process, working groups, and federal compliance alignment |
| **Community** | For advocates, residents, practitioners, researchers, and journalists |

## Tech Stack

- **Framework** — [Next.js 13](https://nextjs.org/) (App Router)
- **Database** — [Supabase](https://supabase.com/) (PostgreSQL)
- **Styling** — [Tailwind CSS](https://tailwindcss.com/)
- **UI Components** — [shadcn/ui](https://ui.shadcn.com/)
- **Deployment** — [Netlify](https://netlify.com/)

## Getting Started

### Prerequisites

- Node.js 18+
- A Supabase project (cloud or local)

### Installation

```bash
# Install dependencies
npm install

# Set up environment variables
cp .env.example .env
# Add your Supabase URL and anon key to .env

# Run the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to view the documentation site.

### Local Supabase Setup

```bash
# Install Supabase CLI
npm install -g supabase

# Start local Supabase stack
supabase start

# Migrations are applied automatically on start
```

Update `.env` to point to your local instance:
```
NEXT_PUBLIC_SUPABASE_URL=http://127.0.0.1:54321
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your-local-anon-key>
```

## Database Migrations

All schema and seed migrations are located in `supabase/migrations/`. They create and populate:

- Navigation sections and sidebar groups
- Documentation pages and metadata
- Banner and branding configuration

## The Founding Commitment

> *The gap between promised and actual civic services should not be invisible.*

Every design decision, architectural choice, and governance process in CivikStack flows from this single commitment.

## License

This project is licensed under the Apache License 2.0 — see the [LICENSE](LICENSE) file for details.
