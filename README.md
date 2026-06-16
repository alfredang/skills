<div align="center">

# Skills

![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet?logo=anthropic&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-18+-339933?logo=node.js&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Scripts-4EAA25?logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Skills](https://img.shields.io/badge/Skills-7-blue)
![Commands](https://img.shields.io/badge/Commands-3-blueviolet)
![Platforms](https://img.shields.io/badge/Platforms-40+-orange)

**Custom Claude Code skills & commands by Tertiary Infotech Academy Pte. Ltd. to supercharge your development workflow**

[Install](#quick-install) · [Browse Skills](#available-skills) · [Browse Commands](#available-commands) · [Report Bug](https://github.com/alfredang/skills/issues) · [Request Feature](https://github.com/alfredang/skills/issues)

</div>

## Screenshot

<!-- Add a screenshot of your app here -->
<!-- ![Screenshot](screenshot.png) -->

---

## Table of Contents

- [About](#about)
- [Skills vs Commands](#skills-vs-commands)
- [Available Skills](#available-skills)
- [Available Commands](#available-commands)
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

A curated collection of **7 skills** and **3 slash commands** for Claude Code and 40+ compatible AI coding platforms, authored and maintained by **Tertiary Infotech Academy Pte. Ltd.** Each one provides a specialized capability — from secure git pushes to one-command Docker pushes and iOS App Store submission.

### Key Features

- **Secure Git Push** — Scan for 20+ credential types, auto-README, repo About, Discussions, optional PR & GitHub Pages deploy
- **Auto Documentation** — Generate professional READMEs with Playwright screenshots, badges, and architecture diagrams
- **App Store Submission** — API-first iOS App Store submission with a field-tested App Review checklist
- **Docker Hub** — Build and push Docker images to Docker Hub with auto-generated Dockerfiles
- **Start App** — Auto-detect and start any app on localhost
- **App Testing** — Test functionality and mobile responsiveness on localhost or live sites via Playwright MCP
- **iOS Design** — Master Apple Human Interface Guidelines and SwiftUI patterns
- **AI Research** — Deep research and slide generation via NotebookLM
- **AI Avatars** — Create talking head videos with OmniHuman, Fabric, PixVerse
- **Social Sharing** — Create engaging LinkedIn posts to showcase your projects

---

## Skills vs Commands

- **Skills** install into `~/.agents/skills/` and `~/.claude/skills/` and are **auto-invoked** by the model when your request matches their description.
- **Commands** live in `commands/` and are **explicitly invoked** with a slash command (e.g. `/github-push`). Use these when you want deterministic, on-demand execution rather than auto-triggering.

---

## Available Skills

### DevOps & Deployment

| Skill | Description | Install |
|-------|-------------|---------|
| [docker-hub](./docker-hub) | Build & push Docker images to Docker Hub with auto-generated Dockerfiles | `npx skills add https://github.com/alfredang/skills --skill docker-hub` |
| [app-testing](./app-testing) | Test app functionality & mobile responsiveness on localhost or live sites using Playwright MCP | `npx skills add https://github.com/alfredang/skills --skill app-testing` |
| [app-store-submission](./app-store-submission) | API-first iOS App Store submission via the App Store Connect API + Xcode CLI, with a field-tested App Review rejection + resubmission checklist | `npx degit alfredang/skills/app-store-submission .claude/skills/app-store-submission` |

### Documentation

| Skill | Description | Install |
|-------|-------------|---------|
| [readme](./readme) | Generate or update professional README.md with Playwright screenshots, badges & architecture diagrams | `npx skills add https://github.com/alfredang/skills --skill readme` |

### Mobile & Design

| Skill | Description | Install |
|-------|-------------|---------|
| [mobile-ios-design](./mobile-ios-design) | Master iOS Human Interface Guidelines and SwiftUI patterns for polished native iOS apps | `npx degit alfredang/skills/mobile-ios-design .claude/skills/mobile-ios-design` |

### AI & Research

| Skill | Description | Install |
|-------|-------------|---------|
| [notebooklm](./notebooklm) | Deep research & slide presentations via NotebookLM MCP | `npx skills add https://github.com/alfredang/skills --skill notebooklm` |
| [ai-avatar-video](./ai-avatar-video) | Create AI avatar and talking head videos with OmniHuman, Fabric, PixVerse | `npx skills add https://github.com/alfredang/skills --skill ai-avatar-video` |

---

## Available Commands

Slash commands invoked explicitly. Install by copying the file into your project's `.claude/commands/` with degit:

| Command | Description | Install |
|---------|-------------|---------|
| [/github-push](./commands/github-push.md) | Secure git push — blocks secrets/keys/passwords, pushes code, adds/updates README + screenshot (via readme skill), updates repo About (description/URL/topics) & Discussions, auto-deploys static sites to GitHub Pages via Actions (optional PR) | `npx degit alfredang/skills/commands/github-push.md .claude/commands/github-push.md` |
| [/start-app](./commands/start-app.md) | Auto-detect project type and start any app on localhost on a free port, then open the browser | `npx degit alfredang/skills/commands/start-app.md .claude/commands/start-app.md` |
| [/linkedin-project-post](./commands/linkedin-project-post.md) | Generate an exciting LinkedIn post with screenshot, links, features, tech stack, CTA & hashtags (auto-publish via LinkedIn MCP) | `npx degit alfredang/skills/commands/linkedin-project-post.md .claude/commands/linkedin-project-post.md` |

---

## Tech Stack

| Category | Technology |
|----------|------------|
| Runtime | Node.js 18+, Shell/Bash, Python 3 |
| AI Platform | Claude Code (Anthropic) |
| Automation | Playwright MCP, GitHub CLI (`gh`) |
| Deployment | GitHub Actions, GitHub Pages, Docker Hub |
| Mobile | App Store Connect API, Xcode CLI, SwiftUI |
| Package Manager | npx (skills CLI / degit) |
| Research | NotebookLM MCP |
| Video | OmniHuman, Fabric, PixVerse (inference.sh) |

---

## Architecture

```
┌──────────────────────────────────────────────────────┐
│         npx skills add  /  npx degit (commands)       │
└──────────────────┬───────────────────────────────────┘
                   │
         ┌─────────┴──────────┐
         ▼                    ▼
┌──────────────────┐  ┌──────────────────┐
│  ~/.claude/      │  │  ~/.claude/      │
│    skills/       │  │    commands/     │
│ (auto-invoked)   │  │ (slash-invoked)  │
└────────┬─────────┘  └────────┬─────────┘
         │                     │
   ┌─────┼─────┬─────┐    ┌────┼─────┬──────────┐
   ▼     ▼     ▼     ▼    ▼    ▼     ▼          ▼
 DevOps Docs Mobile AI  github start linkedin  (more)
 Deploy      /iOS Rsrch  push   app    post
  (3)   (1)  (1)  (2)
```

---

## Project Structure

```
skills/
├── ai-avatar-video/               # AI avatar & talking head videos
├── app-store-submission/          # API-first iOS App Store submission
│   └── scripts/                   # asc_submit.py, asc_jwt.swift, asset generators
├── app-testing/                   # Test app functionality & mobile responsiveness via Playwright MCP
├── docker-hub/                    # Docker Hub build & push
├── mobile-ios-design/             # iOS HIG + SwiftUI design patterns
│   └── references/                # hig-patterns, ios-navigation, swiftui-components
├── notebooklm/                    # NotebookLM research & slides
├── readme/                        # README generator with screenshots
│   ├── templates/
│   └── examples/
├── commands/                      # Slash commands (explicitly invoked)
│   ├── github-push.md             # Secure git push + repo setup + Pages
│   ├── start-app.md               # Auto-detect & start any app
│   └── linkedin-project-post.md   # LinkedIn post generator
├── CLAUDE.md                      # Repo context for Claude Code
└── README.md                      # This file
```

---

## Quick Install

### Skills

```bash
# ===== DevOps & Deployment =====
npx skills add https://github.com/alfredang/skills --skill docker-hub
npx skills add https://github.com/alfredang/skills --skill app-testing
npx degit alfredang/skills/app-store-submission .claude/skills/app-store-submission   # bundles scripts/

# ===== Documentation =====
npx skills add https://github.com/alfredang/skills --skill readme

# ===== Mobile & Design =====
npx degit alfredang/skills/mobile-ios-design .claude/skills/mobile-ios-design          # bundles references/

# ===== AI & Research =====
npx skills add https://github.com/alfredang/skills --skill notebooklm
npx skills add https://github.com/alfredang/skills --skill ai-avatar-video
```

### Commands

```bash
npx degit alfredang/skills/commands/github-push.md          .claude/commands/github-push.md
npx degit alfredang/skills/commands/start-app.md            .claude/commands/start-app.md
npx degit alfredang/skills/commands/linkedin-project-post.md .claude/commands/linkedin-project-post.md
```

> **degit** copies a single file or subfolder of this repo straight into your project (no git history).
> Skills that bundle helper scripts / references (`app-store-submission`, `mobile-ios-design`) and all
> commands are installed via `degit` so the full folder/file lands in your project where Claude Code
> picks it up automatically.

### Update to Latest

```bash
# Skill — remove and reinstall
rm -rf ~/.agents/skills/<skill-name> ~/.claude/skills/<skill-name>
npx skills add https://github.com/alfredang/skills --skill <skill-name>

# Command — re-copy with --force
npx degit --force alfredang/skills/commands/<name>.md .claude/commands/<name>.md
```

---

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- [Node.js](https://nodejs.org/) 18+ (for `npx skills` / `npx degit`)
- [Git](https://git-scm.com/) & [GitHub CLI](https://cli.github.com/) (`gh`) — for `/github-push`
- [Docker](https://docs.docker.com/get-docker/) — for docker-hub (optional)
- [Xcode](https://developer.apple.com/xcode/) & an Apple Developer account — for app-store-submission (optional)

---

## Usage

Run commands explicitly:

```
/github-push               # Secure push + README + repo setup (+ pages to also deploy GitHub Pages)
/start-app                 # Auto-detect & start app on localhost
/linkedin-project-post     # Create a LinkedIn post
```

Or just describe what you want — matching **skills** auto-trigger:

- "push docker image to docker hub"
- "create a readme for my project"
- "test my app on localhost"
- "test mobile responsiveness on my live site"
- "submit my iOS app to the App Store"
- "design an iOS screen with SwiftUI"
- "deep research this topic and make slides"
- "create an AI avatar video"

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
| Command doesn't appear under `/` | Confirm the file is at `.claude/commands/<name>.md`, then restart your editor |
| `npx skills add` says skill already exists | Remove existing first: `rm -rf ~/.agents/skills/<name> ~/.claude/skills/<name>` then reinstall |
| Skill is outdated | Same as above — remove and reinstall to pull the latest version |

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
