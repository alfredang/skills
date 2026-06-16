---
description: Secure git push — blocks any secret/API key/password, pushes code, adds/updates the README + screenshot (via the readme skill), updates the GitHub repo About (description/URL/topics) & Discussions, and auto-deploys static sites to GitHub Pages via GitHub Actions. Optional PR.
argument-hint: "[optional: 'pr' to open a pull request, 'pages' to force GitHub Pages deploy]"
allowed-tools: Bash, Read, Edit, Write, Grep, Glob
---

# GitHub Push

Securely push a project to GitHub. Every run guarantees these steps:

1. **No secrets pushed** — scan for and block any exposed secrets, API keys, tokens, or passwords (Phase 1).
2. **Update code to GitHub** — stage, commit, and push the changes (Phase 3).
3. **Update/add README + screenshot** — generate or refresh `README.md` via the `readme` skill, including a Playwright screenshot (Phase 2).
4. **Update the GitHub repo** — set the repo About: description, live site URL, topics, and enable Discussions (Phase 5).
5. **Create GitHub Pages for static sites** — auto-deploy static projects to GitHub Pages via a GitHub Actions workflow (Phase 6).

Runs using **Claude Code with subscription plan** — do NOT use pay-as-you-go API keys.

## Workflow

### Phase 1: Secret Detection (MANDATORY — blocking)

Before ANY git operations, scan the codebase for exposed secrets. Do not proceed if secrets are found.

1. List staged files: `git diff --cached --name-only`
2. Scan ALL staged files for these patterns:

**AWS** — `AKIA[0-9A-Z]{16}`, `aws_access_key_id`, `aws_secret_access_key`
**Generic API keys** — `api[_-]?key\s*[:=]\s*['"][A-Za-z0-9_\-]{20,}['"]`, `apikey`, `api[_-]?secret`
**Private keys** — `-----BEGIN (RSA|DSA|EC|OPENSSH|PGP) PRIVATE KEY-----`, `-----BEGIN PRIVATE KEY-----`
**DB connection strings** — `postgres(ql)?://`, `mysql://`, `mongodb(\+srv)?://`, `redis://`
**OAuth & bearer tokens** — `bearer\s+...`, `oauth[_-]?token`, `access[_-]?token`, `refresh[_-]?token`
**Cloud / vendor** — Google `AIza[0-9A-Za-z\-_]{35}`, Stripe `sk_live_`/`rk_live_`/`pk_live_`, Twilio `SK[0-9a-fA-F]{32}`, SendGrid `SG\.`, Slack `xox[baprs]-`, GitHub `gh[pousr]_[A-Za-z0-9_]{36,}`, OpenAI `sk-[A-Za-z0-9]{48}`, Anthropic `sk-ant-[A-Za-z0-9\-_]{90,}`
**Generic secrets** — `password|secret|credential\s*[:=]\s*['"][^'"]{8,}['"]`
**JWT** — `eyJ[A-Za-z0-9_-]*\.eyJ[A-Za-z0-9_-]*\.[A-Za-z0-9_-]*`

3. Check for sensitive files that should NEVER be committed: `.env`, `.env.*`, `*.pem`, `*.key`, `*.p12`, `*.pfx`, `credentials.json`, `secrets.json`, `id_rsa`/`id_ed25519`, `*.keystore`, `*.jks`, `.htpasswd`, `.netrc`, `.npmrc`, `wp-config.php`, `settings.py` with `SECRET_KEY`.
   Verify `.gitignore`: `grep -E "^\.env|^\.env\.|\.pem$|\.key$|credentials|secrets" .gitignore`

**If secrets are found:** STOP. List each with `file:line`, and give remediation (move to `.env`, ensure `.env` is gitignored, access via `process.env.X` / `os.environ["X"]`, `git reset HEAD <file>` to unstage). Never store secrets in config files.

**If none found:** report "Security scan complete: No secrets detected" and continue.

### Phase 2: README + Screenshot (always)

Invoke the **`readme` skill** to add or update the project's `README.md` — professional structure with badges, tech stack, architecture diagram, and a **Playwright screenshot** of the live site (the readme skill captures `screenshot.png` when a live demo URL is available and the README has no existing screenshot).

- If no `README.md` exists → generate it from scratch.
- If one exists → update it to the latest template, preserving project-specific details; refresh the screenshot if it is missing.

Stage the resulting `README.md` (and `screenshot.png` if created) for the commit in Phase 3.

### Phase 3: Git Operations

1. `git status` and `git diff --cached --stat`
2. Stage specific files only — never `git add -A` / `git add .`
3. Generate a conventional-commit message (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`) from the changes
4. Commit, then `git push origin <branch>`. If rejected: `git pull --rebase origin <branch>` then push again.

### Phase 4: Pull Request (only if requested via `$ARGUMENTS` or the user asks)

```bash
gh pr create --title "<title>" --body "## Summary
- ...

## Test Plan
- [ ] ...

---
Generated with [Claude Code](https://claude.ai/code)"
```

### Phase 5: Repository About

Update the repo's About section — description, live site URL, and topics.

```bash
source ~/.zshrc 2>/dev/null          # loads GH_TOKEN for gh CLI
REMOTE_URL=$(git remote get-url origin)
OWNER=$(echo "$REMOTE_URL" | sed -E 's#.*(github\.com)[:/]([^/]+)/([^/.]+)(\.git)?$#\2#')
REPO=$(echo "$REMOTE_URL" | sed -E 's#.*(github\.com)[:/]([^/]+)/([^/.]+)(\.git)?$#\3#')
gh repo view --json description,homepageUrl,repositoryTopics
```

- **Description** — if unset, generate a compelling ≤350-char description from `README.md` / `package.json` / `pyproject.toml` / `Cargo.toml` / source. Start with a verb/noun, no emojis: `gh repo edit --description "..."`
- **Live site URL** — detect from Vercel (`.vercel/project.json`, `vercel.json`), GitHub Pages (`gh api /repos/$OWNER/$REPO/pages`), `package.json` `homepage`, README URLs (`.vercel.app`, `.netlify.app`, `.github.io`, `.fly.dev`, `.railway.app`), or `CNAME`: `gh repo edit --homepage "..."`
- **Topics** — detect from languages/frameworks/platforms/domain; **add**, never replace: `gh repo edit --add-topic "t1" --add-topic "t2"`

Then enable Discussions if not already on:
```bash
gh repo view --json hasDiscussionsEnabled
gh repo edit --enable-discussions
```

### Phase 6: GitHub Pages Deployment (auto for static sites)

Deploy the project to GitHub Pages with an auto-generated GitHub Actions workflow. (Formerly the standalone `github-pages` skill — now built in.)

**When to run:** Run this automatically whenever the project is a **static site** — i.e. a root `index.html`, or a static-buildable frontend (Vite / Next.js static export / Angular / MkDocs / any `package.json` with a `build` script that emits static assets). Also run when the user passes `pages` in `$ARGUMENTS` or asks for it. **Skip** (and say so) for backend/server projects with no static output, or when no GitHub remote exists.

1. **Detect project type** and resolve build command + output dir:

| Indicator | Type | Output dir |
|-----------|------|-----------|
| `vite.config.*` | Vite | `./dist` (ensure `base: '/<REPO>/'` is set) |
| `next.config.*` | Next.js static export | `./out` (ensure `output: 'export'`, `basePath: '/<REPO>'`) |
| `angular.json` | Angular | `./dist/<project>` |
| `package.json` with `build` | Node.js | `./dist` or `./build` |
| `index.html` in root | Static HTML | `./` (no build) |
| `requirements.txt` + `mkdocs.yml` | MkDocs | `./site` |

   Detect Node version from `.nvmrc` / `.node-version` / `engines.node` (default `20`).

2. **Generate `.github/workflows/deploy-pages.yml`** with `permissions: { contents: read, pages: write, id-token: write }`, `concurrency: pages`, triggered on push to `main` + `workflow_dispatch`. Static sites upload `path: '.'` directly; Node projects run a `build` job (`setup-node` → `npm ci` → `npm run build` → `upload-pages-artifact` with `path: <OUTPUT_DIR>`) then a `deploy` job using `actions/deploy-pages@v4`.

3. **Commit, push, and enable Pages via API:**
```bash
git add .github/workflows/deploy-pages.yml
git commit -m "ci: add GitHub Pages deployment workflow"
git push origin main
gh api "/repos/$OWNER/$REPO/pages" 2>/dev/null \
  || gh api -X POST "/repos/$OWNER/$REPO/pages" -f build_type=workflow
gh workflow enable deploy-pages.yml 2>/dev/null
```
   If Actions are disabled at repo level: `gh api -X PUT "/repos/$OWNER/$REPO/actions/permissions" -f enabled=true`.

4. **Verify:** `gh run list --workflow=deploy-pages.yml --limit 1`; report the live URL `https://<OWNER>.github.io/<REPO>/`.

### Phase 7: Report

Summarize: push status, branch, commit, PR link (if any), description/homepage/topics set, Discussions status, GitHub Pages URL (if deployed), and any GitHub security alerts to watch.
