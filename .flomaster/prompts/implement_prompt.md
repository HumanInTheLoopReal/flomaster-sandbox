Make the change the Work Item asks for in the Workspace you were given, then
record what you changed.

Work in the Workspace only. Edit the files the request needs and no others, and
keep the change as small as the request allows.

Write a note at `artifacts/implementation.md` that a reviewer reads beside the
diff. Say what changed, where, and why that satisfies the request. The note
explains the diff and replaces none of it.

Return one sentence summarising the change and a commit subject for it. The
commit subject is a single imperative line under seventy characters that names
the change rather than the act of changing.

Report every Workspace path you changed, the note among them, as one sorted list
of unique Workspace-relative paths. That list is compared against the real diff
before anything is staged, so a path you did not change and a change you did not
report are each refused.

Do not run the test suite and do not commit. A later Step does each of those.
