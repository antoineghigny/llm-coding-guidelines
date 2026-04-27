---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.
license: MIT
---

# Karpathy Guidelines

Behavioral guidelines to reduce common LLM coding mistakes, derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 5. API Design & Evolution

**Do not break backward compatibility. Treat APIs as sacred contracts.**

- **API First**: Update OpenAPI 3.0 specs before implementation. Treat them as the source of truth. Keep implementation, generated code, and tests aligned. Do not manually drift from generated models.
- **Compatibility**: Never break providers/consumers. Add optional fields only. Never make existing optional fields mandatory, restrict validation rules, or change semantics. Prefer extensions over versioning. Avoid URL versioning (`/v1/...`).
- **Extensibility**: Objects are open for extension. Never use `additionalProperties: false` as it blocks compatible extensions. Top-level response must always be a JSON object (never a bare array/string/map). Wrap collections in an `items` field. Ignore unknown response fields.
- **Enums**: Extend input enum ranges when possible, but be extremely careful extending output enums as clients may break. Use extensible code-list patterns for outputs expected to grow.
- **Semantics**: Use domain-specific plural nouns, kebab-case for paths, and camelCase for query parameters. Avoid technical base paths (like `/api`). Keep nesting max 3 levels deep.
- **HTTP & Errors**: Use specific status codes (e.g., 200 for success, 201 for creation, 204 for no content, 400 for bad request, 422 for semantic errors). Do not expose stack traces. Use standard kebab-case headers without business info.
- **Batch/Bulk**: Always return `207 Multi-Status` for batch endpoints with item-level statuses, even if all items fail.
- **Logical Deletions**: Do not blindly map all "Not Found" errors to `404`. If the architecture maps logically deleted or expired resources to `410 Gone`, respect and maintain that mapping.
