---
name: fix-bug
description: "Competing hypotheses debugging — spawns multiple investigators with different theories that disprove each other."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash
argument-hint: "<bug description or error message>"
---

# Fix Bug — Competing Hypotheses

Debug using the adversarial investigation pattern. Instead of one agent guessing, spawn multiple investigators with different theories. They try to disprove each other — the surviving theory is most likely correct.

Read CLAUDE.md first to understand the project.

## Process

### 1. Reproduce & Gather Evidence
- Read the error message / bug description: $ARGUMENTS
- Find the relevant code paths (Grep, Glob, Read)
- Identify 3-5 possible root causes

### 2. Spawn Competing Investigators (Agent Teams)

Spawn 3 teammates, each assigned a different hypothesis:

**Investigator A** — Hypothesis: The bug is in the data layer (DB queries, data transformation, missing validation)
```
Investigate whether $ARGUMENTS is caused by a data issue. Read the relevant DB queries, model definitions, and data flow. Find evidence that proves or disproves this theory. If you find evidence against your hypothesis, say so honestly. Message other investigators with your findings.
```

**Investigator B** — Hypothesis: The bug is in the logic layer (business logic, state management, race conditions)
```
Investigate whether $ARGUMENTS is caused by a logic error. Read the relevant handlers, state management, and control flow. Look for race conditions, missing edge cases, or incorrect assumptions. Message other investigators to challenge their theories.
```

**Investigator C** — Hypothesis: The bug is in the integration layer (API contracts, type mismatches, missing error handling)
```
Investigate whether $ARGUMENTS is caused by an integration issue. Check API request/response shapes, type definitions vs actual data, error handling at boundaries. Message other investigators to disprove their theories with evidence.
```

### 3. Debate & Converge
- Investigators challenge each other's findings
- Require evidence (file:line references), not guesses
- The theory that survives challenge is the root cause

### 4. Fix & Verify
- Implement the fix for the winning theory
- Run the reproduction case to verify
- Check for similar patterns elsewhere (the bug might exist in related code)

### 5. Regression Guard
- Add specific handling that prevents this exact bug from recurring
- Document what went wrong and why in a code comment if non-obvious
