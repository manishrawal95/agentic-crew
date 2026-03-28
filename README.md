# agentic-crew

> **Program management for AI agents.** 12 specialized agents with defined roles, adversarial review loops, and automated quality gates -- organized the way a TPM organizes an engineering team.

---

## Why This Exists

Most Claude Code setups are a single CLAUDE.md file with a few instructions. That's like running a project with one generalist and no process.

`agentic-crew` is a full **multi-agent orchestration system** -- specialized roles that debate decisions, challenge each other's output, catch bugs before they commit, and enforce consistency. Each agent has a defined scope, handoff protocol, and quality bar -- the same structure a program manager builds for human teams, applied to AI agents.

---

## At a Glance

| | Typical Claude Setup | agentic-crew |
|---|---|---|
| Agents | 1 general assistant | **12 specialized roles** |
| Design review | Manual, single-pass | **Adversarial** -- critic challenges designer |
| Security | None | **Threat modeling** on every auth/API change |
| Pre-commit | None | **Auto-blocks** hardcoded secrets, debug logs, empty catches |
| AI feature work | Generic prompts | Dedicated `ai-architect` for LLM-native design |
| Code quality | Vibes | DRY checks, naming review, consistency audit |

---

## Setup

Symlink into `~/.claude/` so changes sync automatically:

```bash
# Option 1: Symlink (recommended)
ln -sf "$(pwd)/agents" ~/.claude/agents
ln -sf "$(pwd)/skills" ~/.claude/skills
ln -sf "$(pwd)/rules" ~/.claude/rules
ln -sf "$(pwd)/hooks" ~/.claude/hooks
cp CLAUDE.md ~/.claude/CLAUDE.md
cp settings.json ~/.claude/settings.json

# Option 2: Copy everything
cp -r agents skills rules hooks CLAUDE.md settings.json ~/.claude/
```

---

## Agents (12)

The core of `agentic-crew`. Each agent has a focused role -- no generalists.

| Agent | Purpose | Model |
|---|---|---|
| `orchestrator` | Coordinates multi-agent debate for 3+ file changes | default |
| `design-thinking` | Visual hierarchy and craft -- runs **before** UI work | default |
| `design-critic` | Adversarial review -- runs **after** UI code is written | default |
| `designer` | States, mobile, accessibility audit | default |
| `code-reviewer` | Consistency, DRY, naming review | default |
| `qa-engineer` | Edge cases and failure modes | default |
| `security-engineer` | Threat modeling for auth, data, APIs | default |
| `product-manager` | Validates problem and scope before new features | haiku |
| `sre` | Performance and reliability for backend work | default |
| `ai-architect` | AI-native design for LLM features | default |
| `ux-copywriter` | Copy quality and terminology | haiku |
| `analytics-engineer` | Data pipeline and metrics design | haiku |

### How the adversarial loop works

For UI tasks, `agentic-crew` runs a two-pass review:

```
design-thinking → [your code] → design-critic
     ↑                                 ↓
   revise  ←←←←←←←←←←←←←← critique + score
```

`design-critic` doesn't just suggest -- it challenges. You get a scored review with specific objections before anything ships.

---

## Skills (7)

Slash commands that trigger structured, multi-step workflows.

| Skill | Trigger | What It Does |
|---|---|---|
| `/audit` | Manual | Full codebase audit |
| `/design-review` | Manual | UI/UX design review |
| `/review` | Manual | Code review |
| `/add-feature` | Manual | Guided feature implementation |
| `/fix-bug` | Manual | Structured bug fix workflow |
| `/refactor` | Manual | Safe refactoring with tests |
| `/red-team` | Manual | Security red team assessment |

---

## Rules (6)

Language and domain-specific guardrails enforced across every project.

| Rule | Covers |
|---|---|
| `backend.md` | API design, database, error handling, performance |
| `frontend.md` | React/Next.js, components, responsive, accessibility |
| `git.md` | Commits, branches, safety |
| `python.md` | Modern Python 3.10+, async, typing, anti-patterns |
| `typescript.md` | Strict mode, null safety, modern patterns |
| `security.md` | Input validation, auth, secrets, common attacks |

---

## Hooks

Automated checks that run at key moments -- no manual triggers needed.

| Hook | Event | Type | What It Catches |
|---|---|---|---|
| `lint-after-edit.sh` | PostToolUse (Edit/Write) | command | Runs `tsc` or `py_compile` after every edit |
| Pre-commit check | PreToolUse (git commit) | prompt | Debug logs, hardcoded URLs, empty catches, secrets |
| Task review | TaskCompleted | prompt | Reviews output against original task description |

---

## Global Rules (CLAUDE.md)

Non-negotiables enforced across all projects:

- **Think before coding** -- plan first, implement second
- **Mobile-first** at 375px
- **Descriptive error messages** -- no generic "something went wrong"
- **No dead code or duplicates**
- **TypeScript strict** -- no `any`, ever
- **All 5 UI states**: loading, empty, error, partial, edge case
- **Touch targets ≥ 44px**, input font ≥ 16px
- **Toast notifications** -- never `alert()`

---

## Who This Is For

- Developers shipping production apps with Claude Code
- Teams wanting consistent AI-assisted code quality without manual review overhead
- Anyone building LLM-powered features who needs an `ai-architect` perspective baked in

---

## Contributing

Found a better agent prompt? A rule that should exist? PRs welcome.

Open an issue describing what gap you hit -- agent, skill, rule, or hook -- and let's build it.

---

## License

MIT
