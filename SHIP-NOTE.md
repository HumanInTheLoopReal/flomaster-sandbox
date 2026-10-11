# Sandbox reject test: HTML comment banner added to index.html

This change adds a short HTML comment near the top of index.html. It exists to exercise the approval gate in the ship Workflow. The Run should pause at the one approval a person owes, and if that approval is rejected, the Run should end without merging, leaving the default branch where it was.

Start with the top of index.html on branch flomaster/workflow_run_c236aa6eee7e48eb9d78e894c31bd757 at revision 2cbdfef93bcfdd1d8b1f90dc62ff8b09a9570001. Confirm the only edit is the comment block. Then check that the Workflow stops at the approval step and does not continue to merge.

I have not inspected the diff, run the Workflow, or exercised the rejection path, so none of this behavior is confirmed by this note. Rejection still needs to be tested through the launcher, with the default branch compared before and after to confirm it did not change.
