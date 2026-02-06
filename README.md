# Skills

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A collection of Claude Code skills to supercharge your development workflow. Skills install to **all supported AI platforms** including Claude Code, Cursor, Windsurf, and more.

## Available Skills

| Skill | Description | Install |
|-------|-------------|---------|
| [readme](./readme) | Generate professional GitHub README.md files with badges, architecture diagrams, and setup instructions | `npx skills add https://github.com/alfredang/skills --skill readme` |
| [linkedin-project-post](./linkedin-project-post) | Create exciting LinkedIn posts to showcase your vibe coding projects with emojis and hashtags | `npx skills add https://github.com/alfredang/skills --skill linkedin-project-post` |
| [notebooklm](./notebooklm) | Deep research & slide presentation generator - research topics via NotebookLM MCP, generate slides with white background & Arial font | `npx skills add https://github.com/alfredang/skills --skill notebooklm` |
| [github-push](./github-push) | Secure git push with automatic secret detection - scans for exposed API keys, passwords, and credentials before pushing to GitHub | `npx skills add https://github.com/alfredang/skills --skill github-push` |
| [vercel-deployment](./vercel-deployment) | Deploy to Vercel with auto project naming from folder name and auto-disable Vercel Authentication | `npx skills add https://github.com/alfredang/skills --skill vercel-deployment` |

## Quick Install

### README Generator
```bash
npx skills add https://github.com/alfredang/skills --skill readme
```

### LinkedIn Post Generator
```bash
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post
```

### NotebookLM (Google Podcasts)
```bash
npx skills add https://github.com/alfredang/skills --skill notebooklm
```

### GitHub Push (Secret Scanner)
```bash
npx skills add https://github.com/alfredang/skills --skill github-push
```

### Vercel Deployment
```bash
npx skills add https://github.com/alfredang/skills --skill vercel-deployment
```

## Fresh Install (All Platforms)

If skills don't appear after install, do a fresh reinstall:

```bash
# Remove old installation and reinstall
rm -rf ~/.agents/skills/readme ~/.claude/skills/readme
npx skills add https://github.com/alfredang/skills --skill readme

rm -rf ~/.agents/skills/linkedin-project-post ~/.claude/skills/linkedin-project-post
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post

rm -rf ~/.agents/skills/github-push ~/.claude/skills/github-push
npx skills add https://github.com/alfredang/skills --skill github-push

rm -rf ~/.agents/skills/vercel-deployment ~/.claude/skills/vercel-deployment
npx skills add https://github.com/alfredang/skills --skill vercel-deployment
```

## Usage

Once installed, trigger skills in Claude Code:

```
/readme                    # Generate a README
/linkedin-project-post     # Create a LinkedIn post
/notebooklm                # Create podcasts and notebooks
/github-push               # Secure push with secret scan
/vercel-deployment         # Deploy to Vercel
```

Or use natural language:
- "create a readme for my project"
- "write a linkedin post about my app"
- "create a podcast about this topic"
- "push to github safely" or "secure push"
- "deploy to vercel" or "vercel deploy"

## Supported Platforms (40+ Agents)

Skills are automatically installed to all supported AI coding assistants. The CLI auto-detects which agents you have installed.

| Category | Platforms |
|----------|-----------|
| **Popular** | Claude Code, Cursor, Windsurf, GitHub Copilot, Continue, Cline |
| **AI Assistants** | OpenHands, Codex, Gemini CLI, Kimi Code CLI, Qwen Code, Mistral Vibe |
| **IDE Extensions** | Augment, CodeBuddy, Kilo Code, Roo Code, Zencoder, Junie |
| **CLI Tools** | OpenCode, Goose, Command Code, Kiro CLI, iFlow CLI, Pi |
| **Enterprise** | Factory AI/Droid, Antigravity, Replit, Amp |
| **Others** | Trae, Kode, MCPJam, Mux, Qoder, Crush, OpenClaw, Neovate, Pochi, AdaL |

## Troubleshooting

If a skill doesn't appear in `/skills`:
1. Remove from both locations: `rm -rf ~/.agents/skills/<skill-name> ~/.claude/skills/<skill-name>`
2. Reinstall: `npx skills add https://github.com/alfredang/skills --skill <skill-name>`
3. Restart your editor/terminal
4. Run `/skills` to verify

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- Node.js 18+

## Contributing

Feel free to fork, submit PRs, or open issues for new skill ideas!

## License

MIT
