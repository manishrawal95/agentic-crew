# Backend Rules

## API Design
- RESTful endpoints with proper HTTP methods: GET (read), POST (create), PUT (full update), PATCH (partial), DELETE.
- Return proper status codes: 200 (ok), 201 (created), 204 (no content), 400 (bad input), 401 (not authenticated), 403 (not authorized), 404 (not found), 422 (validation), 429 (rate limit), 500 (server error).
- Validate ALL inputs server-side. Client-side validation is UX, not security.
- Use typed request/response models (Pydantic, Zod, etc.). Never trust raw `request.body`.
- Paginate list endpoints. Never return unbounded results.
- Rate limit public endpoints. Set payload size limits.

## Database
- Parameterized queries only. Never string-interpolate SQL. Never f-string SQL.
- Use transactions for multi-step writes. Rollback on any failure.
- Add indexes for columns used in WHERE, ORDER BY, JOIN.
- Use migrations for schema changes. Never modify schema by hand in production.
- Connection pooling for PostgreSQL. WAL mode for SQLite.
- Always close connections/cursors in `finally` blocks.

## Error Handling
- Structured errors with: code, message, detail, action.
- Log full error context server-side (user, endpoint, params, stack trace).
- Return safe errors to client — never expose stack traces, SQL, or internal paths.
- Use appropriate log levels: debug (dev), info (operations), warn (handled issues), error (needs attention).
- Every `except`/`catch` block either: logs with context, re-raises, or returns a specific error. Never empty.

## File Structure
- Keep route handlers thin. Business logic in service modules.
- Separate concerns: routes, models, services, database, utilities.
- Config from environment variables. Never hardcode secrets, URLs, or credentials.
- Use `.env` files for local dev. Never commit `.env` to git.

## Performance
- Async handlers for I/O-bound operations.
- Cache expensive computations and repeated queries.
- Set timeouts on external API calls and database queries.
- Use background tasks for non-blocking operations (email, notifications, analytics).
- Batch database operations when processing multiple records.

## Anti-Patterns — Never Do These
- Never `exec()` or `eval()` with user input.
- Never log passwords, tokens, API keys, or PII.
- Never use `datetime.utcnow()` — use `datetime.now(timezone.utc)`.
- Never hardcode `localhost` URLs. Use env vars for service URLs.
- Never return `200 OK` for errors. Use proper status codes.
- Never trust client-side IDs for authorization. Always verify server-side.
