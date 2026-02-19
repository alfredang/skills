<div align="center">

# Skills

![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet?logo=anthropic&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-18+-339933?logo=node.js&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Scripts-4EAA25?logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Skills](https://img.shields.io/badge/Skills-26-blue)
![Platforms](https://img.shields.io/badge/Platforms-40+-orange)

**A collection of Claude Code skills to supercharge your development workflow**

[Install Skills](#quick-install) · [Browse Skills](#available-skills) · [Report Bug](https://github.com/alfredang/skills/issues) · [Request Feature](https://github.com/alfredang/skills/issues)

</div>

## Screenshot

<!-- Add a screenshot of your app here -->
<!-- ![Screenshot](screenshot.png) -->

---

## Table of Contents

- [About](#about)
- [Available Skills](#available-skills)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Quick Install](#quick-install)
- [Usage](#usage)
- [Supported Platforms](#supported-platforms)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

---

## About

Skills is a curated collection of 26 reusable automation workflows for Claude Code and 40+ compatible AI coding platforms. Each skill provides a specialized capability — from secure secrets management to one-command cloud deployments — all installable with a single `npx` command.

### Key Features

- **Universal Install** — One command installs to all supported AI platforms automatically
- **Secret Detection** — Scan for 20+ types of exposed credentials before pushing
- **Secrets Management** — Enforce .env-based secrets across all platforms (Node, Python, Go, Rust, Java, Swift, Android, Flutter, etc.)
- **Auto Documentation** — Generate professional READMEs with screenshots, badges, and architecture diagrams
- **One-Click Deploy** — Deploy to Vercel or GitHub Pages with zero manual configuration
- **Social Sharing** — Create engaging LinkedIn posts to showcase your projects
- **Docker Hub** — Build and push Docker images to Docker Hub with auto-generated Dockerfiles
- **Start App** — Auto-detect and start any app on localhost with auto-open browser
- **App Testing** — Test app functionality on localhost or live sites using Playwright MCP
- **AI Research** — Deep research and slide generation via NotebookLM
- **AI Avatars** — Create talking head videos with OmniHuman, Fabric, PixVerse
- **Frontend Design** — Build distinctive, production-grade web interfaces
- **Best Practices** — React, React Native, Stripe, Supabase Postgres, Remotion guidelines

---

## Available Skills

### DevOps & Deployment

| Skill | Description | Install |
|-------|-------------|---------|
| [github-push](./github-push) | Secure git push with secret detection, auto-README, repo setup & discussions | `npx skills add https://github.com/alfredang/skills --skill github-push` |
| [github-about](./github-about) | Auto-update repo description, live site URL & topics from codebase analysis | `npx skills add https://github.com/alfredang/skills --skill github-about` |
| [github-page](./github-page) | Deploy to GitHub Pages with auto-generated Actions workflow | `npx skills add https://github.com/alfredang/skills --skill github-page` |
| [github-pages](./github-pages) | Deploy to GitHub Pages with auto-generated Actions workflow (alternative) | `npx skills add https://github.com/alfredang/skills --skill github-pages` |
| [vercel-deployment](./vercel-deployment) | Deploy to Vercel with auto project naming & auth disable | `npx skills add https://github.com/alfredang/skills --skill vercel-deployment` |
| [docker-hub](./docker-hub) | Build & push Docker images to Docker Hub with auto-generated Dockerfiles | `npx skills add https://github.com/alfredang/skills --skill docker-hub` |
| [start-app](./start-app) | Auto-detect & start any app on localhost with auto-open browser | `npx skills add https://github.com/alfredang/skills --skill start-app` |
| [app-testing](./app-testing) | Test app functionality on localhost or remote live sites using Playwright MCP | `npx skills add https://github.com/alfredang/skills --skill app-testing` |

### Security

| Skill | Description | Install |
|-------|-------------|---------|
| [secrets](./secrets) | Enforce secure secrets management — never hardcode API keys, OAuth2 secrets, tokens, or credentials across all platforms | `npx skills add https://github.com/alfredang/skills --skill secrets` |

### Documentation & Social

| Skill | Description | Install |
|-------|-------------|---------|
| [readme](./readme) | Generate or update professional README.md with Playwright screenshots & badges | `npx skills add https://github.com/alfredang/skills --skill readme` |
| [create-github-readme](./create-github-readme) | Generate professional GitHub README with tech badges, architecture diagrams & screenshots | `npx skills add https://github.com/alfredang/skills --skill create-github-readme` |
| [linkedin-project-post](./linkedin-project-post) | Create LinkedIn posts with emojis, hashtags, features, tech stack & CTA | `npx skills add https://github.com/alfredang/skills --skill linkedin-project-post` |

### Frontend & Design

| Skill | Description | Install |
|-------|-------------|---------|
| [frontend-design](./frontend-design) | Create distinctive, production-grade frontend interfaces with high design quality | `npx skills add https://github.com/alfredang/skills --skill frontend-design` |
| [web-design-guidelines](./web-design-guidelines) | Review UI code for Web Interface Guidelines compliance | `npx skills add https://github.com/alfredang/skills --skill web-design-guidelines` |
| [building-native-ui](./building-native-ui) | Complete guide for building beautiful apps with Expo Router | `npx skills add https://github.com/alfredang/skills --skill building-native-ui` |

### Best Practices & Frameworks

| Skill | Description | Install |
|-------|-------------|---------|
| [vercel-react-best-practices](./vercel-react-best-practices) | React and Next.js performance optimization guidelines from Vercel Engineering | `npx skills add https://github.com/alfredang/skills --skill vercel-react-best-practices` |
| [vercel-react-native-skills](./vercel-react-native-skills) | React Native and Expo best practices for performant mobile apps | `npx skills add https://github.com/alfredang/skills --skill vercel-react-native-skills` |
| [vercel-composition-patterns](./vercel-composition-patterns) | React composition patterns that scale — compound components, render props, context | `npx skills add https://github.com/alfredang/skills --skill vercel-composition-patterns` |
| [stripe-best-practices](./stripe-best-practices) | Best practices for building Stripe integrations | `npx skills add https://github.com/alfredang/skills --skill stripe-best-practices` |
| [supabase-postgres-best-practices](./supabase-postgres-best-practices) | Postgres performance optimization and best practices from Supabase | `npx skills add https://github.com/alfredang/skills --skill supabase-postgres-best-practices` |
| [remotion-best-practices](./remotion-best-practices) | Best practices for Remotion — video creation in React | `npx skills add https://github.com/alfredang/skills --skill remotion-best-practices` |
| [python-performance-optimization](./python-performance-optimization) | Profile and optimize Python code using cProfile, memory profilers & best practices | `npx skills add https://github.com/alfredang/skills --skill python-performance-optimization` |

### AI & Research

| Skill | Description | Install |
|-------|-------------|---------|
| [notebooklm](./notebooklm) | Deep research & slide presentations via NotebookLM MCP | `npx skills add https://github.com/alfredang/skills --skill notebooklm` |
| [ai-avatar-video](./ai-avatar-video) | Create AI avatar and talking head videos with OmniHuman, Fabric, PixVerse | `npx skills add https://github.com/alfredang/skills --skill ai-avatar-video` |

### Tools & Utilities

| Skill | Description | Install |
|-------|-------------|---------|
| [pdf](./pdf) | Comprehensive PDF toolkit — extract text, create, merge, split, fill forms | `npx skills add https://github.com/alfredang/skills --skill pdf` |
| [mcp-builder](./mcp-builder) | Guide for creating MCP servers to integrate external APIs and services | `npx skills add https://github.com/alfredang/skills --skill mcp-builder` |
| [skill-creator](./skill-creator) | Guide for creating effective skills that extend Claude's capabilities | `npx skills add https://github.com/alfredang/skills --skill skill-creator` |
| [find-skills](./find-skills) | Discover and install agent skills from the community | `npx skills add https://github.com/alfredang/skills --skill find-skills` |

---

## Tech Stack

| Category | Technology |
|----------|------------|
| Runtime | Node.js 18+, Shell/Bash, Python 3 |
| AI Platform | Claude Code (Anthropic) |
| Automation | Playwright MCP, GitHub CLI (`gh`) |
| Deployment | Vercel CLI, GitHub Actions, GitHub Pages, Docker Hub |
| Package Manager | npx (skills CLI) |
| Research | NotebookLM MCP |
| Video | OmniHuman, Fabric, PixVerse (inference.sh) |

---

## Architecture

```
┌──────────────────────────────────────────────────────┐
│                  npx skills add                       │
│              (Universal Installer)                    │
└──────────────────┬───────────────────────────────────┘
                   │
                   ▼
┌──────────────────────────────────────────────────────┐
│              ~/.agents/skills/                        │
│              ~/.claude/skills/                        │
│         (Auto-detected by 40+ agents)                │
└──────────────────┬───────────────────────────────────┘
                   │
    ┌──────┬───────┼───────┬──────┬──────┬──────┐
    ▼      ▼       ▼       ▼      ▼      ▼      ▼
┌───────┐┌──────┐┌──────┐┌─────┐┌─────┐┌─────┐┌──────┐
│DevOps ││Secur-││Docs &││Front││Best ││ AI  ││Tools │
│Deploy ││ity   ││Social││end  ││Prac ││Rsrch││Utils │
│(8)    ││(1)   ││(3)   ││(3)  ││(7)  ││(2)  ││(4)   │
└───┬───┘└──┬───┘└──┬───┘└──┬──┘└──┬──┘└──┬──┘└──┬───┘
    │       │       │       │      │      │      │
    ▼       ▼       ▼       ▼      ▼      ▼      ▼
┌───────┐┌──────┐┌──────┐┌─────┐┌─────┐┌─────┐┌──────┐
│gh CLI ││.env  ││Playw-││React││Vercel││NBook││PDF   │
│Vercel ││scan  ││right ││Expo ││React ││LM   ││MCP   │
│Docker ││gitign││MCP   ││CSS  ││RN   ││Infr ││Build │
└───────┘└──────┘└──────┘└─────┘└─────┘└─────┘└──────┘
```

---

## Project Structure

```
skills/
├── ai-avatar-video/               # AI avatar & talking head videos
├── building-native-ui/            # Expo Router native UI guide
├── create-github-readme/          # GitHub README generator
├── docker-hub/                    # Docker Hub build & push
├── find-skills/                   # Skill discovery & install
├── frontend-design/               # Production-grade frontend design
├── github-about/                  # Auto-update repo description & topics
├── github-page/                   # GitHub Pages deployment
├── github-pages/                  # GitHub Pages deployment (alt)
├── github-push/                   # Secure git push with secret detection
│   └── scripts/scan-secrets.sh
├── linkedin-project-post/         # LinkedIn post generator
├── mcp-builder/                   # MCP server creation guide
├── notebooklm/                    # NotebookLM research & slides
├── pdf/                           # PDF manipulation toolkit
├── python-performance-optimization/ # Python profiling & optimization
├── readme/                        # README generator with screenshots
│   ├── templates/
│   └── examples/
├── remotion-best-practices/       # Remotion video best practices
├── secrets/                       # Secure secrets management
│   ├── scripts/scan_secrets.py
│   ├── references/platforms.md
│   └── assets/
├── skill-creator/                 # Skill creation guide
├── start-app/                     # Auto-detect & start any app
├── app-testing/                   # Test app via Playwright MCP
├── stripe-best-practices/         # Stripe integration best practices
├── supabase-postgres-best-practices/ # Postgres optimization
├── vercel-composition-patterns/   # React composition patterns
├── vercel-deployment/             # Vercel deployment automation
├── vercel-react-best-practices/   # React/Next.js optimization
├── vercel-react-native-skills/    # React Native best practices
├── web-design-guidelines/         # Web UI review & accessibility
└── README.md                      # This file
```

---

## Quick Install

Install individual skills with a single command:

```bash
# ===== DevOps & Deployment =====
npx skills add https://github.com/alfredang/skills --skill github-push
npx skills add https://github.com/alfredang/skills --skill github-about
npx skills add https://github.com/alfredang/skills --skill github-page
npx skills add https://github.com/alfredang/skills --skill github-pages
npx skills add https://github.com/alfredang/skills --skill vercel-deployment
npx skills add https://github.com/alfredang/skills --skill docker-hub
npx skills add https://github.com/alfredang/skills --skill start-app
npx skills add https://github.com/alfredang/skills --skill app-testing

# ===== Security =====
npx skills add https://github.com/alfredang/skills --skill secrets

# ===== Documentation & Social =====
npx skills add https://github.com/alfredang/skills --skill readme
npx skills add https://github.com/alfredang/skills --skill create-github-readme
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post

# ===== Frontend & Design =====
npx skills add https://github.com/alfredang/skills --skill frontend-design
npx skills add https://github.com/alfredang/skills --skill web-design-guidelines
npx skills add https://github.com/alfredang/skills --skill building-native-ui

# ===== Best Practices & Frameworks =====
npx skills add https://github.com/alfredang/skills --skill vercel-react-best-practices
npx skills add https://github.com/alfredang/skills --skill vercel-react-native-skills
npx skills add https://github.com/alfredang/skills --skill vercel-composition-patterns
npx skills add https://github.com/alfredang/skills --skill stripe-best-practices
npx skills add https://github.com/alfredang/skills --skill supabase-postgres-best-practices
npx skills add https://github.com/alfredang/skills --skill remotion-best-practices
npx skills add https://github.com/alfredang/skills --skill python-performance-optimization

# ===== AI & Research =====
npx skills add https://github.com/alfredang/skills --skill notebooklm
npx skills add https://github.com/alfredang/skills --skill ai-avatar-video

# ===== Tools & Utilities =====
npx skills add https://github.com/alfredang/skills --skill pdf
npx skills add https://github.com/alfredang/skills --skill mcp-builder
npx skills add https://github.com/alfredang/skills --skill skill-creator
npx skills add https://github.com/alfredang/skills --skill find-skills
```

### Install All Skills at Once

```bash
for skill in github-push github-about github-page github-pages vercel-deployment docker-hub start-app app-testing secrets readme create-github-readme linkedin-project-post frontend-design web-design-guidelines building-native-ui vercel-react-best-practices vercel-react-native-skills vercel-composition-patterns stripe-best-practices supabase-postgres-best-practices remotion-best-practices python-performance-optimization notebooklm ai-avatar-video pdf mcp-builder skill-creator find-skills; do
  npx skills add https://github.com/alfredang/skills --skill "$skill"
done
```

### Update to Latest

Remove and reinstall to get the latest version:

```bash
# Update a single skill
rm -rf ~/.agents/skills/<skill-name> ~/.claude/skills/<skill-name>
npx skills add https://github.com/alfredang/skills --skill <skill-name>
```

**Update all skills at once:**

```bash
for skill in github-push github-about github-page github-pages vercel-deployment docker-hub start-app app-testing secrets readme create-github-readme linkedin-project-post frontend-design web-design-guidelines building-native-ui vercel-react-best-practices vercel-react-native-skills vercel-composition-patterns stripe-best-practices supabase-postgres-best-practices remotion-best-practices python-performance-optimization notebooklm ai-avatar-video pdf mcp-builder skill-creator find-skills; do
  rm -rf ~/.agents/skills/$skill ~/.claude/skills/$skill
  npx skills add https://github.com/alfredang/skills --skill "$skill"
done
```

---

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- [Node.js](https://nodejs.org/) 18+ (for `npx skills`)
- [Git](https://git-scm.com/) & [GitHub CLI](https://cli.github.com/) (`gh`) — for github-push, github-page
- [Vercel CLI](https://vercel.com/cli) — for vercel-deployment (optional)
- [Docker](https://docs.docker.com/get-docker/) — for docker-hub (optional)

---

## Usage

Trigger skills with slash commands:

```
/github-push               # Secure push with secret scan + repo setup
/github-about              # Update repo description, URL & topics
/create_github_readme      # Generate or update README
/github-page               # Deploy to GitHub Pages
/vercel-deployment         # Deploy to Vercel
/docker-hub                # Build & push to Docker Hub
/start-app                 # Auto-detect & start app on localhost
/test-app                  # Test app functionality via Playwright MCP
/linkedin-post             # Create a LinkedIn post
/notebooklm                # Deep research & slides
```

Or use natural language:

- "push to github safely"
- "update my repo description and topics"
- "create a readme for my project"
- "deploy to github pages"
- "deploy to vercel"
- "push docker image to docker hub"
- "start the app"
- "test my app on localhost"
- "test my live site"
- "write a linkedin post about my app"
- "create a podcast about this topic"
- "review my UI for accessibility"
- "build a landing page"
- "create an AI avatar video"
- "scan my code for hardcoded secrets"
- "set up .env for my project"

---

## Supported Platforms

Skills are automatically installed to all supported AI coding assistants (40+):

| Category | Platforms |
|----------|-----------|
| **Popular** | Claude Code, Cursor, Windsurf, GitHub Copilot, Continue, Cline |
| **AI Assistants** | OpenHands, Codex, Gemini CLI, Kimi Code CLI, Qwen Code, Mistral Vibe |
| **IDE Extensions** | Augment, CodeBuddy, Kilo Code, Roo Code, Zencoder, Junie |
| **CLI Tools** | OpenCode, Goose, Command Code, Kiro CLI, iFlow CLI, Pi |
| **Enterprise** | Factory AI/Droid, Antigravity, Replit, Amp |
| **Others** | Trae, Kode, MCPJam, Mux, Qoder, Crush, OpenClaw, Neovate, Pochi, AdaL |

---

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Skill doesn't appear in `/skills` | Remove and reinstall (see [Update to Latest](#update-to-latest)), then restart editor |
| `npx skills add` says skill already exists | Remove existing first: `rm -rf ~/.agents/skills/<name> ~/.claude/skills/<name>` then reinstall |
| Skill is outdated | Same as above — remove and reinstall to pull the latest version |
| Skill not working after update | Restart your editor/terminal, then run `/skills` to verify |

---

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-skill`)
3. Commit your changes (`git commit -m 'Add amazing skill'`)
4. Push to the branch (`git push origin feature/amazing-skill`)
5. Open a Pull Request

---

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Acknowledgements

- [Anthropic](https://www.anthropic.com/) — Claude Code platform
- [Playwright](https://playwright.dev/) — Browser automation for screenshot capture
- [shields.io](https://shields.io/) — Badge generation
- [GitHub CLI](https://cli.github.com/) — Repository management automation
- Thanks to all contributors and the Claude Code community

---

<div align="center">

**Developed by [Tertiary Infotech Academy Pte. Ltd.](https://github.com/alfredang)**

If you find these skills useful, please give us a star!

Made with [Claude Code](https://claude.ai/code)

</div>
