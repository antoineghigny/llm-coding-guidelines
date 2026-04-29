# CLAUDE.md

Prefer the smallest verified change that preserves contracts, boundaries, tests, and user work.

For obvious edits, act directly. For risky, ambiguous, or multi-file work, inspect first, then state the plan and verification.

## 1. Ground First
**Read before choosing.**
- Inspect relevant code, tests, contracts, flags, docs, and local patterns before editing.
- State assumptions when they affect behavior, contracts, architecture, data, or tests.
- If multiple interpretations remain after inspection, present the tradeoff instead of silently choosing.
- Push back when the requested path is riskier or more complex than a simpler way to reach the same goal.
- Use external docs or search when the answer depends on current, public, or vendor-specific behavior.
- Ask only when exploration cannot resolve a behavior, contract, or architecture decision.

## 2. Keep Diff Narrow
**No drive-by cleanup.**
- Every changed line must serve the task.
- Match local style, naming, layering, error handling, and test shape.
- Do not reformat, rename, refactor, or delete unrelated code.
- Mention unrelated dead code or design issues; do not fix them unless asked.
- When responding to feedback, fix the specific concern first; do not silently redesign surrounding code.
- Preserve uncommitted work you did not create.
- Remove imports, variables, helpers, mocks, fixtures, and files made unused by your own changes.

## 3. Protect Contracts and Boundaries
**Owned interfaces are not implementation details.**
- For API, OpenAPI/schema, database, or message changes, update the contract source first and keep changes backward-compatible; prefer additive optional fields over renames or removals unless told otherwise.
- Do not edit shared models, enums, or payloads before identifying the owner and consumers.
- Do not duplicate shared schemas; consume them through the project's dependency or package mechanism.
- Keep transport mapping at boundaries; do not leak controller, client, or wire-format concerns into domain code.
- For async flows, preserve idempotence, retry/DLQ behavior, compatible schema evolution, and ordering keys.
- For feature flags, preserve default behavior, cover both enabled and disabled paths when behavior changes, and remove only flags requested by the task.

## 4. Keep Tests Honest
**Prove behavior through the layer users depend on.**
- Convert the request into observable success criteria before implementing when the change is non-trivial.
- For bug fixes, reproduce the failure with a focused test or command when practical, then make it pass.
- Do not downgrade integration, slice, e2e, or contract tests into unit tests.
- Use mocks only at real boundaries or for nondeterminism; never mock the behavior being validated.
- Prefer focused tests that reproduce the bug or prove behavior through observable outputs: responses, persisted state, emitted events, or boundary calls.
- Keep test names and fixtures aligned with changed behavior; prefer narrow fixture overrides over rebuilding scaffolding.
- Run the smallest relevant check first; broaden only when contracts, wiring, or shared behavior changed.

## 5. Build Simply, Finish Cleanly
**Obvious code, verified diff.**
- Do not add features, settings, dependencies, abstractions, or defensive branches not required by the task.
- Handle realistic failure modes; leave impossible states alone.
- Keep control flow shallow and data flow explicit; extract helpers only when they reduce real complexity.
- For new logic, prefer direct efficient structures such as maps or sets over avoidable nested scans.
- If the solution grows larger than the problem, simplify before continuing.
- Before finishing, inspect the diff, remove temporary artifacts, and report what was verified or could not be verified.
