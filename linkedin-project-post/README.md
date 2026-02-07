# LinkedIn Project Post

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Generate exciting LinkedIn posts to showcase your vibe coding projects with emojis, hashtags, features, tech stack, and call-to-action for engagement.

## Installation

```bash
npx skills add https://github.com/alfredang/skills --skill linkedin-project-post
```

## Usage

Once installed, trigger the skill in Claude Code using:

```
/linkedin-project-post
```

Or use natural language:
- "create a linkedin post for my project"
- "share my project on linkedin"
- "write a linkedin announcement"

## Features

The generated post includes:

| Section | Description |
|---------|-------------|
| **Hook** | Exciting opening with emojis |
| **Auto-Post** | Publish directly via LinkedIn MCP (if configured) |
| **Live Demo** | Link to deployed app |
| **GitHub Repo** | Link to source code |
| **About** | Project description |
| **Features** | Key features with checkmarks |
| **Tech Stack** | Technologies used |
| **CTA** | Fork, comment, star encouragement |
| **Hashtags** | Relevant tags for visibility |

## Example Output

```
I'm thrilled to share a passion project I've been building — Hiking Advisor —
your go-to web app for discovering trails! 🥾✨

🌐 Check it out: https://hiking-advisor.netlify.app/
📦 GitHub repo: https://github.com/user/hiking-advisor

🧭 What it's all about
Hiking Advisor helps outdoor lovers search for hiking trails and plan adventures!

🚀 Key Features
✅ Search trails by name or location
✅ Map view with trail markers
✅ Filter trails based on preferences
... and more!

🛠️ Built With
💻 React, Leaflet Maps, Netlify

⭐ Get Involved
Feel free to fork, comment, and star the repo!

#VibeCoding #OpenSource #WebDev #React
```

## Skill Structure

```
linkedin-project-post/
├── SKILL.md        # Skill definition and instructions
├── README.md       # This file
├── examples.md     # Example prompts and outputs
└── scripts/        # Automation scripts (optional)
```

## Auto-Post via LinkedIn MCP

Configure a LinkedIn MCP server to publish posts automatically — no manual copy-paste needed.

| MCP Server | Language | Supports Images |
|-----------|----------|-----------------|
| [lurenss/linkedin-mcp](https://github.com/lurenss/linkedin-mcp) | Node.js | Yes (`create_linkedin_image_post`) |
| [Lnxtanx/LinkedIn-MCP](https://github.com/Lnxtanx/LinkedIn-MCP) | Python | Yes (`create_post` with `media_type: IMAGE`) |

**Setup (one-time):**
1. Create a [LinkedIn Developer App](https://www.linkedin.com/developers/)
2. Request "Share on LinkedIn" product access
3. Generate an OAuth access token
4. Add the MCP server to your Claude Code config

Without MCP, the skill falls back to opening LinkedIn in your browser for manual posting.

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- LinkedIn MCP server (optional, for auto-posting)

## Keywords

`linkedin` `linkedin post` `share project` `vibe coding` `showcase project` `social media` `project announcement` `github project`

## License

MIT
