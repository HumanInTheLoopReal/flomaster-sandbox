set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1, keyed by input name. This
# Step declares one input and one JSON output under the same name, classification, so that object
# is already the aggregate receipt the engine validates, and the lane record holds the bytes the
# child Workflow exported rather than a second reading of them. The record path arrives as $2 from
# the one argument the Step declares beside the output that captures it.
mkdir -p "$(dirname "$2")"
printf '%s\n' "$1" > "$2"
printf '%s\n' "$1"
