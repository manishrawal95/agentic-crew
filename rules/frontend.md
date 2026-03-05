# Frontend Rules

## Framework — Never Raw HTML
- Use React/Next.js with TypeScript. Never generate plain HTML files, jQuery, or vanilla JS.
- App Router, not Pages Router. Server Components by default, `"use client"` only when needed.
- Tailwind CSS for styling. Never inline `style={}` objects. Never raw CSS files unless design tokens.
- Use `<Link>` not `<a>` for internal navigation. Use `<Image>` not `<img>`.
- Use `<button>` not `<div onClick>`. Use `<form>` with `onSubmit`, not click handlers on buttons.

## Component Quality
- Every component handles: loading, empty, error, data, and edge case states.
- Skeleton loaders for async content. Never a blank screen while loading.
- Error boundaries for component-level failures with retry actions.
- All user feedback through toast notifications. Never `alert()`, `confirm()`, or `prompt()`.
- Forms: client-side validation + server-side validation. Disable submit during pending. Show inline errors.

## Responsive & Accessible
- Mobile-first: design for 375px, scale up. Test every component at 375px, 768px, 1440px.
- Touch targets: minimum 44x44px. No hover-only interactions.
- Input font size >= 16px (prevents iOS auto-zoom).
- Semantic HTML: `<nav>`, `<main>`, `<section>`, `<article>`, `<aside>`, `<header>`, `<footer>`.
- All interactive elements keyboard-accessible. Visible focus rings.
- Images: always have `alt` text. Decorative images use `alt=""`.
- Color contrast: WCAG AA minimum (4.5:1 for text, 3:1 for large text).

## Performance
- Lazy load below-the-fold content and heavy components.
- Optimize images: WebP/AVIF, proper sizing, responsive `srcSet`.
- No layout shift (CLS): set explicit dimensions on images/embeds.
- Debounce search inputs. Throttle scroll handlers. Cancel stale fetches.
- Use `useMemo`/`useCallback` only for expensive computations or stable references — not everywhere.

## Data Fetching
- API calls through proxy routes (`/api/...`). Never expose backend URLs to client.
- Always handle: loading state, error state, empty state, success state.
- Cancel requests on unmount (AbortController).
- Optimistic updates for instant-feeling interactions where safe.

## Anti-Patterns — Never Do These
- Never use `dangerouslySetInnerHTML` unless sanitized with DOMPurify.
- Never store sensitive data in localStorage/sessionStorage.
- Never use `any` type. Use `unknown` and narrow.
- Never catch errors silently: `catch (e) {}` is banned.
- Never use `// @ts-ignore` or `// @ts-expect-error` without a comment explaining why.
- Never use `var`. Use `const` by default, `let` when reassignment needed.
- Never use `==`. Always `===`.
