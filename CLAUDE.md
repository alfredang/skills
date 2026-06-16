# CLAUDE.md

This file guides Claude Code (and compatible AI agents) when working in this repository.

## What this repo is

A curated collection of **custom Claude Code skills and slash commands authored and maintained by Tertiary Infotech Academy Pte. Ltd.** Everything here is original Tertiary Infotech work — third-party / vendor-authored skills (e.g. Vercel, Supabase, Stripe, Anthropic example skills, the community `find-skills`) have been intentionally removed and must not be re-added. Keep this repo scoped to Tertiary Infotech's own skills and commands only.

## Skills vs commands

- **Skills** (`<skill-name>/SKILL.md`) are **auto-invoked** by the model when a request matches the skill's `description`. Distributed via the `skills` CLI:
  `npx skills add https://github.com/alfredang/skills --skill <name>` → installs into `~/.agents/skills/` and `~/.claude/skills/`. Skills that bundle scripts/references are installed with `npx degit alfredang/skills/<name> .claude/skills/<name>`.
- **Commands** (`commands/<name>.md`) are **explicitly invoked** with a slash command (e.g. `/github-push`). Installed by copying the file into a project's `.claude/commands/`:
  `npx degit alfredang/skills/commands/<name>.md .claude/commands/<name>.md`.

## Skills (7)

| Skill | Purpose |
|-------|---------|
| `docker-hub` | Build & push Docker images to Docker Hub (`tertiaryinfotech`) |
| `app-testing` | Functional + mobile-responsiveness testing via Playwright MCP |
| `app-store-submission` | API-first iOS App Store submission (App Store Connect API + Xcode CLI) |
| `readme` | Generate a professional README with badges, diagrams, Playwright screenshots |
| `mobile-ios-design` | iOS Human Interface Guidelines + SwiftUI design patterns |
| `notebooklm` | Deep research & slide generation via NotebookLM MCP |
| `ai-avatar-video` | Talking-head / avatar videos (OmniHuman, Fabric, PixVerse via inference.sh) |

## Commands (3)

| Command | Purpose |
|---------|---------|
| `/github-push` | Secure git push: secret detection, README (invokes the `readme` skill), repo About (description/URL/topics), Discussions, optional PR, optional GitHub Pages deploy |
| `/start-app` | Auto-detect project type & start it on localhost on a free port, then open the browser |
| `/linkedin-project-post` | Generate a LinkedIn post (screenshot, links, features, tech stack, CTA, hashtags); auto-publish via LinkedIn MCP |

## History / merges (do not re-create these as separate skills)

- `github-about` → folded into the `/github-push` command (repo About: description/URL/topics).
- `github-page` / `github-pages` → deduped; GitHub Pages deployment folded into the `/github-push` command (`pages` argument).
- `secrets` → removed.
- `github-push`, `start-app`, `linkedin-project-post` → moved from skills to `commands/` (Claude Code command format).
- `readme` stays a **skill** (the `/github-push` command invokes it for README generation).

## Layout & conventions

- Each skill is a top-level directory `<skill-name>/` with a `SKILL.md` (YAML frontmatter `name` + `description`, then `## Command` / `## Keywords` / workflow body). Supporting assets live in `scripts/`, `templates/`, `examples/`, `references/`, `assets/`.
- Each command is a single `commands/<name>.md` in **Claude Code command format**: frontmatter (`description`, optional `argument-hint`, `allowed-tools`) followed by the prompt body. No `## Command`/`## Keywords` skill metadata.
- The directory/file name **is** the install slug — keep it kebab-case and stable; renaming breaks `npx skills add` / `degit` paths.
- **Do not commit install mirrors.** `.agent/`, `.agents/`, `.claude/`, `.cline/`, `.cursor/`, `.trae/`, `.windsurf/`, and a stray `skills/` symlink dir are produced locally by `npx skills add` and are gitignored. The canonical source is always the top-level directories.

## When adding or editing a skill / command

1. Decide skill (auto-invoked) vs command (slash-invoked) and place it accordingly.
2. Write a thorough, trigger-rich `description` — it is how a skill gets discovered.
3. Keep scripts self-contained and idempotent (Bash/Python, matching existing style).
4. Update [README.md](README.md): the relevant Skills/Commands table, the Quick Install block, the Project Structure tree, and the `Skills-<N>` / `Commands-<N>` badges + About counts.
5. Only add Tertiary Infotech's own work.

## Notes

- `.github/workflows/deploy-pages.yml` deploys this repo's own GitHub Pages site.
- Author/maintainer: **Tertiary Infotech Academy Pte. Ltd.** (GitHub: `alfredang`).
