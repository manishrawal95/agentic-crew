---
name: audit
description: "Comprehensive project audit — UI, backend, security, code quality. Spawns parallel review agents."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash
argument-hint: "[focus: ui|backend|security|all]"
---

# Full Project Audit

Run a comprehensive audit of the current project. Read CLAUDE.md first for project context.

## Process

1. **Understand the project**: Read CLAUDE.md, identify the stack, key files, and conventions.

2. **Spawn parallel review agents** (use Agent tool, run in parallel):

   **UI/Design Audit** (if project has frontend):
   - Read `design-thinking.md` agent, then audit all UI components for: visual hierarchy, AI-generated tells, missing states (loading/empty/error), mobile responsiveness, accessibility.

   **Backend Audit** (if project has backend):
   - Read `sre.md` + `security-engineer.md` agents, then audit: N+1 queries, missing indexes, unvalidated inputs, missing error handling, external calls without timeouts, silent failures.

   **Code Quality Audit**:
   - Read `code-reviewer.md` agent, then audit: DRY violations, naming inconsistency, dead code, orphaned files, pattern violations, missing types.

   **Edge Case Audit**:
   - Read `qa-engineer.md` agent, then audit: missing error states, unhandled edge cases, concurrent operation issues, adversarial inputs.

3. **Synthesize findings** into a single prioritized list:
   - **Critical**: Crashes, data loss, security vulnerabilities
   - **High**: Silent failures, missing states, broken mobile
   - **Medium**: DRY violations, naming inconsistency, missing types
   - **Low**: Polish, optimization, documentation gaps

4. **Present results** with specific file:line references and concrete fixes for each issue.

## Focus Argument

If `$ARGUMENTS` specifies a focus:
- `ui` — Only UI/design audit
- `backend` — Only backend/security audit
- `security` — Only security-focused audit
- `all` or empty — Full audit (default)
