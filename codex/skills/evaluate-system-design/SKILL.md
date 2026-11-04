---
name: evaluate-system-design
description: Evaluate system-design decisions by tracing goals, the current implementation, constraints, and affected flows; developing viable architecture options; comparing implementation, migration, testing, operational, and maintenance costs; and giving evidence-backed opinions and a recommendation. Use when the user asks how to architect or rework a system, compare technical approaches, choose an implementation strategy, or assess tradeoffs before coding. Keep the work read-only and decision-focused.
---

# Evaluate System Design

Produce a decision brief grounded in the repository and the user's actual goal. Do not implement any option.

## Establish the decision

State the desired outcome, success criteria, constraints, and decision boundary. Recover them from the request, repository instructions, documentation, tests, configuration, and established behavior.

Ask one concise question only when missing information would materially reorder the options. Otherwise proceed with explicit assumptions.

Separate requirements from preferences and challenge premises that conflict with repository evidence or create disproportionate complexity.

## Trace the current system

Use targeted searches to locate entry points, owners, callers, interfaces, persistence boundaries, and relevant tests. Trace at least one representative end-to-end path through the behavior being redesigned.

Describe what exists before proposing replacements. Cite repository evidence with `path:line` references. Label inferences and unknowns rather than presenting them as facts.

Identify components that can be reused and constraints that make apparently simple options expensive.

## Develop viable options

Present two to four meaningfully different options. Include the smallest viable change and the cleanest long-term design when they are genuinely distinct. Include the status quo only when it is a credible choice.

For each option, specify:

- the components and interfaces that change;
- how it fits the current architecture;
- migration, compatibility, rollout, and rollback implications;
- important benefits, liabilities, and failure modes;
- the conditions under which the option is the best fit.

Discard infeasible options briefly. Do not create false balance between strong and clearly inferior designs.

## Compare costs

Use relative ratings such as low, medium, and high, supported by concrete cost drivers. Compare only dimensions relevant to the decision, including:

- implementation effort and code surface;
- conceptual complexity, coupling, and new abstractions;
- testing and verification burden;
- data or API migration work;
- operational load, observability, and reliability risk;
- long-term maintenance cost;
- performance or scaling consequences;
- reversibility and cost of changing direction.

Account for existing reusable components. Give numeric estimates only when repository evidence makes them defensible; otherwise avoid false precision.

## Form an opinion

Give a clear opinion on every viable option, not just neutral pros and cons. Recommend one option and explain why it best matches the stated goals and constraints. Name the runner-up when useful.

State what evidence, scale threshold, requirement, or operational constraint would change the recommendation. If no option is yet responsible to choose, identify the smallest investigation needed to resolve the uncertainty.

## Present the decision brief

Use this compact structure:

1. **Decision** — the question being resolved and the recommendation.
2. **Current state** — relevant implementation and evidence.
3. **Constraints and assumptions** — confirmed limits, inferences, and unknowns.
4. **Options** — a comparison table with changes, benefits, costs and risks, and best-fit conditions.
5. **Recommendation** — rationale, rejected tradeoffs, and runner-up.
6. **What would change the decision** — decisive unknowns or thresholds.

Keep the answer readable and proportional to the decision. Stop after the decision brief; do not edit files, add dependencies, or begin implementation.
