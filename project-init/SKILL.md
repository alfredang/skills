---
name: project-init
description: Initialize a new project with standard CLAUDE.md, MEMORY.md, and .env setup. Use when starting a new project or setting up memory and secrets management for an existing project.
argument-hint: "[project-name]"
---

# Project Init Skill

Set up the standard project scaffolding for memory management, instructions, and secrets. Run the following steps:

## Step 1: Detect Project Info

- Determine the project name from `$ARGUMENTS` if provided, otherwise use the current directory name.
- Determine the absolute path of the current working directory.
- Compute the Claude memory path: `~/.claude/projects/<sanitized-project-path>/memory/` where `<sanitized-project-path>` is the absolute path with `/` replaced by `-` and leading `-` preserved (e.g., `/Users/alice/projects/my-app` becomes `-Users-alice-projects-my-app`).

## Step 2: Create CLAUDE.md

Create `CLAUDE.md` in the project root with the following content (replace `<MEMORY_PATH>` with the computed memory path):

```markdown
# Project Instructions

## Memory Management
- Always read `<MEMORY_PATH>/MEMORY.md` at the start of each conversation for context from previous sessions.
- Update MEMORY.md with key decisions, preferences, and insights discovered during the session.
- Keep MEMORY.md under 200 lines — trim outdated or redundant entries to stay within this limit.
- For detailed notes, create separate topic files in the memory directory (e.g., `debugging.md`, `architecture.md`) and link from MEMORY.md.
- Do not duplicate information already present in this CLAUDE.md file into MEMORY.md.
- Before adding new memories, check if an existing entry can be updated instead.
- Remove memories that are no longer accurate or relevant.

## Secrets Management
- All API keys and secrets go in `.env` (already gitignored).
- Never hardcode secrets in source code or commit `.env` to git.
- Reference environment variables in code instead of raw values.
```

If `CLAUDE.md` already exists, merge the Memory Management and Secrets Management sections into it without overwriting existing content.

## Step 3: Create MEMORY.md

Create the memory directory at the computed path, then create `MEMORY.md` inside it:

```markdown
# Project Memory

## Project Overview
- **Project**: <project-name>
- **Location**: <absolute-path>

## User Preferences
<!-- Add user preferences here -->

## Key Files
- `CLAUDE.md` — project-level instructions loaded every session

## Architecture & Decisions
<!-- Add key architectural decisions here -->

## Topic Files
<!-- Link to detailed topic files as needed -->
<!-- Example: - [debugging.md](debugging.md) — recurring issues and fixes -->
```

If `MEMORY.md` already exists, do not overwrite it.

## Step 4: Create .env

Create a `.env` file in the project root with placeholder content:

```
# Project Secrets — DO NOT COMMIT
# Add your API keys and secrets below
```

If `.env` already exists, do not overwrite it.

## Step 5: Update .gitignore

Ensure `.gitignore` exists and contains these entries (add only missing ones):

```
.env
.DS_Store
```

## Step 6: Summary

Report what was created or already existed:
- CLAUDE.md (created / already existed — merged)
- MEMORY.md at `<MEMORY_PATH>` (created / already existed — skipped)
- .env (created / already existed — skipped)
- .gitignore (updated / already had entries)
