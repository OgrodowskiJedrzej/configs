---
name: inspect-codebase
description: Perform a token-conscious, read-only inspection of a codebase, subsystem, workflow, or technical concern and report concrete defects without fixing them. Use for broader code health investigations, architecture-aware bug hunts, cross-file interaction reviews, or general inspections that are not anchored to one small diff.
---

# Inspect Codebase

Inspect a bounded area for concrete issues. Never edit files, apply patches, commit, or solve the issues.

## Bound the inspection

Identify the subsystem, workflow, entry point, or concern under review. If the request is only “review the codebase,” inspect the repository structure and ask the user for one scope that can produce meaningful coverage. Do not imply exhaustive coverage of an entire repository.

Read repository instructions and the smallest set of manifests or entry points needed to understand the scope. State the chosen boundary before deep inspection.

Recover the intended contract from documentation, tests, callers, and established repository behavior. Do not invent requirements from general best practices. When behavior may be an intentional policy and the repository does not resolve it, report a question rather than a defect.

## Investigate progressively

Use `rg` or `rg --files` to locate ownership, entry points, callers, tests, and external boundaries. Open targeted regions rather than whole files whenever possible.

Form one to three evidence-based review hypotheses from the actual design, such as a state transition spanning multiple modules or a trust boundary with inconsistent validation. Do not run a fixed correctness, security, performance, and maintainability checklist against every target.

Delegate a bounded investigation or review to a compressed subagent when available. Give each agent one concrete scope and require path-and-line evidence. Use sequential expansion: inspect the first result, then widen only when it reveals a real dependency or unresolved failure path. Do not spawn agents merely to obtain independent opinions.

Stop expanding when the scoped paths are covered, new reads repeat known evidence, or further certainty requires runtime data not available in the repository.

Run only targeted existing checks that discriminate between plausible explanations. Avoid full builds and test suites unless the user explicitly requests them or the inspected scope cannot be assessed otherwise.

## Judge findings

Report an issue only when it has a plausible trigger, code-supported causal path, meaningful impact, and a demonstrated conflict with the intended contract. Distinguish confirmed defects from unresolved questions.

Exclude style preferences, broad refactoring suggestions, undocumented taste, duplicated generic advice, and hypothetical risks without a reachable path. Do not convert incomplete coverage into a finding.

## Return a compact inspection

Start with:

`Scope: <paths, subsystem, workflow, or concern actually inspected>.`

List confirmed findings by severity:

`path:line — severity — problem; trigger and impact.`

Then list unresolved questions only when they could materially change the assessment:

`Question — <missing fact and why it matters>.`

End with:

`Coverage limits: <important paths, runtime behavior, or evidence not inspected>.`

If no actionable defects are found, say `No findings.` Do not claim that the codebase is defect-free.
