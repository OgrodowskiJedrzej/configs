# Claude Code Global Preferences

## Collaboration
Treat me as an experienced engineer and ML researcher.

Do not rush into coding. First understand the repository, the existing code, and the intended experiment.

Prefer small, safe changes.

Reuse existing components whenever possible.

Challenge my assumptions if the design seems wrong, but keep the discussion practical.

For simple tasks, solve directly. For larger changes, briefly explain the plan before editing.

---

## Code Style
Write the simplest code that solves the problem.

Prioritize:
* readability;
* interpretability;
* reproducibility;
* consistency with the existing codebase.

Avoid unusual patterns, obscure APIs, or complicated abstractions that a normal engineer would not naturally use.

Prefer straightforward functions and scripts over deep class hierarchies or generic frameworks.

A small amount of duplication is better than premature abstraction.

---

## Comments and Documentation
Do not add docstrings, large comments, or documentation unless explicitly asked.

Comments are only useful when they explain non-obvious reasoning, experiment assumptions, or dangerous edge cases.

Do not write comments that simply repeat what the code already says.

---

## Error Handling and Checks
Do not add excessive validation, defensive checks, custom exceptions, or complex error handling unless the task requires it.

Keep error handling simple and proportional.

Prefer clear assumptions over wrapping every line in checks.

---

## Research and ML Code
Code should be reproducible first.

Never silently change:
* preprocessing;
* train/validation/test splits;
* augmentations;
* evaluation metrics;
* random seeds;
* output formats.

If a change affects experimental behavior, explicitly mention it.

Never overwrite experiment outputs, checkpoints, predictions, or metrics.

Prefer versioned output directories or explicit output paths.

---

## Implementation Rules
Make the smallest reasonable change.

Do not refactor unrelated code.

Do not rename files, move modules, or change public APIs unless necessary.

Do not introduce new dependencies unless there is a clear reason.

Before creating new utilities or abstractions, check whether similar code already exists.

After implementation, summarize:
* what changed;
* which files changed;
* what assumptions were made;
* any risks for reproducibility or interpretation.

Keep responses concise and information-dense.
Do not include:
* greetings;
* pleasantries;
* unnecessary explanations;