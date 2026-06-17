# Anh Bui — Software Engineer Portfolio

Source for [anhbui.dev](https://anhbui.dev), the personal portfolio and blog of Anh Bui, a senior .NET engineer building reliable cloud systems on Azure.

## 🛠️ Built With

- [Astro](https://astro.build/) — web framework (static output)
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS
- [DaisyUI](https://daisyui.com/) — Tailwind component library (with theme controller)
- [MDX](https://docs.astro.build/en/guides/integrations-guide/mdx/) — authoring case studies
- [@astrojs/sitemap](https://docs.astro.build/en/guides/integrations-guide/sitemap/) & [@astrojs/rss](https://docs.astro.build/en/guides/rss/) — sitemap + RSS feed
- [Vercel Web Analytics](https://vercel.com/analytics) — traffic insights
- Deployed on [Vercel](https://vercel.com/)

## 🚀 Project Structure

```text
/
├── public/                  # static assets (icons, images, robots.txt)
├── src/
│   ├── components/          # UI components (Header, Footer, SideBar, ThemeController, …)
│   │   └── cv/              # CV-specific components (TimeLine)
│   ├── content/
│   │   ├── case-studies/    # case study posts (Markdown / MDX)
│   │   └── config.ts        # content collection schema
│   ├── layouts/             # BaseLayout, PostLayout
│   ├── lib/                 # helpers (createSlug)
│   ├── pages/               # routes
│   │   ├── case-studies/    # case study list + tag pages
│   │   ├── index.astro      # home
│   │   ├── cv.astro         # CV
│   │   ├── products.astro   # products
│   │   ├── projects.astro   # projects
│   │   ├── contact.astro    # contact
│   │   ├── recommendations.astro
│   │   └── rss.xml.js        # RSS feed endpoint
│   ├── styles/              # global.css
│   ├── config.ts            # global site data (title, description, flags)
│   └── env.d.ts
├── astro.config.mjs
├── tailwind.config.cjs
└── package.json
```

## 🧞 Commands

Run from the project root in a terminal:

| Command           | Action                                       |
| :---------------- | :------------------------------------------- |
| `npm install`     | Install dependencies                         |
| `npm run dev`     | Start local dev server at `localhost:4321`   |
| `npm run build`   | Build production site to `./dist/`           |
| `npm run preview` | Preview the build locally before deploying   |
| `npm run astro`   | Run Astro CLI commands                        |

## ✍️ Adding a Case Study

1. Add a `.md` or `.mdx` file under `src/content/case-studies/`.
2. Include the required frontmatter (`title`, `description`, `pubDate`); optional: `updatedDate`, `heroImage`, `badge`, `tags`. Schema lives in [`src/content/config.ts`](src/content/config.ts).
3. The post is auto-listed, tagged, and added to the RSS feed.

## ⚙️ Site Configuration

Global values (site title, description, feature flags like `GENERATE_SLUG_FROM_TITLE` and `TRANSITION_API`) live in [`src/config.ts`](src/config.ts).

## 👤 Author

**Anh Bui** — Senior .NET Engineer
- [LinkedIn](https://www.linkedin.com/in/btanh/)
- [GitHub](https://github.com/AnhBuiDeveloper)
