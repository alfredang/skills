---
name: app-testing
description: Test app functionality on localhost or remote live sites using Playwright MCP. Navigates pages, clicks buttons, fills forms, checks content, and validates UI behavior. Use when running "test app", "test my site", "test the app", or any functional testing task.
---

# App Testing

Test application functionality on localhost or remote live sites using Playwright MCP browser automation. Navigates pages, interacts with elements, validates content, and reports results.

## Command
`/test-app` or `test-app`

## Navigate
Testing & QA

## Keywords
test app, test site, test my app, test my site, test localhost, test live site, functional test, ui test, smoke test, e2e test, end to end test, test buttons, test forms, test navigation, test links, playwright test, browser test, test functionality, qa test, test page, test deployed site, test production, verify app, check app works, test-app

## Description
Uses Playwright MCP to launch a browser, navigate to your app (localhost or remote URL), and systematically test functionality. Takes snapshots to understand page structure, interacts with elements (clicks, types, selects), validates expected behavior, and generates a test report with pass/fail results and screenshots of failures.

## Execution
This skill runs using **Claude Code with subscription plan**. Requires the Playwright MCP server to be configured and available. All browser interactions use Playwright MCP tools (browser_navigate, browser_snapshot, browser_click, browser_type, etc.).

## Response
I'll test your app's functionality using Playwright MCP!

The workflow includes:

| Step | Description |
|------|-------------|
| **Discover** | Determine target URL (localhost or remote) |
| **Snapshot** | Take accessibility snapshot to understand page structure |
| **Plan** | Identify testable elements and user flows |
| **Execute** | Run through test scenarios interacting with the app |
| **Validate** | Check expected outcomes after each interaction |
| **Report** | Generate test summary with pass/fail results |

## Instructions

When executing `/test-app`, follow this workflow:

### Phase 0: Determine Target URL

The user may provide a URL directly or you need to detect it:

1. **If user provides a URL** (e.g., `test-app https://mysite.com` or `test-app localhost:3000`):
   - Use the provided URL directly
   - If just a domain without protocol, prepend `https://`
   - If `localhost` without port, try common ports: 3000, 5173, 8080, 8000, 4321

2. **If no URL provided**, auto-detect:
   - Check for running localhost servers by scanning common ports:
     ```bash
     for port in 3000 5173 8080 8000 4321 8501 5000 9292; do
       lsof -ti:$port >/dev/null 2>&1 && echo "Found server on port $port"
     done
     ```
   - If exactly one server is found, use it
   - If multiple servers found, ask the user which one to test
   - If no server found, check for a deployed URL:
     - Look for `vercel.json`, `.vercel/project.json` for Vercel deployments
     - Look for `CNAME` file or `.github/workflows` for GitHub Pages
     - Check `package.json` for `homepage` field
   - If nothing found, ask the user for the URL

3. **Validate the target is reachable:**
   ```bash
   curl -s -o /dev/null -w "%{http_code}" <URL> 2>/dev/null
   ```
   - If the response is not 2xx or 3xx, inform the user the target is unreachable
   - For localhost, ensure the server is running first (suggest `/start-app` if not)

### Phase 1: Initial Page Load & Snapshot

Navigate to the target URL and capture the initial state:

1. **Navigate to the app:**
   Use `browser_navigate` to open the target URL.

2. **Take accessibility snapshot:**
   Use `browser_snapshot` to get the full page structure. This returns a structured representation of all interactive elements, text content, links, buttons, forms, and navigation.

3. **Take a screenshot for visual reference:**
   Use `browser_take_screenshot` to capture the initial visual state.

4. **Analyze the page structure:**
   From the snapshot, identify:
   - Navigation menus and links
   - Buttons and interactive elements
   - Forms and input fields
   - Main content areas
   - Dynamic elements (dropdowns, modals, tabs)
   - Error messages or broken elements

### Phase 2: Plan Test Scenarios

Based on the page snapshot, plan test scenarios organized by priority:

#### 2.1 Critical Path Tests (always run)
- **Page loads successfully** — no error states, main content renders
- **Navigation works** — all nav links are clickable and lead to valid pages
- **No console errors** — check `browser_console_messages` for errors
- **No broken network requests** — check `browser_network_requests` for failed calls

#### 2.2 Interactive Element Tests
- **Buttons** — click each visible button and verify expected behavior
- **Links** — verify internal links navigate correctly, external links exist
- **Forms** — fill in form fields and submit, verify validation messages
- **Dropdowns/Selects** — open and select options
- **Tabs/Accordions** — toggle and verify content changes
- **Modals/Dialogs** — trigger and verify they open/close properly

#### 2.3 Content Validation Tests
- **Text content** — verify headings, paragraphs, and labels are present
- **Images** — verify images load (no broken image indicators)
- **Lists/Tables** — verify data renders correctly
- **Dynamic content** — verify content loads after API calls

#### 2.4 User Flow Tests (if applicable)
Identify common user flows based on the app type:
- **Auth apps** — login/signup/logout flow
- **E-commerce** — browse/add to cart/checkout flow
- **Forms** — fill/validate/submit flow
- **Dashboards** — navigate between views, filter/sort data
- **Landing pages** — CTA buttons, anchor links, contact forms

### Phase 3: Execute Tests

Run each test scenario using Playwright MCP tools. For each test:

1. **Snapshot before action** — use `browser_snapshot` to understand current state
2. **Perform the action** — use the appropriate Playwright MCP tool:
   - `browser_click` — for buttons, links, tabs
   - `browser_type` — for text inputs
   - `browser_fill_form` — for multiple form fields
   - `browser_select_option` — for dropdowns
   - `browser_press_key` — for keyboard interactions (Enter, Escape, Tab)
   - `browser_hover` — for hover states and tooltips
   - `browser_navigate` — for direct URL navigation
   - `browser_navigate_back` — to return to previous page
3. **Snapshot after action** — use `browser_snapshot` to verify the result
4. **Validate** — check that the expected outcome occurred:
   - Element appeared/disappeared
   - Text changed
   - Page navigated
   - Form submitted successfully
   - Error message displayed for invalid input
5. **Screenshot on failure** — if a test fails, use `browser_take_screenshot` to capture the failure state

#### Test Execution Rules
- **Wait for dynamic content** — use `browser_wait_for` when expecting async changes
- **Handle dialogs** — use `browser_handle_dialog` if alerts/confirms appear
- **Check console** — periodically use `browser_console_messages` to catch JS errors
- **Check network** — use `browser_network_requests` to catch failed API calls
- **Navigate back** — after testing a sub-page, navigate back to continue testing
- **Use tabs** — use `browser_tabs` to manage multiple pages if needed

### Phase 4: Multi-Page Testing

If the app has multiple pages/routes:

1. **Collect all navigation links** from the snapshot
2. **Visit each page** and run Phase 1 (snapshot + basic validation) on each
3. **Test cross-page flows** (e.g., add to cart on page A, verify cart on page B)
4. **Test browser back/forward** navigation

For single-page apps (SPAs):
- Test client-side routing by clicking nav elements
- Verify URL changes in the browser
- Test deep linking by navigating directly to routes

### Phase 5: Generate Test Report

After all tests complete, generate a structured report:

```
## Test Report

**Target:** <URL>
**Date:** <current date/time>
**Total Tests:** <count>
**Passed:** <count>  |  **Failed:** <count>  |  **Skipped:** <count>

### Results

| # | Test | Status | Details |
|---|------|--------|---------|
| 1 | Page loads successfully | PASS | Main content rendered in <X>ms |
| 2 | Navigation - Home link | PASS | Navigated to / |
| 3 | Navigation - About link | PASS | Navigated to /about |
| 4 | Login form submission | FAIL | Expected redirect, got validation error |
| 5 | Contact form - empty submit | PASS | Validation messages displayed |
| ... | ... | ... | ... |

### Failures

#### Test 4: Login form submission
- **Action:** Filled email/password and clicked Submit
- **Expected:** Redirect to dashboard
- **Actual:** Validation error "Invalid credentials"
- **Screenshot:** [captured]

### Console Errors
- [error] Failed to load resource: /api/users (404)
- [warning] React: Each child in a list should have a unique "key" prop

### Network Issues
- GET /api/users → 404 Not Found
- POST /api/login → 500 Internal Server Error

### Recommendations
- Fix the /api/users endpoint returning 404
- Add proper error handling for login failures
- Add alt text to images on the homepage
```

### Phase 6: Cleanup

After testing:
1. Close the browser with `browser_close`
2. Display the test report to the user
3. If failures were found, offer to:
   - Investigate specific failures in more detail
   - Re-run failed tests after fixes
   - Take additional screenshots

## Advanced Usage

### Testing with Arguments

Users can pass specific test targets:

- `/test-app` — auto-detect URL, run all tests
- `/test-app http://localhost:3000` — test specific localhost
- `/test-app https://mysite.com` — test remote site
- `/test-app https://mysite.com/login` — test specific page
- `/test-app --forms` — focus on form testing
- `/test-app --nav` — focus on navigation testing
- `/test-app --a11y` — focus on accessibility checks

### Testing Remote vs Local

**Localhost testing:**
- Can test with hot-reload (changes reflect immediately)
- Can test authenticated flows with test credentials
- Can test API endpoints directly

**Remote/live site testing:**
- Tests the deployed production build
- Validates CDN, SSL, and production configs
- Can catch deployment-specific issues
- Respects rate limits and avoids destructive actions (no form submissions with real data unless explicitly requested)

## Capabilities

- Navigate to any localhost or remote URL via Playwright MCP
- Take accessibility snapshots to understand full page structure
- Click buttons, links, tabs, and any interactive elements
- Fill and submit forms with test data
- Validate page content, navigation, and UI behavior
- Capture screenshots for visual verification and failure documentation
- Check browser console for JavaScript errors
- Monitor network requests for failed API calls
- Test multi-page flows and SPA client-side routing
- Handle browser dialogs (alerts, confirms, prompts)
- Generate structured test reports with pass/fail results

## Notes

- This skill requires Playwright MCP to be configured in Claude Code
- For localhost testing, ensure the app is running first (use `/start-app` if needed)
- The skill does NOT modify any application code — it only reads and interacts via the browser
- Remote site testing avoids destructive actions by default (no real purchases, account deletions, etc.)
- Form testing uses obviously fake test data (e.g., test@example.com, "Test User")
- Screenshots are captured for failures to help debug issues
- Console and network errors are always checked even if not explicitly requested
