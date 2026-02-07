<div align="center">

# Skills

![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet?logo=anthropic&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-18+-339933?logo=node.js&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Scripts-4EAA25?logo=gnubash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)
![Skills](https://img.shields.io/badge/Skills-6-blue)
![Platforms](https://img.shields.io/badge/Platforms-40+-orange)

**A collection of Claude Code skills to supercharge your development workflow**

[Install Skills](#quick-install) · [Browse Skills](#available-skills) · [Report Bug](https://github.com/alfredang/skills/issues) · [Request Feature](https://github.com/alfredang/skills/issues)

</div>

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

Skills is a curated collection of reusable automation workflows for Claude Code and 40+ compatible AI coding platforms. Each skill provides a specialized capability — from secure git operations with secret detection to one-command cloud deployments — all installable with a single `npx` command.

### Key Features

- **Universal Install** — One command installs to all supported AI platforms automatically
- **Secret Detection** — Scan for 20+ types of exposed credentials before pushing
- **Auto Documentation** — Generate professional READMEs with screenshots, badges, and architecture diagrams
- **One-Click Deploy** — Deploy to Vercel or GitHub Pages with zero manual configuration
- **Social Sharing** — Create engaging LinkedIn posts to showcase your projects
- **AI Research** — Deep research and slide generation via NotebookLM

---

## Available Skills

| Skill | Description | Command | Install |
|-------|-------------|---------|---------|
| [github-push](./github-push) | Secure git push with secret detection, auto-README, repo setup & discussions | `/github-push` | `npx skills add https://github.com/alfredang/skills --skill github-push` |
| [readme](./readme) | Generate or update professional README.md with Playwright screenshots & badges | `/create_github_readme` | `npx skills add https://github.com/alfredang/skills --skill readme` |
| [github-page](./github-page) | Deploy to GitHub Pages with auto-generated Actions workflow | `/github-page` | `npx skills add https://github.com/alfredang/skills --skill github-page` |
| [vercel-deployment](./vercel-deployment) | Deploy to Vercel with auto project naming & auth disable | `/vercel-deployment` | `npx skills add https://github.com/alfredang/skills --skill vercel-deployment` |
| [linkedin-project-post](./linkedin-project-post) | Create exciting LinkedIn posts with emojis, hashtags & screenshots | `/linkedin-post` | `npx skills add https://github.com/alfredang/skills --skill linkedin-project-post` |
| [notebooklm](./notebooklm) | Deep research & slide presentations via NotebookLM MCP | `/notebooklm` | `npx skills add https://github.com/alfredang/skills --skill notebooklm` |

---

## Tech Stack

| Category | Technology |
|----------|------------|
| Runtime | Node.js 18+, Shell/Bash |
| AI Platform | Claude Code (Anthropic) |
| Automation | Playwright MCP, GitHub CLI (`gh`) |
| Deployment | Vercel CLI, GitHub Actions, GitHub Pages |
| Package Manager | npx (skills CLI) |
| Research | NotebookLM MCP |

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
        ┌──────────┼──────────┬──────────┬─────────┐
        ▼          ▼          ▼          ▼         ▼
  ┌──────────┐ ┌────────┐ ┌────────┐ ┌───────┐ ┌──────┐
  │ github-  │ │ readme │ │ vercel │ │github-│ │ more │
  │  push    │ │        │ │ deploy │ │ page  │ │  ... │
  └────┬─────┘ └───┬────┘ └───┬────┘ └───┬───┘ └──────┘
       │           │          │          │
       ▼           ▼          ▼          ▼
  ┌──────────┐ ┌────────┐ ┌────────┐ ┌────────┐
  │ Secret   │ │Playwr- │ │Vercel  │ │GitHub  │
  │ Scanner  │ │ight MCP│ │  CLI   │ │Actions │
  │ + gh CLI │ │+ gh CLI│ │+ API   │ │+ API   │
  └──────────┘ └────────┘ └────────┘ └────────┘
```

---

## Project Structure

```
skills/
├── github-push/                # Secure git push with secret detection
│   ├── SKILL.md                #   Skill definition & instructions
│   ├── README.md               #   Usage documentation
│   ├── examples.md             #   Example prompts & outputs
│   └── scripts/
│       └── scan-secrets.sh     #   Secret scanning script
├── readme/                     # README generator with screenshots
│   ├── SKILL.md                #   Skill definition & instructions
│   ├── README.md               #   Usage documentation
│   ├── examples.md             #   Example prompts & outputs
│   └── scripts/                #   Helper scripts
├── github-page/                # GitHub Pages deployment
│   ├── SKILL.md                #   Skill definition & instructions
│   ├── README.md               #   Usage documentation
│   ├── examples.md             #   Example prompts & outputs
│   └── scripts/
│       └── setup-gh-pages.sh   #   Pages setup script
├── vercel-deployment/          # Vercel deployment automation
│   ├── SKILL.md                #   Skill definition & instructions
│   └── scripts/
│       └── deploy.sh           #   Deploy & auth disable script
├── linkedin-project-post/      # LinkedIn post generator
│   ├── SKILL.md                #   Skill definition & instructions
│   ├── README.md               #   Usage documentation
│   ├── examples.md             #   Example prompts & outputs
│   └── scripts/
│       └── capture-screenshot.sh  # Screenshot capture script
├── notebooklm/                 # NotebookLM research & slides
│   ├── SKILL.md                #   Skill definition & instructions
│   └── README.md               #   Usage documentation
└── README.md                   # This file
```

---

## Quick Install

Install individual skills with a single command:

```bash
# GitHub Push (Secret Scanner + Repo Setup)
npx skills add https://github.com/alfredang/skills --skill github-push

# README Generator (with Playwright screenshots)
npx skills add https://github.com/alfredang/skills --skill readme

# GitHub Pages Deployment
npx skills add https://github.com/alfredang/skills --skill github-page

# Vercel Deployment
npx skills add https://github.com/alfredang/skills --skill vercel-deployment

# LinkedIn Post Generator
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post

# NotebookLM (Research & Slides)
npx skills add https://github.com/alfredang/skills --skill notebooklm
```

### Update to Latest

If the skill already exists, remove it first then reinstall to get the latest version:

```bash
# Update a single skill
rm -rf ~/.agents/skills/<skill-name> ~/.claude/skills/<skill-name>
npx skills add https://github.com/alfredang/skills --skill <skill-name>
```

**Update all skills at once:**

```bash
# Remove all existing skills
rm -rf ~/.agents/skills/github-push ~/.claude/skills/github-push
rm -rf ~/.agents/skills/readme ~/.claude/skills/readme
rm -rf ~/.agents/skills/github-page ~/.claude/skills/github-page
rm -rf ~/.agents/skills/vercel-deployment ~/.claude/skills/vercel-deployment
rm -rf ~/.agents/skills/linkedin-project-post ~/.claude/skills/linkedin-project-post
rm -rf ~/.agents/skills/notebooklm ~/.claude/skills/notebooklm

# Reinstall all with latest
npx skills add https://github.com/alfredang/skills --skill github-push
npx skills add https://github.com/alfredang/skills --skill readme
npx skills add https://github.com/alfredang/skills --skill github-page
npx skills add https://github.com/alfredang/skills --skill vercel-deployment
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post
npx skills add https://github.com/alfredang/skills --skill notebooklm
```

---

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- [Node.js](https://nodejs.org/) 18+ (for `npx skills`)
- [Git](https://git-scm.com/) & [GitHub CLI](https://cli.github.com/) (`gh`) — for github-push, github-page
- [Vercel CLI](https://vercel.com/cli) — for vercel-deployment (optional)

---

## Usage

Trigger skills with slash commands:

```
/github-push               # Secure push with secret scan + repo setup
/create_github_readme      # Generate or update README
/github-page               # Deploy to GitHub Pages
/vercel-deployment         # Deploy to Vercel
/linkedin-post             # Create a LinkedIn post
/notebooklm                # Deep research & slides
```

Or use natural language:

- "push to github safely"
- "create a readme for my project"
- "update the readme"
- "deploy to github pages"
- "deploy to vercel"
- "write a linkedin post about my app"
- "create a podcast about this topic"

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

<div align="center">

Made with [Claude Code](https://claude.ai/code)

</div>
