---
name: review
description: "Code review — runs code-reviewer, qa-engineer, and security-engineer in parallel, then synthesizes."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash
argument-hint: "[files or feature to review]"
---

# Code Review — Multi-Agent Quality Gate

Run a thorough code review on recent changes or specified files. Read CLAUDE.md first for project context.

## Process

### 1. Identify Scope
If `$ARGUMENTS` specifies files/feature, review those. Otherwise, review uncommitted changes:
```
git diff --name-only HEAD
git diff --cached --name-only
```

### 2. Spawn Parallel Review Agents

**Code Reviewer** (read `code-reviewer.md` + CLAUDE.md):
- Pattern consistency with existing codebase
- Naming accuracy and consistency
- DRY violations (cite both locations)
- Complexity — over-engineered or under-abstracted
- Dead code, unused imports, orphaned files
- File length, function length, nesting depth

**QA Engineer** (read `qa-engineer.md` + CLAUDE.md):
- Edge cases: empty/null/max-length/unicode/concurrent
- Failure modes: what breaks in production
- Missing states: loading, empty, error, partial
- External call resilience: timeouts, fallbacks
- LLM safety: prompt injection, malformed output, cost exposure

**Security Engineer** (read `security-engineer.md` + CLAUDE.md):
- Threat model: who calls this, worst case, blast radius
- Input validation: server-side, parameterized queries
- Auth/secrets: no credentials in code/logs, token expiry
- LLM: outputs untrusted, injection-resistant prompts, cost caps

### 3. Cross-Reference Findings
Look for conflicts between reviewers:
- Security wants strict validation, reviewer says it's over-engineered → security wins on boundaries
- QA wants error handling everywhere, reviewer says some cases can't happen → QA provides evidence or drops it

### 4. Present Prioritized Fix List
- **Must fix** (blocking): Security vulnerabilities, data loss risks, crashes
- **Should fix**: Missing error handling, edge cases, DRY violations
- **Consider**: Polish, naming nitpicks, potential improvements

Each item: file:line, what's wrong, concrete fix.
