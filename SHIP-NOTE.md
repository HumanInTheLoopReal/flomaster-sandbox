# Add HTML comment banner to index.html behind the ship approval gate

This change adds a short HTML comment at the top of index.html on branch flomaster/workflow_run_06f9e9dabd4a4e3b936f7c30c4242fad at revision 2cbdfef93bcfdd1d8b1f90dc62ff8b09a9570001. The comment is the only intended content change and should not alter rendered output.

Shipping is gated by the ship Workflow, which stops at the one approval a person owes. If that approval is rejected, the Run must not merge, and the default branch must stay where it was before the Run.

Look first at:
1. The index.html diff. Confirm it is a single comment block at the top of the file and that nothing else changed.
2. The ship Workflow's approval step. Confirm it pauses for approval and that a rejection ends the Run without reaching a merge step.
3. The default branch after a rejected approval. It should match its state from before the Run.

Status: I have not opened the diff, run the Workflow, or exercised the rejection path. The Test Plan (reject the approval through the launcher, then check that the default branch is unchanged) has not been carried out as far as I was told.
