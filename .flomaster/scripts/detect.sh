# Decide whether this Work Item's change owes change notes, and say what decided it.
#
# The decision reads the Work Item the Run is documenting rather than the Workspace. A file
# already sitting at the notes path was committed by an earlier change and says nothing about
# whether this one is worth recording, and its absence says nothing either. A Work Item labelled
# internal ships nothing a reader outside the work can observe, so it owes no notes; every other
# Work Item does. stdout is the whole Step result and is validated against the declared schema.
exec /usr/bin/python3 -c '
import json
import sys

internal = "internal" in json.loads(sys.argv[1])["labels"]
reason = (
    "The Work Item is labelled internal, so its change has nothing a reader outside it observes."
    if internal
    else "The Work Item carries no internal label, so its change is one a reader observes."
)
sys.stdout.write(
    json.dumps({"needs_documentation": "no" if internal else "yes", "reason": reason})
)
' "$@"
