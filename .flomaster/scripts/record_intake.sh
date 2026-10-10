set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1, so the intake record is
# written from what classify retained instead of from a second reading of the Work Item. The record
# path arrives as $2 from the one argument the Step declares beside the output that captures it, so
# this script holds no second copy of that path. A failed write ends the Step rather than reaching
# the receipt below and leaving stale bytes to be captured.
mkdir -p "$(dirname "$2")"
printf '%s\n' "$1" > "$2"
printf '{"classification":%s}\n' "$1"
