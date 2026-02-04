# NotebookLM

[![Claude Code](https://img.shields.io/badge/Claude_Code-Skill-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Deep research and slide presentation generator using NotebookLM MCP. Performs deep research on topics, then generates professional slide presentations based on research sources.

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
- "research and create a presentation about AI trends"
- "deep dive into quantum computing and make slides"
- "create a slide deck on climate change"

## Primary Workflow

### 1. Deep Research
- Invokes NotebookLM MCP for comprehensive research
- Gathers sources, insights, and citations
- Extracts key findings and data points

### 2. Slide Generation
Based on your topic outline, generates slides with:

| Specification | Value |
|---------------|-------|
| **Background** | White (#FFFFFF) |
| **Font** | Arial |
| **Content** | Based on research sources |
| **Citations** | Included on each slide |

### 3. Slide Structure
1. Title Slide
2. Agenda/Outline
3. Content Slides (per outline section)
4. Key Findings
5. Sources/References

## Features

| Feature | Description |
|---------|-------------|
| **Deep Research** | Comprehensive topic research via NotebookLM |
| **Slide Generation** | Professional presentations from research |
| **Source Citations** | All content backed by sources |
| **Custom Outlines** | User-defined presentation structure |
| **Multiple Formats** | Markdown or HTML/reveal.js output |

## Additional Capabilities

- Create podcasts and audio overviews
- Generate summaries, FAQs, study guides
- Add sources: URLs, YouTube, PDFs, audio, video
- Interactive Q&A with content

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

`notebooklm` `deep research` `slides` `presentation` `google notebooklm` `research` `slide deck` `powerpoint`

## License

MIT
