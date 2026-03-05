# Python Rules

## Modern Python (3.10+)
- Type hints on all functions: parameters and return types.
- Use `from __future__ import annotations` for forward references.
- Use `|` union syntax: `str | None` not `Optional[str]`.
- Use `match` statements over long if/elif chains where appropriate.
- Use f-strings for formatting. Never `.format()` or `%` formatting.
- Use pathlib over os.path for file operations.

## Data Validation
- Pydantic models for API request/response validation.
- Use `Field()` constraints: `min_length`, `max_length`, `ge`, `le`, `pattern`.
- Validate at system boundaries (API input, file reads, external API responses).
- Never trust external data shapes. Parse and validate.

## Error Handling
- Specific exception types. Never bare `except:` or `except Exception:` without re-raising.
- Always log the full exception: `logger.error("context", exc_info=True)`.
- Use `try/except/finally` for resource cleanup (connections, file handles).
- Custom exception classes for domain errors with context attributes.
- Never swallow exceptions silently: `except: pass` is banned.

## Async
- Use `async/await` for I/O operations.
- Use `asyncio.gather()` for concurrent independent operations.
- Never mix sync and async without proper bridging (`asyncio.to_thread`).
- Always handle `asyncio.CancelledError` in long-running tasks.
- Set timeouts on all external calls: `asyncio.wait_for(coro, timeout=30)`.

## Database
- Parameterized queries: `cursor.execute("SELECT * FROM t WHERE id = ?", (id,))`.
- Never f-string or concatenate SQL. Ever.
- Use context managers for connections: `with get_connection() as conn:`.
- Close cursors and connections explicitly.
- Use transactions for multi-step writes.

## Project Structure
- Virtual environments for every project. Never install globally.
- `requirements.txt` or `pyproject.toml` with pinned versions.
- Environment variables via `os.environ.get()` with sensible defaults for dev.
- Use `logging` module, not `print()` for anything operational.

## Anti-Patterns — Never Do These
- Never use `eval()`, `exec()`, or `__import__()` with user input.
- Never use `datetime.utcnow()`. Use `datetime.now(timezone.utc)`.
- Never use mutable default arguments: `def f(items=[])` → use `def f(items=None)`.
- Never use `import *`. Explicit imports only.
- Never use `os.system()` or `subprocess.shell=True` with user input.
- Never hardcode file paths. Use `pathlib` and config.
- Never commit `.env`, `venv/`, `__pycache__/`, or `.pyc` files.
