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

## 2. Read Before Editing

**Understand the local pattern before changing code.**

Before editing:
- Inspect neighboring implementations and tests.
- Check existing naming, layering, error handling, and test style.
- Search for similar features before inventing a new pattern.

## 3. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 4. Surgical Changes

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

## 5. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

## 6. API Design & Evolution

**Do not break backward compatibility. Treat APIs as sacred contracts.**

- **API First**: Update OpenAPI specs before implementation. Align implementation, generated code, and tests.
- **Compatibility**: Add optional fields only. Never rename fields or change semantics.
- **Enums**: Extend input enums freely; be cautious with output enums as they may break clients.
- **Versioning**: Prefer compatible extensions over versioning. Avoid breaking changes.

## 7. Event-Driven & Messaging

**Design for asynchronous reliability and schema evolution.**

- **Schema Evolution**: Use compatible schema changes. Ensure consumers tolerate unknown fields.
- **Ordering**: Use stable partition keys when message ordering is required.
- **Reliability**: Ensure idempotence and handle retries/DLQ. Design for "at least once" delivery.

## 9. Computational Efficiency & Clean Logic

**Avoid brute-force solutions and deep nesting.**

- **O(n) over O(n²)**: Prefer hash maps/sets over nested loops for lookups or duplicate checks.
- **Flatten Indentation**: Avoid more than 2 levels of nesting. Use guard clauses (return early) to keep logic flat.
- **Hidden Loops**: Be mindful of O(n) operations inside loops (e.g., `.includes`, `.indexOf`, `List.contains`).
- **State Management**: If logic requires multiple index variables (i, j, k), decompose it into smaller, named functions to avoid scope confusion.

## 10. Project Lessons

**Keep this section short. Add only repeated mistakes observed while using coding agents.**

- (Add project-specific mistakes here as they happen)
