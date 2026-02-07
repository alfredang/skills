# GitHub About

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-About_Section-blue)](https://github.com)

Auto-update your GitHub repo's About section — description, live site URL, and topics — by analyzing your codebase. No manual repo settings needed.

## Installation

```bash
npx skills add https://github.com/alfredang/skills --skill "GitHub About"
```

## Usage

Once installed, trigger the skill using:

```
/github-about
```

Or use natural language:
- "update my repo description"
- "set the github about section"
- "add topics to my repo"
- "set the live site url on github"
- "update repo metadata"

## Features

| Feature | Description |
|---------|-------------|
| **Auto-authenticate** | Auto-runs `gh auth login --web` if not logged in |
| **Smart Description** | Analyzes README, package.json, and source to generate a compelling description |
| **Live Site Detection** | Finds deployment URLs from Vercel, GitHub Pages, Netlify, and more |
| **Tech Stack Topics** | Detects languages, frameworks, and platforms to add relevant topics |
| **Non-destructive** | Preserves existing topics, only skips fields already set |

## Workflow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Auth & Repo    │────>│  Description    │────>│  Live Site URL  │
│  (gh CLI, git)  │     │  (analyze code) │     │  (detect URLs)  │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
                                                        v
                        ┌─────────────────┐     ┌─────────────────┐
                        │  Report         │<────│  Topics         │
                        │  (summary)      │     │  (tech stack)   │
                        └─────────────────┘     └─────────────────┘
```

## What Gets Updated

| Field | Source | Example |
|-------|--------|---------|
| **Description** | README.md, package.json, source files | "AI-powered escape room game with puzzles and leaderboards" |
| **Homepage URL** | Vercel, GitHub Pages, Netlify, CNAME | `https://escaperooms.vercel.app` |
| **Topics** | File extensions, dependencies, config files | `javascript`, `react`, `game`, `vercel` |

## Also Runs With `/github-push`

This skill is automatically invoked as part of the `/github-push` workflow (Phase 5: Repo Setup). No extra steps needed — push your code and the About section gets updated automatically.

## Skill Structure

```
github-about/
├── SKILL.md       # Skill definition
├── README.md      # This file
└── examples.md    # Example usage
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- Git installed and configured with a GitHub remote
- [GitHub CLI](https://cli.github.com/) (`gh`) installed (auto-authenticates via browser if needed)

## Keywords

`github about` `repo description` `github topics` `live site url` `homepage url` `repo setup` `github metadata` `repo settings` `project metadata`

## License

MIT
