---
name: red-team
description: "Red team / blue team — one agent defends the code, another tries to break it. Finds bugs through adversarial testing."
user-invocable: true
allowed-tools: Read, Grep, Glob, Agent, Bash
argument-hint: "[files, feature, or 'recent changes']"
---

# Red Team — Adversarial Code Testing

One team defends the code (Blue), another tries to break it (Red). The Red team's job is to find every way the code can fail, crash, leak data, or behave unexpectedly.

Read CLAUDE.md first to understand the project.

## Setup

Identify the scope: $ARGUMENTS
If "recent changes" or empty, use `git diff HEAD` to find changed files.

## Spawn Agent Team

### Blue Team (Defender)
Read `code-reviewer.md` + `sre.md` + CLAUDE.md.
```
You DEFEND this code. Your job:
1. Explain the architecture and design decisions
2. Identify the safeguards already in place
3. Respond to Red Team attacks with evidence of why they're handled (or acknowledge gaps)
4. Message Red Team to challenge their attack scenarios as unrealistic if applicable
```

### Red Team (Attacker)
Read `qa-engineer.md` + `security-engineer.md` + CLAUDE.md.
```
You ATTACK this code. Your job:
1. Find every way to crash, break, or exploit this code
2. Test with adversarial inputs: XSS, SQL injection, prompt injection, max-length, unicode, null
3. Find race conditions, state inconsistencies, silent failures
4. Find data leaks: secrets in logs, internal errors exposed to users, PII in responses
5. Find cost exposure: unbounded LLM calls, missing rate limits, no payload size limits
6. For each vulnerability, provide: attack vector, severity, proof (file:line), and exploit steps
7. Message Blue Team with each finding. If they defend successfully, drop it. If not, it's confirmed.
```

## Debate Protocol

Red Team presents attacks → Blue Team defends or acknowledges → Undefended attacks are confirmed vulnerabilities.

Minimum 2 rounds. Red Team must find at least 5 attack vectors (including edge cases).

## Output

### Confirmed Vulnerabilities (Red won)
Prioritized by severity: Critical > High > Medium > Low
Each with: attack vector, file:line, exploit steps, recommended fix

### Defended (Blue won)
What Red tried and why it's already handled. This validates existing safeguards.

### Recommendations
Hardening measures that would make future Red Team runs find fewer issues.
