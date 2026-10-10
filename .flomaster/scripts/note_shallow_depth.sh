set -eu
# The shallow depth's half of the same choice. A route selects one Step per outcome, so the
# depth that researches nothing still needs a Step of its own to select, and this is it: it
# declares no output because nothing downstream reads one, and the empty receipt is what says
# the Step ran rather than was skipped.
printf '{}\n'
