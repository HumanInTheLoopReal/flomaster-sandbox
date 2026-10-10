set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1, keyed by input name, and this
# Step declares exactly the two values the plan writer returned. So that object already is the plan
# record, and the record path arrives as $2 from the one argument the Step declares beside the
# output that captures it. The plan writer declares no Workspace tool, so the Agent returns the
# plan and this Step is what puts it on disk, which is also what makes a rehearsal and a live Run
# reach the record by the same road. A failed write ends the Step
# rather than reaching the receipt below and leaving stale bytes to be captured.
mkdir -p "$(dirname "$2")"
printf '%s\n' "$1" > "$2"
printf '{}\n'
