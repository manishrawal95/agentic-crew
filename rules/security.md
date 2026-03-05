# Security Rules

## Input Validation — Trust Nothing
- Validate ALL user inputs on the server. Type, length, format, range.
- Sanitize before display: HTML-encode output to prevent XSS.
- Parameterized queries for ALL database operations. Never concatenate SQL.
- Validate file uploads: type, size, extension. Never trust `Content-Type` header.
- Validate URLs before fetching: allowlist protocols (https), block internal IPs (SSRF).
- Reject unexpected fields in request bodies. Use strict schemas.

## Authentication & Authorization
- Never store passwords in plain text. Use bcrypt/argon2 with salt.
- JWT tokens: short expiry (15-30 min), rotate refresh tokens, validate signature.
- Session tokens: httpOnly, secure, sameSite=strict cookies.
- Check authorization on EVERY request. Never rely on client-side route guards alone.
- Rate limit login attempts. Lock accounts after repeated failures.
- Invalidate sessions on password change and logout.

## Secrets Management
- Secrets in environment variables only. Never in code, comments, logs, or git.
- `.env` files in `.gitignore`. Always.
- Rotate API keys periodically. Use different keys for dev/staging/prod.
- Never log tokens, passwords, API keys, or PII.
- Never expose internal error messages, stack traces, or SQL to users.

## Headers & Transport
- HTTPS everywhere. Never serve over HTTP in production.
- Set security headers: `X-Content-Type-Options: nosniff`, `X-Frame-Options: DENY`, `Strict-Transport-Security`.
- CORS: restrict `Access-Control-Allow-Origin` to specific domains. Never `*` in production.
- CSRF protection on all state-changing requests.

## Common Attacks to Prevent
- **XSS**: Sanitize all user-generated content before rendering. Never `dangerouslySetInnerHTML` with raw user input.
- **SQL Injection**: Parameterized queries only. Never string-interpolate SQL.
- **CSRF**: Use CSRF tokens or SameSite cookies for state-changing operations.
- **SSRF**: Validate and allowlist URLs before server-side fetching.
- **Path Traversal**: Sanitize file paths. Never allow `../` in user-provided paths.
- **Command Injection**: Never pass user input to `exec()`, `eval()`, `os.system()`, or shell commands.
- **Mass Assignment**: Use explicit field allowlists. Never bind all request fields to models blindly.

## LLM / AI Security
- Sanitize user content before including in LLM prompts (prompt injection prevention).
- Set token limits and cost caps on all LLM calls.
- Never execute code returned by LLMs without sandboxing.
- Never pass secrets or PII to LLM APIs unless required and documented.
- Validate and sanitize LLM output before displaying to users or storing in database.

## Anti-Patterns — Never Do These
- Never disable security features "temporarily" without a plan to re-enable.
- Never use `--no-verify` to skip git hooks.
- Never commit `.env`, credentials, private keys, or tokens.
- Never use `md5` or `sha1` for password hashing. Use bcrypt/argon2.
- Never trust `X-Forwarded-For` without proxy validation.
- Never store sensitive data in localStorage or sessionStorage.
