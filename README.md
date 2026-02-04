# Skills

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A collection of Claude Code skills to supercharge your development workflow. Skills install to **all supported AI platforms** including Claude Code, Cursor, Windsurf, and more.

## Available Skills

| Skill | Description | Install |
|-------|-------------|---------|
| [readme](./readme) | Generate professional GitHub README.md files with badges, architecture diagrams, and setup instructions | `npx skills add https://github.com/alfredang/skills --skill readme` |
| [linkedin-project-post](./linkedin-project-post) | Create exciting LinkedIn posts to showcase your vibe coding projects with emojis and hashtags | `npx skills add https://github.com/alfredang/skills --skill linkedin-project-post` |

## Quick Install

### README Generator
```bash
npx skills add https://github.com/alfredang/skills --skill readme
```

### LinkedIn Post Generator
```bash
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post
```

## Fresh Install (All Platforms)

If skills don't appear after install, do a fresh reinstall:

```bash
# Remove old installation and reinstall
rm -rf ~/.agents/skills/readme ~/.claude/skills/readme
npx skills add https://github.com/alfredang/skills --skill readme

rm -rf ~/.agents/skills/linkedin-project-post ~/.claude/skills/linkedin-project-post
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post
```

## Usage

Once installed, trigger skills in Claude Code:

```
/readme                    # Generate a README
/linkedin-project-post     # Create a LinkedIn post
```

Or use natural language:
- "create a readme for my project"
- "write a linkedin post about my app"

## Supported Platforms

Skills are automatically installed to all supported AI coding assistants:
- Claude Code
- Cursor
- Windsurf
- Continue
- Cline
- And more...

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
