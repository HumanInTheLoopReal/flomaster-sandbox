set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1, keyed by input name, and
# this Step declares exactly the one input the route selects on. So the object already is the
# selection this Step publishes, and naming it rather than reading a value out of it keeps the
# declared enum and the branch outcomes one list instead of two that drift apart.
printf '%s\n' "$1"
