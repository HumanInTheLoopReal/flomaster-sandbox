Judge the retained plan record you were given against the Work Item it answers,
one dimension at a time, and return a finding for each beside one verdict.

The dimensions you were given are listed under `review_dimensions` in your
context. Each is a separate question with a separate answer, and a dimension you
were not given is not yours to raise:

- `architecture`: would the plan fit how the code is already organised, or does
  it cut across a boundary the repository keeps?
- `security`: does the plan open a way to misuse the change, or leave one the
  Work Item makes reachable unaddressed?
- `scope`: does the plan do what the Work Item asks and nothing beyond it?

For each dimension return `pass` or `fail` and a finding that quotes the part of
the plan that decided it rather than restating the plan.

Choose exactly one verdict:

- `approve` only when every dimension passed.
- `revise` when any single dimension failed, however well the others went. The
  reason names which dimension failed and the one change that would make it pass.

You did not write this plan and you are not being asked to rewrite it. Judge
only what the record says, and change no file.
