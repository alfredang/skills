---
name: fill-tsc-jd-lithan-ccp
description: >-
  Fill the JD / "Job responsibilities" column (Column F, labelled "aligned with
  JD") in a Lithan CCP TSC Scoping Matrix workbook. For each technical skill &
  competency (TSC) row, write a one-line job responsibility aligned with that
  skill's Objective and the job role, matching the style of an already-filled
  reference sheet. Use when the user asks to fill, update, write, or summarise the
  JD / job responsibilities column on the TSC (Technical Skills & Competencies)
  Scoping Matrix for a Lithan CCP — files named like "CCP TSC Scoping Matrix
  LOO6*.xlsx" under the Tertiary Infotech/CCP person folders. Each workbook sheet
  is one job role (e.g. "2.4 AI ML Engineer", "3.3 Software Eng Manager").
---

# Fill the JD column on a Lithan CCP TSC Scoping Matrix

## What this is

A **CCP TSC Scoping Matrix** is the SkillsFuture Career Conversion Programme (CCP)
scoping workbook used with **Lithan**. Each **sheet is one job role**. Each sheet
holds a table of **TSCs (Technical Skills & Competencies)** drawn from the Skills
Framework, one skill per row.

Column layout (positions are stable; the header **row number varies per sheet**, so
always locate columns by header text — the helper script does this):

| Col | Header | Meaning |
|-----|--------|---------|
| B | Technical Skills & Competencies | Skill name |
| C | Proficiency Level Attained | Level 1–6 |
| D | Objectives | The framework objective for that skill |
| E | To be included in training plan? | Yes / No |
| **F** | **Job responsibilities** *(aligned with JD)* | **← the JD column this skill fills** |
| G | Specify tools and technologies | e.g. Salesforce, PowerBI |
| H | Number of training hours | e.g. 32 |
| I | Mode of delivery | e.g. OJT |

The task: for each skill **row**, write **one line** in **Column F** describing the
job responsibility for that skill, aligned with the skill's Objective (Column D)
and the specific job role, in the same style as a sheet that is already filled in.

## Workflow

### 1. Locate the workbook and confirm the sheet

Files live under `Tertiary Infotech/CCP/<Person Name>/` and are named like
`CCP TSC Scoping Matrix LOO6*.xlsx`. Find it, then list sheets:

```bash
python3 scripts/tsc_jd.py sheets "<file.xlsx>"
```

Confirm with the user which **sheet (job role)** to fill if not stated.

### 2. Read the target sheet's objectives + an already-filled reference sheet

```bash
python3 scripts/tsc_jd.py read "<file.xlsx>" "<target sheet>"     # rows to fill
python3 scripts/tsc_jd.py read "<file.xlsx>" "<filled sheet>"     # style reference
```

`read` returns JSON per skill row: `row`, `skill`, `proficiency`, `include` (E),
`objective` (D), `tools` (G), `jd_current` (F). Use it to:
- get the **Objective** text each JD line must align with,
- copy the **one-line style** from a sheet that already has Column F populated
  (in this client's files, **"3.3 Software Eng Manager"** is a good reference).

If the user names no reference sheet, pick any sheet in the same workbook whose
`jd_current` values are already filled.

### 3. Write one JD line per skill row

Read **[references/jd_style.md](references/jd_style.md)** before writing. In short:
one sentence, starts with an action verb, restates the skill's Objective as a
concrete responsibility for **this** role and the organisation's context, and stays
consistent with sibling lines.

**Only fill rows where Column E (include) is "Yes"**, unless the user says fill all.
Skip rows already populated unless asked to overwrite.

Build a JSON map of `{row: "JD text"}` and apply it (formatting is auto-copied from
each row's Objectives cell so font/wrap/alignment match):

```bash
python3 scripts/tsc_jd.py write "<file.xlsx>" "<target sheet>" '{"9":"...","10":"..."}'
# or, for many rows, write the map to a file and pass it with @:
python3 scripts/tsc_jd.py write "<file.xlsx>" "<target sheet>" @/tmp/jd_map.json
```

`write` saves the file and runs the xlsx skill's `recalc.py` to confirm **zero
formula errors**. Verify the recalc line reports no errors.

### 4. Verify

Re-run `read` on the target sheet and confirm every intended row now has a JD line
that reads naturally and aligns with its Objective.

## Notes

- Do **not** touch columns B–E, the header rows, or the **Mentor Assessment**
  section at the bottom — the script already excludes them.
- These workbooks contain no formulas in the skills table; recalc is a safety check.
- The matched formatting is **Calibri 12, wrapped, vertically centred** (inherited
  from the Objectives cell). Don't override it.
