---
name: design-review
description: "Design debate cycle — design-thinking proposes, design-critic challenges, iterate until quality passes."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Edit, Write
argument-hint: "[component or page to review]"
---

# Design Review — Propose → Challenge → Resolve

Run a design debate cycle on the specified component or page. Read CLAUDE.md first for project context.

## Process

### Round 1: Propose
Spawn an agent that reads `design-thinking.md` + CLAUDE.md, then evaluates `$ARGUMENTS`:
- Visual hierarchy — what dominates, what recedes
- Layout approach — spacing rhythm, breakpoints
- State completeness — loading, empty, error, partial, edge case
- Personality — micro-interactions, empty state design, copy tone
- AI tells — anything that looks generated rather than crafted

### Round 2: Challenge
Spawn an agent that reads `design-critic.md` + CLAUDE.md, then reviews `$ARGUMENTS`:
- Run the AI tells scan (11 specific patterns)
- Run the squint test, comparison test, screenshot test
- Must find at least 3 issues
- Every issue: WHERE (file:line), WHY (specific tell), FIX (concrete change)
- Severity: BLOCK / IMPROVE / POLISH

### Round 3: Resolve
For each issue the critic found:
- If BLOCK: must fix before proceeding
- If IMPROVE: fix unless there's a strong reason not to
- If POLISH: fix if easy, defer if complex

### Round 4: Verify
After fixes, run the critic again on the changed code. Confirm issues resolved.

### Copy Review
Spawn an agent that reads `ux-copywriter.md` + CLAUDE.md, reviews all user-facing text:
- Button labels, empty states, error messages, loading text, toasts
- Terminology consistency
- Tone matching context

## Output
Present a summary: what was proposed, what was challenged, what was changed, and what the final result looks like.
