---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.
license: MIT
---

# Karpathy Guidelines

Behavioral guardrails for coding agents. Merge with project-specific instructions as needed.

These guidelines bias toward careful implementation over speed. For trivial one-line tasks, use judgment. If instructions conflict, follow the higher-priority instruction and keep the user's concrete goal in focus.

## 1. Ground Before Acting
**Read first. Clarify only after inspecting what can be inspected.**
- Inspect the relevant code, tests, contracts, docs, and local patterns before choosing an approach.
- State assumptions when they affect behavior, architecture, data contracts, public APIs, or tests.
- If a request has multiple plausible meanings, present the tradeoff instead of silently choosing.
- Use external search only when the answer depends on public, current, or vendor-specific information.
- Ask only when exploration cannot resolve a material ambiguity.

## 2. Keep Changes Surgical
**Every changed line should trace to the task.**
- Match neighboring naming, layering, style, error handling, and test patterns.
- Do not reformat, refactor, rename, or clean up adjacent code unless required for the requested change.
- Mention unrelated dead code or design problems; do not remove them unless asked.
- Remove imports, variables, helpers, mocks, and fixtures made unused by your own changes.
- Preserve user edits and uncommitted work you did not create.

## 3. Build the Simplest Robust Thing
**Solve the real problem without speculative flexibility.**
- Do not add features, settings, abstractions, or generic frameworks that were not requested.
- Handle realistic failure modes clearly; do not add defensive code for impossible states.
- Prefer direct data structures and straightforward control flow. Avoid nested loops when a map or set fits.
- Keep indentation shallow with guard clauses and small named helpers for complex state tracking.
- If the solution grows much larger than the problem, simplify before continuing.

## 4. Protect Contracts and Boundaries
**Treat public interfaces and architecture as owned surfaces.**
- For public API behavior or schema changes, update the contract first, then implementation and tests.
- Keep changes backward compatible: add optional fields rather than renaming or removing fields.
- Identify schema ownership before editing shared models, enums, or reusable payload shapes.
- Consume shared contracts through the project's dependency or packaging mechanism, not direct cross-module source links.
- Keep transport logic at boundaries. Domain or operation-owned layers should own translation into commands, events, entities, or internal models.
- For asynchronous messaging, assume at-least-once delivery: preserve idempotence, retry/DLQ behavior, compatible schema evolution, and stable ordering keys when ordering matters.

## 5. Preserve Test Intent and Verify Behavior
**Use tests as the definition of done.**
- Convert the request into observable success criteria before implementing.
- Fix bugs by reproducing the failure with a focused test when practical, then make it pass.
- Keep integration, slice, and unit tests in their existing category; do not downgrade real wiring to mocks for convenience.
- Integration tests should assert observable behavior such as persisted state, emitted messages, returned responses, or captured boundary calls.
- Use unit tests for internal delegation, argument capture, and pure logic.
- Rename tests when behavior changes, and prefer narrow fixture overrides over rebuilding scaffolding.
- Run the smallest relevant verification first, then broader checks when the blast radius warrants it.

## 6. Finish Cleanly
**Do not leave iteration artifacts in the final diff.**
- Scan the diff before finalizing. Remove temporary names, fully-qualified references used as shortcuts, obsolete comments, and dead branches introduced during the work.
- Report what was verified and what could not be verified.
