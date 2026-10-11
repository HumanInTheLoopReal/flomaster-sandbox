# One-line README.md addition shipped through the ship Workflow behind a single approval

What changed: this change adds one line to README.md. It is carried on branch flomaster/workflow_run_01e114a8fd0c491ba4797d0a29634d79 at revision 15623d197883146f40469c8bdf809161b604ba35, in the sandbox worktree for this Run. Nothing else is part of the change.

How it ships: the ship Workflow opens a change request for the one-line edit, then pauses for the one approval a person owes. After approval, the change request merges.

Look at first: the single added line in README.md, to confirm it is the only edit on the branch. Then check that the change request exists and that the Run is waiting at the approval step before anyone approves.

Status: I have not run the Workflow, opened the change request, approved it, or confirmed the merge. The test plan (run through the launcher, approve, confirm the merge) is still open. I also did not have the README.md diff text, so the exact wording of the line is not recorded here.
