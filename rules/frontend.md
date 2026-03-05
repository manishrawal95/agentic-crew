# Frontend Rules

## Stack
- React/Next.js with TypeScript. Never generate plain HTML files, jQuery, or vanilla JS.
- App Router, not Pages Router. Server Components by default, `"use client"` only when needed.
- Tailwind CSS for styling. Never inline `style={}` objects. Never raw CSS files unless design tokens.
- shadcn/ui as the default component library. Radix primitives underneath.
- Framer Motion for animations. CSS transitions for simple hover/focus states.
- Use `<Link>` not `<a>` for internal navigation. Use `<Image>` not `<img>`.
- Use `<button>` not `<div onClick>`. Use `<form>` with `onSubmit`, not click handlers on buttons.

## Design Quality
The bar is Apple, Stripe, Linear, Vercel — not generic Bootstrap or default Material UI.
- **Typography**: Tight headings (`tracking-tight`), generous line height on body text. Use `font-semibold` over `font-bold`. Size hierarchy: clear distinction between levels.
- **Color**: Warm neutrals (stone/slate) over cold grays. Accent colors used sparingly. Muted pastels for status badges — never saturated primaries on white.
- **Spacing**: Generous whitespace. Let content breathe. Consistent spacing scale.
- **Cards/Containers**: Soft borders (`border-stone-200/60`), large radii (`rounded-2xl`), minimal or no shadows. Never sharp corners with hard drop shadows.
- **Empty states**: Illustration or icon in a soft container, helpful message, clear CTA. Never a blank page.
- **Consistency**: Same max-width, heading style, card style, and spacing across every page. No page should feel like a different app.
- **Never look AI-generated**: No generic gradients, no cookie-cutter layouts, no default component library look. Every screen should feel intentionally designed.

## Animation & Motion
- Framer Motion for: page transitions, mount/unmount, layout animations, staggered lists, gesture responses.
- CSS transitions for: hover states, focus rings, color changes, simple transforms.
- **Timing**: 150-300ms for UI feedback, 300-500ms for layout shifts, 200ms for hover/focus.
- **Easing**: `ease-out` for enters, `ease-in` for exits, spring physics for playful interactions.
- **Performance**: Animate only `transform` and `opacity`. Never animate `width`, `height`, `top`, `left`, or `margin`.
- **Purpose**: Every animation must serve a purpose — guide attention, show relationships, confirm actions. Never animate for decoration.
- **Subtle > flashy**: Micro-interactions (button press `scale(0.98)`, card hover lift, smooth skeleton shimmer) over dramatic page animations.
- **Reduced motion**: Respect `prefers-reduced-motion`. Wrap motion in `<AnimatePresence>` checks.

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
