---
name: refactor
description: "Safe refactoring with before/after validation and review team."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash, Edit, Write
argument-hint: "<what to refactor and why>"
---

# Refactor — Safe Restructuring

Refactor code safely: understand before changing, validate after changing, review with team.

Read CLAUDE.md first to understand the project.

## Process

### 1. Understand Current State
- Read all files involved in the refactor
- Map dependencies: what calls this? What does this call?
- Identify the current behavior (this is what must NOT change)
- Run type checker as baseline: `npx tsc --noEmit` / `python3 -c "import py_compile..."`

### 2. Plan the Refactor
- What's changing and why: $ARGUMENTS
- What's the target structure?
- What could break? (callers, imports, API contracts, types)
- Present plan to user before proceeding

### 3. Execute
- Make changes incrementally (not all at once)
- After each file change, run type checker to catch breaks immediately
- Update all callers/importers when signatures change
- Update types when data shapes change

### 4. Validate
- Run type checker: zero errors required
- Run tests if they exist
- Verify all imports resolve
- Check for orphaned files (old files no longer imported)
- Check for dead exports (exported but never imported)

### 5. Review (spawn Agent Team)

**Teammate 1 — Reviewer**: Read `code-reviewer.md`. Verify the refactor improved consistency, didn't introduce new patterns that conflict, naming is correct.

**Teammate 2 — QA**: Read `qa-engineer.md`. Verify behavior is unchanged. Check edge cases at the new boundaries.

Teammates discuss: did the refactor actually improve things, or just move complexity around?

### 6. Clean Up
- Remove any orphaned files
- Remove unused imports and exports
- Verify no `// TODO: clean up after refactor` comments left behind
