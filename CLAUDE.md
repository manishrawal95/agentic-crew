# Global Instructions (All Projects)

## Principles
- Think before coding. Present approach, get alignment, then implement.
- Mobile-first. If it doesn't work at 375px, it's not done.
- Errors answer: what failed, where, why, what to do next. Never generic messages.
- No dead code, no duplicates, no orphaned files. Clean as you go.
- Silent failures are banned. Every caught exception is logged or re-thrown.

## Standards
- TypeScript strict mode. No `any` without justification.
- All 5 UI states: loading, empty, error, partial, edge case.
- Touch targets >= 44px. Input font >= 16px (prevents iOS zoom).
- Parameterized queries only. Never string-interpolate SQL.
- `datetime.now(timezone.utc)` not `datetime.utcnow()`.
- User feedback via toast, never `alert()`.

## Agent System
Specialist agents in `~/.claude/agents/`. Read the project's CLAUDE.md first, then invoke agents based on task type. See project CLAUDE.md for the routing table.

## Quality Gate
Before marking anything done: no console.log debugging left, no hardcoded localhost URLs, no empty catch blocks, no secrets in code, all states handled.
