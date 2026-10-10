set -eu
# The resolved Step inputs arrive as one canonical JSON object in $1. A reviewer that approves
# while one of its own dimensions failed has contradicted itself, and the person asked to approve
# next would read only the verdict. A quote inside a finding is escaped in the text, so the exact
# `"result":"fail"` below can only be a dimension's own result.
case "$1" in
  *'"verdict":"approve"'*'"result":"fail"'* | *'"result":"fail"'*'"verdict":"approve"'*)
    printf '%s\n' 'The review approved the plan although one of its dimensions failed. Read the saved findings, then start the Run again.' >&2
    exit 1
    ;;
esac
printf '%s\n' '{}'
