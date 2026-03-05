---
name: add-feature
description: "Full feature implementation with agent team — plan, design, implement, review, all with debate."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash, Edit, Write
argument-hint: "<feature description>"
---

# Add Feature — Full Team Workflow

Implement a feature with the full agent team cycle: plan → design → build → review. Each phase has debate.

Read CLAUDE.md first to understand the project.

## Phase 1: Plan (before any code)

Spawn `product-manager` agent:
- Is this the right thing to build? What problem does it solve?
- What's the smallest version that delivers value?
- What's the success metric?

If the feature is UI-related, also spawn `design-thinking` agent:
- Visual hierarchy, layout approach, states
- Anti-AI-look check
- Micro-interactions and personality

Present the plan. Get user approval before proceeding.

## Phase 2: Implement

Write the code. Follow project conventions from CLAUDE.md.

For backend:
- Typed request models, parameterized queries, structured error handling
- LLM calls through abstraction layer with timeout/retry

For frontend:
- All 5 states (loading, empty, error, partial, edge case)
- Mobile-first at 375px
- Shared types, proxy routes, toast notifications

## Phase 3: Review (Agent Team — debate, not rubber stamp)

Spawn review team (3 teammates working in parallel, messaging each other):

**Teammate 1 — Code Quality**: Read `code-reviewer.md`. Check patterns, naming, DRY, complexity, dead code.

**Teammate 2 — Edge Cases & Security**: Read `qa-engineer.md` + `security-engineer.md`. Check failure modes, adversarial inputs, auth, LLM safety.

**Teammate 3 — Design Critic** (if UI): Read `design-critic.md`. AI tells scan, squint test, comparison test. Must find ≥3 issues.

Teammates discuss overlapping concerns and agree on prioritized fix list.

## Phase 4: Fix & Verify

Address all BLOCK and IMPROVE items from the review.
Run type checker (tsc --noEmit / py_compile).
Verify the feature works end-to-end.

## Phase 5: Finalize

- Update CLAUDE.md if conventions changed
- Verify README if setup/endpoints changed
- Present summary of what was built and any remaining POLISH items
