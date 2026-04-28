# CLAUDE.md

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think & Surface Tradeoffs
**Don't assume. Don't hide confusion. Clarify before guessing.**
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.
- **Ambiguity**: Research the codebase, docs, and context before guessing. Use external search only when the answer depends on public or up-to-date information. Verify assumptions that affect behavior, architecture, data contracts, or public APIs.

## 2. Contextual Surgicality
**Match the local pattern for existing code. Clean up only your own mess.**
- **Read First**: Inspect neighboring naming, layering, and error handling before editing.
- **Surgical Edits**: Match existing style for surgical changes, even if you'd do it differently. Don't "improve" adjacent code, comments, formatting, or refactor things that aren't broken.
- **Unrelated Code**: If you notice unrelated dead code, mention it - don't delete it.
- **Orphans**: Remove imports/variables/functions that YOUR changes made unused. Don't touch pre-existing dead code.
- **Diff Discipline**: Every changed line should trace directly to the user's request.

## 3. Minimalist Excellence
**High-quality logic for NEW code. Avoid brute-force and complexity.**
- **Scope**: No features beyond what was asked. No abstractions for single-use code. No unrequested flexibility or configurability.
- **Real Failures Only**: Don't add error handling for impossible scenarios; handle realistic failures clearly.
- **50 vs 200**: If you write 200 lines and it could be 50, rewrite it. No speculative or "just-in-case" features.
- **Senior Check**: If a senior engineer would call it overcomplicated, simplify it.
- **O(n) over O(n²)**: For *new* logic, prefer hash maps/sets over nested loops. Avoid O(n) operations (like `.includes`) inside loops.
- **Flatten Indentation**: Avoid more than 2 levels of nesting. Use guard clauses (return early).
- **Decomposition**: Extract complex state tracking into small, named functions.

## 4. Goal-Driven Execution
**Define success criteria. Plan -> Act -> Validate.**
- Transform tasks into verifiable goals (e.g., "Write test for X, then make it pass").
- For multi-step tasks, share a brief plan first.
- **Loop until verified**: Validation is the only path to finality.
- **Examples**: "Add validation" -> write invalid-input tests, then make them pass. "Fix the bug" -> reproduce it with a test, then pass. "Refactor X" -> ensure tests pass before and after.
- **Criteria Quality**: Strong criteria let you loop independently. Weak criteria ("make it work") require clarification.

## 5. Sacred API Contracts
**Do not break backward compatibility. Contract-first design.**
- **API First**: When changing API behavior or schemas, update OpenAPI specs before implementation. Align implementation and tests.
- **Compatibility**: For public APIs, add optional fields only. Never rename fields. Treat enums with caution because new or changed values can break clients.
- **Shared Contracts**: Don't duplicate schemas casually, but don't force sharing across ownership boundaries. Use common dependencies and references when models are owned and evolved together.
- **Generated Code**: Keep generated code aligned with contract structure.

## 6. Reliable Messaging & Event-Driven
**Design for asynchronous reliability and schema evolution.**
- **Resilience**: Ensure idempotence and handle retries/DLQ. Design for "at least once" delivery.
- **Evolution**: Use compatible schema changes. Consumers must tolerate unknown fields.
- **Ordering**: Use stable partition keys when ordering is required.

## 7. Architectural Boundaries
**Keep each layer focused on one kind of work.**
- **Boundaries**: Controllers and adapters should only translate input, perform boundary-level validation, and delegate.
- **Logic**: Keep transport-specific code out of core business logic.
- **Models**: Share contract models only when owned and evolved together.

## 8. Feedback-Driven Focus
**Fix the smallest real problem first.**
- Resolve the specific concern raised; don't silently solve a different problem.
- If feedback asks for a rename, start with a rename, not a redesign.
- Don't refactor the whole layer when only one responsibility is misplaced.

## 9. Preserve Test Semantics
**Don't silently change the kind of test you're writing.**
- Keep existing integration or slice-test patterns. Don't convert to unit tests for easier mocking.
- Rename tests when the current name no longer matches behavior.
- Use narrow fixture or property overrides instead of rebuilding test scaffolding.

## 10. Project Lessons Engine
**Distill PR feedback into living lessons to avoid repeated traps.**
- Add only repeated mistakes observed while using coding agents.
- Keep bullet points concise and action-oriented.
- (Add project-specific mistakes here as they happen)

---
**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.
