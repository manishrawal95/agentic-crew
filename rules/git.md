# Git Rules

## Commits
- Commit messages describe WHY, not WHAT. The diff shows what changed.
- Format: `type(scope): description` — e.g., `feat(auth): add refresh token rotation`.
- Types: `feat`, `fix`, `refactor`, `docs`, `style`, `test`, `chore`, `perf`.
- Keep commits atomic: one logical change per commit. Not "fix everything".
- Never commit: `.env`, secrets, API keys, `node_modules/`, `venv/`, `__pycache__/`, `.db` files, `.DS_Store`.

## Branches
- Branch from `main` for new work.
- Branch naming: `feat/short-description`, `fix/short-description`, `refactor/short-description`.
- Delete branches after merging.

## Safety
- Never force-push to `main` or shared branches without team agreement.
- Never use `--no-verify` to skip hooks.
- Never use `git reset --hard` without understanding what will be lost.
- Resolve merge conflicts properly — don't just accept one side blindly.
