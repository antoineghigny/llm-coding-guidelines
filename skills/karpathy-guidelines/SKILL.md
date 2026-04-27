---
name: karpathy-guidelines
description: Behavioral guidelines to reduce common LLM coding mistakes. Use when writing, reviewing, or refactoring code to avoid overcomplication, make surgical changes, surface assumptions, and define verifiable success criteria.
license: MIT
---

# Karpathy Guidelines (Optimized)

Behavioral guidelines to reduce common LLM coding mistakes, derived from [Andrej Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on LLM coding pitfalls.

## 1. Think & Surface Tradeoffs
**Don't assume. Don't hide confusion. Clarify before guessing.**
- State assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- Push back on overcomplicated requests.

## 2. Contextual Surgicality
**Match the local pattern for existing code. Clean up only your own mess.**
- **Read First**: Inspect neighboring naming, layering, and error handling before editing.
- **Surgical Edits**: Match existing style for surgical changes. Don't "improve" adjacent code.

## 3. Minimalist Excellence
**High-quality logic for NEW code. Avoid brute-force and complexity.**
- **50 vs 200**: If you write 200 lines and it could be 50, rewrite it.
- **Efficiency**: Prefer hash maps/sets over nested loops. Avoid O(n) operations in loops.
- **Flatten Indentation**: Avoid more than 2 levels of nesting. Use guard clauses.

## 4. Goal-Driven Execution
**Define success criteria. Plan -> Act -> Validate.**
- Transform tasks into verifiable goals.
- For multi-step tasks, share a brief plan first.
- **Loop until verified**: Validation is the only path to finality.

## 5. Sacred API Contracts
**Do not break backward compatibility. Contract-first design.**
- **API First**: Update OpenAPI specs before implementation.
- **Compatibility**: Add optional fields only. Never rename fields.

## 6. Reliable Messaging & Event-Driven
**Design for asynchronous reliability and schema evolution.**
- **Resilience**: Ensure idempotence and handle retries/DLQ.
- **Evolution**: Consumers must tolerate unknown fields.

## 7. Architectural Boundaries
**Keep each layer focused on one kind of work.**
- **Boundaries**: Controllers delegate, logic stays pure.
- **Logic**: Keep transport-specific code out of core business logic.

## 8. Feedback-Driven Focus
**Fix the smallest real problem first.**
- Resolve the specific concern raised.
- If feedback asks for a rename, start with a rename, not a redesign.

## 9. Preserve Test Semantics
**Don't silently change the kind of test you're writing.**
- Keep existing integration or slice-test patterns. Don't convert to unit tests.
- Use narrow fixture overrides instead of rebuilding test scaffolding.

## 10. Project Lessons Engine
**Distill PR feedback into living lessons to avoid repeated traps.**
- Add only repeated mistakes observed while using coding agents.
- (Add project-specific mistakes here as they happen)
