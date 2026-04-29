# Examples

Supplementary examples for the five coding-agent guidelines. These examples are not part of the default agent prompt; keep active instructions in [`guidelines/core.md`](guidelines/core.md).

## 1. Ground First

**Request:** "Make search faster."

**Bad pattern:** immediately adds caching, indexes, async rewrites, and loading states.

**Better pattern:** inspect the current search path, tests, query plans, and measured latency first. Then choose the smallest change that targets the actual bottleneck.

## 2. Keep Diff Narrow

**Request:** "Fix the null pointer in invoice export."

**Bad pattern:** fixes the null pointer while reformatting the exporter, renaming helpers, and changing unrelated comments.

**Better pattern:** change only the null-handling path, update the focused test, and leave unrelated cleanup out of the diff.

## 3. Protect Contracts and Boundaries

**Request:** "Expose `customer_segment` on the customer API."

**Bad pattern:** adds a response field in the controller and copies a schema type from another module.

**Better pattern:** update the owned API schema first, keep the field optional for existing clients, regenerate generated code, and map from the owning layer instead of coupling to another module's source.

## 4. Keep Tests Honest

**Request:** "Fix checkout event emission."

**Bad pattern:** converts an integration test into a unit test with a mocked event publisher because asserting a method call is easier.

**Better pattern:** keep the integration test category, exercise real wiring, and assert the emitted message or captured boundary call.

## 5. Build Simply, Finish Cleanly

**Request:** "Add percentage discount calculation."

**Bad pattern:** introduces a strategy hierarchy, config objects, validators, and multiple discount types before they are needed.

**Better pattern:**

```python
def calculate_discount(amount: float, percent: float) -> float:
    return amount * (percent / 100)
```

Add structure only when a real second use case appears. Before finishing, inspect the diff and remove temporary aliases, stale comments, and unused helpers introduced during the change.
