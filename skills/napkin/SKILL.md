---
name: napkin
description: |
  Keep `/napkin.md` as the repository's operational guide. This skill is
  always active: read and review the file before working. Keep only recurring,
  actionable, high-value rules, in PT-BR, organized by category and priority
  (max. 10 items per category). Do not use it as a log.
---

# Napkin

## Objective
Keep `/napkin.md` as a reusable operational guide for the repository, not as a
session history.

## Always do
1. At the start of every session, read `/napkin.md` before any other action.
   Internalize it silently; do not announce the read.
2. When reading or editing:
   - reprioritize from most important to least important;
   - merge duplicates;
   - remove obsolete, one-off, or low-signal items;
   - keep only recurring guidance;
   - limit each category to 10 items;
   - write everything in PT-BR.
3. During the work, record only reusable learnings.

## Record only
- frequent repository or toolchain pitfalls;
- recurring user guidelines;
- non-obvious tactics that work repeatedly.

## Do not record
- chronological logs;
- one-off notes;
- verbose postmortems;
- errors without a `Do this instead` line.

## Format
Each item must include:
- date `[YYYY-MM-DD]`;
- short title;
- `Do this instead:` line;
- concrete, short action.

## Organization
- Organize by category.
- Order categories and items by descending priority.
- Re-evaluate category and priority on every edit.
- Prefer a small number of high-signal items.
- Adapt categories to the repository.

## User Guidelines
1. **[2026-04-09] The user is learning English**
   Do this instead: answer in a mixed Portuguese + English style, using English only for words, verbs, and expressions the user already knows or has demonstrated understanding of. Keep the rest in Portuguese to avoid making comprehension harder. As the user improves, gradually increase the amount of English.
2. **[2026-04-09] Correct mixed or broken English gently**
   Do this instead: when the user writes phrases, prompts, or questions with errors, mixed Portuguese/English, or incomplete words, correct them gently and didactically. In addition to answering the main request, also act as an English teacher.
3. **[2026-04-09] When useful, structure the reply in two steps**
   Do this instead: first answer in mixed Portuguese + English, then show the correct full English version, and if necessary briefly explain the meaning of new words.

## If `/napkin.md` does not exist
Create:

```markdown
# Napkin Runbook

## Curating Rules
- Reprioritize on every read.
- Keep only recurring, high-value notes.
- Maximum of 10 items per category.
- Each item must include a date and a "Do this instead" line.

## Execution and Validation
1. **[YYYY-MM-DD] Short rule**
   Do this instead: concrete, repeatable action.

## Shell and Command Reliability
1. **[YYYY-MM-DD] Short rule**
   Do this instead: concrete, repeatable action.

## Domain Behavior Rules
1. **[YYYY-MM-DD] Short rule**
   Do this instead: concrete, repeatable action.

## User Guidelines
1. **[YYYY-MM-DD] Guideline**
   Do this instead: follow this preference exactly.
```

## Example
```markdown
1. **[2026-02-21] `rg` fails with over-expanded path lists**
   Do this instead: run `rg` from directory roots or iterate files with `while IFS= read -r`.
```
