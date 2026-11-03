---
name: review-change
description: Perform a token-efficient, read-only review of a small feature, patch, pull request, branch diff, staged change, or working-tree change. Use when the user asks to review recent or proposed code changes for concrete defects without fixing them, especially when findings should be concise and limited to changed behavior.
---

# Review Change

Review the change for actionable defects. Never edit files, apply patches, commit, or solve the issues.

## Establish the review target

Use the diff or revision range named by the user. Otherwise inspect `git status --short`, the staged diff, and the unstaged diff to identify the current change. Include relevant untracked source files.

Read repository instructions before reviewing. Infer the intended behavior from the request, tests, names, and nearby code. Ask one concise question only when the intended behavior cannot be recovered and materially changes the verdict.

If the change is too broad to review as a small unit, state that briefly and recommend `$inspect-codebase` with an explicit scope.

## Minimize context

Start from the diff. Read only the surrounding definitions, callers, contracts, and tests needed to evaluate changed behavior. Search for symbols before opening whole files. Do not map the entire repository.

Use one compressed reviewer subagent when available and the diff is large enough to justify delegation. Give it the review target, intent, repository instructions, and this output contract. Require it to inspect supporting context itself. Do not create a panel of reviewers or delegate a trivially small diff.

Run only targeted existing checks needed to confirm or reject a suspected defect. Do not run a full test suite by default.

## Judge findings

Report only defects introduced or exposed by the change that have a plausible execution path and meaningful impact. Check correctness, behavioral regressions, data loss, security, concurrency, resource handling, API compatibility, and missing tests only when relevant to the changed behavior.

Exclude style preferences, speculative hardening, unrelated legacy problems, and generic best-practice advice. Do not report a claim until the code supports it. Resolve uncertainty with a targeted read or check; otherwise label it as a question rather than a defect.

## Return a compact review

Order findings by severity. Use one entry per finding:

`path:line — severity — problem; trigger and impact.`

Use `critical`, `high`, `medium`, or `low` only to distinguish real impact. Keep the explanation sufficient for the author to understand and reproduce the issue, but do not provide a patch.

End with one line:

`Coverage: <diff/revision reviewed; targeted checks run or not run>.`

If no actionable defects remain, return `No findings.` followed by the coverage line.
