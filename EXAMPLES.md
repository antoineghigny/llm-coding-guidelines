# Examples

Supplementary examples for the six coding-agent guidelines. These examples are intentionally not part of the default agent prompt; keep the active instructions in [`guidelines/core.md`](guidelines/core.md).

## 1. Ground Before Acting

**Request:** "Make search faster."

**Bad pattern:** immediately adds caching, indexes, async rewrites, and UI loading states.

**Better pattern:** inspect the current search path, tests, query plans, and observed latency first. Then state the real choice: response latency, throughput, or perceived speed. Ask only if the code and metrics do not reveal which one matters.

## 2. Keep Changes Surgical

**Request:** "Fix the null pointer in invoice export."

**Bad pattern:** fixes the null pointer while also reformatting the exporter, renaming helpers, and changing unrelated comments.

**Better pattern:** change only the lines needed to handle the null case, update or add the focused test, and mention unrelated cleanup separately.

## 3. Build the Simplest Robust Thing

**Request:** "Add percentage discount calculation."

**Bad pattern:** introduces a strategy hierarchy, config objects, validators, and multiple discount types before they are needed.

**Better pattern:**

```python
def calculate_discount(amount: float, percent: float) -> float:
    return amount * (percent / 100)
```

Add more structure only when the product needs multiple discount models or shared policy behavior.

## 4. Protect Contracts and Boundaries

**Request:** "Expose `customer_segment` on the customer API."

**Bad pattern:** adds a response field in the controller and copies a schema type from another module.

**Better pattern:** update the owned API schema first, keep the field optional if clients already consume the response, regenerate or compile generated code, then map from the operation-owned layer rather than coupling directly to another module's source.

## 5. Preserve Test Intent and Verify Behavior

**Request:** "Fix checkout event emission."

**Bad pattern:** converts an integration test into a unit test with a mocked event publisher because it is easier to assert a method call.

**Better pattern:** keep the integration test category, exercise real application wiring, and assert the emitted message or captured boundary call that represents user-visible behavior. Use unit tests only for pure logic or delegation details.

## 6. Finish Cleanly and Capture Lessons

**Request:** "Rename the internal command from `CreateOrder` to `SubmitOrder`."

**Bad pattern:** leaves fully-qualified names, transitional aliases, stale test names, and old comments because the code compiles.

**Better pattern:** scan the diff before finalizing, remove iteration artifacts introduced during the change, run relevant tests, and report any verification that could not be run.

If the same mistake repeatedly appears in PR feedback, add one short bullet under `Project Lessons` in [`guidelines/core.md`](guidelines/core.md). Do not add a permanent rule for a one-off preference.
