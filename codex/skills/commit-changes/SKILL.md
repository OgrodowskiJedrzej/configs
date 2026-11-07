---
name: commit-changes
description: Inspect repository conventions, plan atomic commits, create a local branch for large changes, and commit only user-authorized work. Use when the user explicitly asks to commit repository changes. Do not use for status checks, reviews, or commit-message suggestions alone.
---

# Commit Changes

Commit only the changes the user authorized. Never treat a request to implement,
review, test, or suggest a message as permission to commit.

## Inspect before mutating

Read repository instructions and inspect:

- `git status --short`;
- staged and unstaged diffs, including relevant untracked files;
- the current and default branches;
- repository commit or release configuration and contributing documentation;
- 30–50 recent non-merge commit subjects.

Use explicit repository rules first, enforced tooling second, and consistent
recent history third. If no stable commit-message convention exists, use a
concise imperative subject without a trailing period. Do not claim an inferred
convention when the history is sparse or inconsistent.

Resolve the default branch from repository configuration, then the remote HEAD.
If neither is available, use `main` or `master` only when the corresponding
local or remote branch exists. Otherwise ask rather than guessing.

Separate user-authorized changes from unrelated work. If ownership cannot be
determined safely, stop and ask which paths or hunks belong to the commit. Never
discard, overwrite, stash, or commit unrelated changes.

Preserve an existing index. If staged content exactly matches one planned
atomic commit, keep it staged and account for it in the plan. Otherwise stop and
ask how to handle it; do not unstage, restage, or combine it automatically.

## Plan atomic commits

Group changes into independently understandable and revertible units. Each
commit must leave the repository in a coherent state when practical.

- Keep an implementation and its direct tests in the same commit.
- Separate unrelated behavior, infrastructure, documentation, and cleanup.
- Preserve dependency order between commits.
- Do not split changes merely to produce more commits.
- Do not rewrite, amend, squash, or reorder existing commits unless explicitly requested.

Treat the change as large when at least one condition holds:

- it requires more than one atomic commit;
- it spans multiple independent subsystems or concerns;
- it changes a public API, schema, dependency set, data format, or experiment behavior.

When the change is large and the current branch is the repository's default
branch, plan a new local branch before staging. Reuse a suitable non-default
branch when already on one. Infer the branch naming convention from repository
rules and existing branches; otherwise use `codex/<short-kebab-description>`.
Do not create nested replacement branches for work already isolated suitably.

## Confirm the execution plan

Before the first branch, staging, or commit mutation, report:

- the detected commit-message convention and its evidence;
- the current branch and whether a new branch is required;
- the proposed branch name, if any;
- each planned commit subject and its exact paths or hunks;
- the checks to run.

Proceed only when the current user request explicitly authorizes committing and
the plan stays within that request. Ask for confirmation when the plan introduces
a branch the user did not request explicitly, includes ambiguous changes, or
requires a materially different commit split than the user specified.

## Execute safely

Create the planned branch before staging. Stage only explicit paths or hunks;
never use broad staging commands when unrelated changes exist. Inspect the
staged diff and staged file list before every commit. Run the narrowest relevant
existing checks, then commit with the detected convention.

After each commit, verify its subject and changed paths. Stop on any failed
check, hook, commit, or unexpected worktree change and report the exact failure.
Do not bypass hooks without explicit authorization.

Never push, merge, rebase, amend, tag, delete branches, or modify remote state
unless the user explicitly requests that separate operation.

## Report

Return the branch name, commit hashes and subjects, checks run, remaining
worktree changes, and anything intentionally left uncommitted.
