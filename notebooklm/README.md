# NotebookLM

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Complete API for Google NotebookLM - full programmatic access including features not in the web UI. Create notebooks, add sources, generate all artifact types, download in multiple formats.

## Installation

```bash
npx skills add https://github.com/alfredang/skills --skill notebooklm
```

## Prerequisites

Install the NotebookLM Python package first:
```bash
pip install notebooklm-py
notebooklm login          # Opens browser for Google OAuth
```

## Usage

Once installed, trigger the skill in Claude Code using:

```
/notebooklm
```

Or use natural language:
- "create a podcast about X"
- "generate audio overview from my document"
- "create a notebook from these URLs"

## Features

| Feature | Description |
|---------|-------------|
| **Create Notebooks** | Programmatically create new notebooks |
| **Add Sources** | URLs, YouTube, PDFs, audio, video, images |
| **Generate Artifacts** | Podcasts, summaries, FAQs, study guides, timelines |
| **Download Results** | Multiple formats (audio, text, etc.) |
| **Chat with Content** | Interactive Q&A with your sources |

## Capabilities

- Full programmatic access to NotebookLM
- Features not available in web UI
- Batch processing support
- CI/CD integration ready
- Multiple account support

## Skill Structure

```
notebooklm/
├── SKILL.md        # Skill definition and instructions
└── README.md       # This file
```

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with an active subscription
- Python 3.8+
- `notebooklm-py` package

## Keywords

`notebooklm` `podcast` `google notebooklm` `audio overview` `notebook` `ai podcast` `document summary` `study guide`

## License

MIT
