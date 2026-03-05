# Claude Code Config

Personal Claude Code configuration — agents, skills, rules, and hooks that work across all projects.

## Setup

Symlink or copy into `~/.claude/`:

```bash
# Option 1: Symlink (recommended — changes sync automatically)
ln -sf "$(pwd)/agents" ~/.claude/agents
ln -sf "$(pwd)/skills" ~/.claude/skills
ln -sf "$(pwd)/rules" ~/.claude/rules
ln -sf "$(pwd)/hooks" ~/.claude/hooks
cp CLAUDE.md ~/.claude/CLAUDE.md
cp settings.json ~/.claude/settings.json

# Option 2: Copy everything
cp -r agents skills rules hooks CLAUDE.md settings.json ~/.claude/
```

## What's Inside

### Agents (13)

| Agent | Purpose | Model |
|-------|---------|-------|
| `orchestrator` | Coordinates multi-agent debate for 3+ file changes | default |
| `design-thinking` | Visual hierarchy and craft — runs BEFORE UI work | default |
| `design-critic` | Adversarial review — runs AFTER UI code written | default |
| `designer` | States, mobile, accessibility audit | default |
| `code-reviewer` | Consistency, DRY, naming review | default |
| `qa-engineer` | Edge cases and failure modes | default |
| `security-engineer` | Threat modeling for auth, data, APIs | default |
| `product-manager` | Validate problem and scope before new features | haiku |
| `sre` | Performance and reliability for backend work | default |
| `ai-architect` | AI-native design for LLM features | default |
| `ux-copywriter` | Copy quality and terminology | haiku |
| `analytics-engineer` | Data pipeline and metrics design | haiku |

### Skills (7)

| Skill | Trigger | Description |
|-------|---------|-------------|
| `/audit` | Manual | Full codebase audit |
| `/design-review` | Manual | UI/UX design review |
| `/review` | Manual | Code review |
| `/add-feature` | Manual | Guided feature implementation |
| `/fix-bug` | Manual | Structured bug fix workflow |
| `/refactor` | Manual | Safe refactoring with tests |
| `/red-team` | Manual | Security red team assessment |

### Rules (6)

| Rule | Scope |
|------|-------|
| `backend.md` | API design, database, error handling, performance |
| `frontend.md` | React/Next.js, components, responsive, accessibility |
| `git.md` | Commits, branches, safety |
| `python.md` | Modern Python 3.10+, async, typing, anti-patterns |
| `typescript.md` | Strict mode, null safety, modern patterns |
| `security.md` | Input validation, auth, secrets, common attacks |

### Hooks

| Hook | Event | Type | Description |
|------|-------|------|-------------|
| `lint-after-edit.sh` | PostToolUse (Edit/Write) | command | Runs tsc or py_compile after edits |
| Pre-commit check | PreToolUse (git commit) | prompt | Checks for debug logs, hardcoded URLs, empty catches, secrets |
| Task review | TaskCompleted | prompt | Reviews teammate work against task description |

### CLAUDE.md

Global instructions enforced across all projects:
- Think before coding
- Mobile-first (375px)
- Descriptive error messages
- No dead code or duplicates
- TypeScript strict, no `any`
- All 5 UI states: loading, empty, error, partial, edge case
- Touch targets >= 44px, input font >= 16px
- Toast notifications, never `alert()`
