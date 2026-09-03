# iasonc.github.io

Personal site of Iason Chaimalas — <https://iasonc.github.io>

Built with [Jekyll](https://jekyllrb.com/) and the
[al-folio](https://github.com/alshedivat/al-folio) theme (v1.x, consumed as gems).

## Develop

```powershell
.\serve.ps1     # http://localhost:4000
```

Requires Ruby 3.3 and ImageMagick. First run: `bundle install`.

## Deploy

Push to `main`. GitHub Actions builds the site and publishes it to the `gh-pages`
branch, which GitHub Pages serves.

See [CLAUDE.md](CLAUDE.md) for where content lives, the list of theme overrides, and
the Windows-specific build notes.
