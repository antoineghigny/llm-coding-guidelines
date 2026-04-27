# GEMINI.md

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

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

## 3. Surgical & Feedback-Driven Changes

**Touch only what you must. Fix the exact concern raised.**

- Match existing style. Don't refactor or format adjacent working code.
- Resolve specific feedback directly (e.g., if asked to rename, just rename; don't redesign).
- Remove only the dead code your changes create. Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

## 5. Architecture & Boundaries

**Keep each layer responsible for one kind of work.**

- **Boundaries**: Controllers and adapters translate input, validate, and delegate. Keep transport-specific code out of business logic.
- **Contracts**: Define shared models once. Duplicate schemas signal misplaced ownership. Keep generated code aligned with contract structure.

## 6. Preserve Test Semantics

**Don't silently change the kind of test you're writing.**

- Keep existing integration or slice-test patterns.
- Don't convert them to unit tests just to make mocking easier.

## 7. Configuration & Wiring

**Never guess where runtime state comes from.**

- **Traceability**: Trace configuration through local files, servers, and deployment manifests.
- **Flags**: A feature flag is only correct when every component that creates, injects, or calls it follows the flag.

## 8. Project Lessons

**Keep this section short. Add only repeated mistakes observed in review.**

- (Add project-specific mistakes here as they happen)

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.
