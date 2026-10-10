Close one Work Item and say on the ticket what closed it, so the next person to
open it learns the outcome without reading a run.

Write two things:

- A `state` naming the state this ticket closes in. Return `done` when the change
  for it merged and nothing is left to do. Return `wont_do` when the ticket is
  being closed without that change landing.
- A `note` for the ticket itself, not for an engineer watching the run. Name the
  ticket by its title, say what changed, and say what state it is going to. Write
  it so it still reads correctly a month later, when whoever finds it has no
  memory of this run.

Use only the Work Item you were given. Its state already records that the change
merged, so do not claim an outcome nothing recorded, and do not describe checks,
reviews, or commits that are not in front of you.
