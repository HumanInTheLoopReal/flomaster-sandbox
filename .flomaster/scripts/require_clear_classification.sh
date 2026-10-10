set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1, keyed by input name, and this
# Step declares one input, work_kind. Refusing here is a decision rather than a crash: the classifier
# already chose needs_clarification, so the Run ends with the reason on its Step instead of letting
# intake record a placeholder kind that planning would then read as a real one. The script prints
# its reason to stderr, which is what a failed Step retains for a reader.
case "$1" in
  *'"work_kind":"needs_clarification"'*)
    printf '%s\n' 'The Work Item does not say enough to tell a bug from a feature or a chore. Clarify what it asks for and start the Run again.' >&2
    exit 1
    ;;
esac
printf '%s\n' '{}'
