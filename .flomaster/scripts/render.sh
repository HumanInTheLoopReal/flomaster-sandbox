# Put the change notes the writer authored at the one path this phase commits.
#
# The Agent returns the document as text and this Step puts it on disk, so a rehearsal and a live
# Run reach the file by the same road and the Agent needs no Workspace tool of its own. The Step
# declares the file as its output, so the engine captures it from here into the Artifact that the
# staging and commit Steps then carry into Source Control.
exec /usr/bin/python3 -c '
import json
import pathlib
import sys

body = json.loads(sys.argv[1])["body"]
path = pathlib.Path("docs/change-notes.md")
path.parent.mkdir(parents=True, exist_ok=True)
path.write_text(body if body.endswith("\n") else body + "\n", encoding="utf-8")
sys.stdout.write("{}")
' "$@"
