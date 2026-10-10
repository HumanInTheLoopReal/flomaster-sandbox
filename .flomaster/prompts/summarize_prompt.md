State in plain English what this phase checked and what it found, so someone who
ran nothing themselves can act on it.

Write two things:

- A summary naming the checks that ran, the ones that did not run, and the
  outcome of each. Say it in sentences a reader can follow without reading a log.
- A verdict of `failed` when any check failed. A verdict of `inconclusive` when no
  check failed but a selected check was absent, because a validation that ran
  nothing has not shown the change to be sound. A verdict of `passed` only when
  every selected check ran and none failed.

Use only the scope decision and the check result you were given. Do not run a
check yourself, and do not report an outcome nothing recorded.
