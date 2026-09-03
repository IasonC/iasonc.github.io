# CLAUDE.md

Personal site of Iason Chaimalas — <https://iasonc.github.io>.

Built on **al-folio v1.x**, which ships as gems rather than as files in this repo.
The layouts, includes and Sass live in `al_folio_core` plus ~20 `al_*` plugin gems
(see `Gemfile`). This repo holds content, config, and a small number of deliberate
overrides.

> Any `AGENTS.md`/`CLAUDE.md` you may have seen from upstream al-folio was written
> for people developing the *theme*, and forbids creating `_layouts/`, `_includes/`
> or `_sass/`. That rule does not apply here — a site built from the template is
> explicitly allowed to shadow gem-owned files, and this one does.

## Local development

```powershell
.\serve.ps1          # http://localhost:4000, live reload
```

Windows notes, both already handled by `serve.ps1`:

- `jekyll-imagemagick` shells out to `convert`, but ImageMagick 7 dropped that alias
  and Windows resolves the name to `C:\Windows\System32\convert.exe` (the disk tool).
  `_tools/convert.cmd` shims it to `magick`.
- The plugin **skips regenerating responsive variants whose output already exists**.
  After replacing an image with one of the same filename, `rm -rf _site .jekyll-cache`
  or you will keep serving the old picture.

## Where things live

| Change | File |
| --- | --- |
| Name, tagline, tabs, site URL | `_config.yml` |
| Sidebar/footer social links | `_data/socials.yml` |
| About page copy, portrait | `_pages/about.md` |
| Publications | `_bibliography/papers.bib` |
| Portrait images | `assets/img/prof_pic.jpg`, `prof_pic_hover.jpg` |
| Paper thumbnails | `assets/img/publication_preview/` |
| Posts | `_posts/YYYY-MM-DD-slug.md` |

## Theme overrides — keep this list current

Each shadows a gem file and must be re-diffed if al-folio is upgraded:

| File | Why it exists |
| --- | --- |
| `assets/css/main.scss` | Portrait hover swap, orange accent, wider photo gutter, even social-icon spacing, no rule above year headings. Everything above the "site customisations" marker is a verbatim copy of the gem's file. |
| `_layouts/about.liquid` | "selected publications" heading renamed to "Publications". |
| `_layouts/bib.liquid` | `arXiv`/`HTML` link buttons both relabelled `PAPER`, and the `html` block moved above `bib` so button order is consistent. |

**Front matter must be the first thing in an overridden layout.** Putting a comment
above the `---` fence stops Jekyll parsing it and renders `---` as visible text.

## Deploying

Push to `main`. `.github/workflows/deploy.yml` builds on Ubuntu and pushes `_site` to
the `gh-pages` branch, which GitHub Pages serves. Never build for production locally.

The Cloudflare Web Analytics token is **not** in this repo: the workflow injects it
from the `CLOUDFLARE_ANALYTICS_TOKEN` repository variable, so local builds never send
beacons and previews stay out of the stats.

## Currently off

Writings/blog (`nav: false` in `_pages/blog.md`, `latest_posts.enabled: false` in
`_pages/about.md`, and the sample post carries `published: false`), plus news,
projects, teaching, CV and repositories pages.
