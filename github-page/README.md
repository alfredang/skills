# GitHub Pages

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Deployment](https://img.shields.io/badge/Deploy-GitHub_Pages-blue)](https://pages.github.com)

Deploy any project to GitHub Pages with zero manual configuration. Auto-detects project type, generates the GitHub Actions workflow, and enables Pages + Actions via API.

## Installation

```bash
npx skills add https://github.com/alfredang/skills --skill github-page
```

## Usage

Once installed, trigger the skill using:

```
/github-page
```

Or use natural language:
- "deploy to github pages"
- "set up github pages for my project"
- "host my site on github pages"
- "deploy my react app to github pages"
- "enable github pages"

## Features

| Feature | Description |
|---------|-------------|
| **Auto-detect Project** | Detects static HTML, React, Vite, Next.js, Angular, MkDocs |
| **Workflow Generation** | Creates `.github/workflows/deploy-pages.yml` automatically |
| **Auto-authenticate** | Auto-runs `gh auth login --web` if not logged in — no manual auth needed |
| **Auto-enable Pages** | Enables GitHub Pages via API — no manual config needed |
| **Auto-enable Actions** | Enables GitHub Actions and triggers first deployment |
| **Framework Config** | Warns about missing `base` (Vite) or `output: 'export'` (Next.js) |
| **Node.js Detection** | Reads `.nvmrc` or `engines.node` for correct Node version |

## Workflow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Pre-flight     │────▶│  Detect Project  │────▶│  Gen Workflow   │
│  (gh CLI, git)  │     │  (type, build)   │     │  (Actions YAML) │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
                                                        ▼
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Verify & URL   │◀────│  Enable Pages   │◀────│  Push Workflow  │
│                 │     │  + Actions API  │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## Supported Project Types

| Type | Detection | Build | Output |
|------|-----------|-------|--------|
| Static HTML | `index.html` in root | None | `./` |
| Vite (React/Vue) | `vite.config.*` | `npm run build` | `./dist` |
| Next.js | `next.config.*` | `npm run build` | `./out` |
| Angular | `angular.json` | `npm run build` | `./dist/<app>` |
| MkDocs | `mkdocs.yml` | `mkdocs build` | `./site` |
| Custom | Ask user | User-defined | User-defined |

## Skill Structure

```
github-page/
├── SKILL.md              # Skill definition
├── README.md             # This file
├── examples.md           # Example usage
└── scripts/
    └── setup-gh-pages.sh # Pages + Actions setup script
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- Git installed and configured with a GitHub remote
- [GitHub CLI](https://cli.github.com/) (`gh`) installed (auto-authenticates via browser if needed)

## Keywords

`github pages` `deploy pages` `static site` `gh-pages` `github actions` `deploy website` `host website` `github hosting` `free hosting` `publish site` `deploy html` `deploy react`

## License

MIT
