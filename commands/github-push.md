---
description: Secure git push — secret detection, professional README generation (with Playwright screenshot), commit & push, optional PR, repo About setup (description/URL/topics), Discussions, and optional GitHub Pages deployment. Scans for exposed credentials before pushing.
argument-hint: "[optional: 'pr' to open a pull request, 'pages' to deploy to GitHub Pages]"
allowed-tools: Bash, Read, Edit, Write, Grep, Glob
---

# GitHub Push

Securely push code to GitHub: scan for exposed secrets, generate/update a professional README, commit, push, optionally open a PR, update the repo's About section, enable Discussions, and optionally deploy to GitHub Pages.

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

### Phase 2: README Generation

If no `README.md` exists, invoke the **`readme` skill** to generate a professional one (badges, Playwright screenshot, tech stack, architecture diagram), then stage the generated `README.md` (and `screenshot.png` if created). If a README already exists, skip unless the user explicitly asks to regenerate it.

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

### Phase 6: GitHub Pages Deployment (only if requested via `$ARGUMENTS`/`pages` or the user asks)

Deploy the project to GitHub Pages with an auto-generated Actions workflow. (Formerly the standalone `github-pages` skill — now built in.)

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
