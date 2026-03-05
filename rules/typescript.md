# TypeScript Rules

## Strict Mode — Non-Negotiable
- `strict: true` in tsconfig. No exceptions.
- No `any` type. Use `unknown` and narrow with type guards.
- No `// @ts-ignore`. Use `// @ts-expect-error` with an explanation comment only as last resort.
- No `as` type assertions unless narrowing from `unknown` after validation.
- Enable `noUncheckedIndexedAccess` — array/object access returns `T | undefined`.

## Type Everything
- Function parameters and return types: always explicit.
- API responses: typed interfaces matching actual backend shapes.
- Component props: typed interfaces, not inline objects.
- Event handlers: use React's event types (`React.MouseEvent`, `React.ChangeEvent<HTMLInputElement>`).
- Never use `Function` type. Use specific signatures: `(arg: Type) => ReturnType`.
- Never use `Object` or `{}` as a type. Use `Record<string, unknown>` or specific shape.

## Enums & Constants
- Prefer `as const` objects or string literal unions over TypeScript `enum`.
- Use `Record<Key, Value>` for lookup maps.
- Named constants for magic numbers and strings.

## Null Safety
- Handle `null` and `undefined` explicitly. No optional chaining as a band-aid.
- Use nullish coalescing `??` over logical OR `||` for defaults (avoids falsy traps with 0, "").
- Function arguments that could be missing: use `param?: Type` not `param: Type | undefined`.
- Check array bounds before access. `arr[i]` can be `undefined`.

## Modern Patterns
- Destructuring for props and function parameters.
- Template literals over string concatenation.
- `Map`/`Set` over object-as-hashmap when keys aren't string literals.
- `Promise.all` for independent async operations. `Promise.allSettled` when partial failure is ok.
- Optional chaining `?.` for deep property access on potentially null objects.
- `satisfies` for type-checking without widening.

## Anti-Patterns — Never Do These
- Never use `var`. Use `const` by default, `let` only when reassignment needed.
- Never use `==`. Always `===`.
- Never use `arguments` object. Use rest params `...args`.
- Never use `new Array()`. Use `[]`.
- Never use `delete` on arrays. Use `filter`.
- Never mutate function arguments. Return new values.
- Never use `String()`, `Number()`, `Boolean()` as constructors. Use lowercase primitives in types.
