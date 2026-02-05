# GitHub Push

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Security](https://img.shields.io/badge/Security-Secret_Scanner-red)](https://github.com/alfredang/skills)

Secure git push with automatic secret detection and README generation. Never accidentally expose API keys, passwords, or credentials to GitHub again.

## Installation

```bash
npx skills add https://github.com/alfredang/skills --skill github_push
```

## Usage

Once installed, trigger the skill using:

```
/github_push
```

Or use natural language:
- "push to github safely"
- "commit and push with secret scan"
- "push my code and generate a readme"
- "secure push to github"

## Features

| Feature | Description |
|---------|-------------|
| **Secret Detection** | Scans for 20+ types of exposed secrets before pushing |
| **API Key Scanner** | Detects AWS, GCP, Azure, OpenAI, Stripe, and more |
| **File Protection** | Warns about sensitive files like .env, .pem, credentials |
| **README Generator** | Auto-generates professional README.md |
| **Smart Commits** | AI-generated conventional commit messages |
| **PR Creation** | Optionally creates pull requests with descriptions |

## Security Scanning

Detects these secret types before any push:

| Category | Examples |
|----------|----------|
| **Cloud Credentials** | AWS access keys, GCP service accounts, Azure secrets |
| **API Keys** | OpenAI, Anthropic, Stripe, Twilio, SendGrid, Slack |
| **Database URLs** | PostgreSQL, MySQL, MongoDB, Redis connection strings |
| **Auth Tokens** | OAuth tokens, Bearer tokens, JWT, session tokens |
| **Private Keys** | RSA, DSA, EC, SSH, PGP private keys |
| **Platform Tokens** | GitHub PATs, Discord webhooks, Heroku API keys |

## Workflow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Secret Scan    │────▶│  README Gen     │────▶│   Git Push      │
│  (MANDATORY)    │     │  (Optional)     │     │                 │
└─────────────────┘     └─────────────────┘     └─────────────────┘
        │                                               │
        │ Secrets found?                                │
        ▼                                               ▼
    BLOCKED                                      Create PR (Optional)
```

## Skill Structure

```
github_push/
├── SKILL.md        # Skill definition
├── README.md       # This file
├── examples.md     # Example usage
└── scripts/
    └── scan-secrets.sh  # Secret detection script
```

## Supported Platforms (40+ Agents)

Skills are automatically installed to all supported AI coding assistants:

| Category | Platforms |
|----------|-----------|
| **Popular** | Claude Code, Cursor, Windsurf, GitHub Copilot, Continue, Cline |
| **AI Assistants** | OpenHands, Codex, Gemini CLI, Kimi Code CLI, Qwen Code |
| **IDE Extensions** | Augment, CodeBuddy, Kilo Code, Roo Code, Zencoder |
| **CLI Tools** | OpenCode, Goose, Command Code, Kiro CLI |
| **Enterprise** | Factory AI/Droid, Antigravity, Replit, Amp |

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- Git installed and configured
- GitHub CLI (`gh`) for PR creation (optional)

## Keywords

`github push` `git push` `secret detection` `api key scan` `credential scan` `security check` `push to github` `commit and push` `secret scanner` `readme generator` `safe push` `secure push` `pre-push hook` `leak detection`

## License

MIT
