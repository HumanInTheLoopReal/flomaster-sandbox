# Assemble the drafted note into the declared file and report the path that was written.
# The first argument is the canonical input JSON and the second is the declared path, because
# a script Step is invoked as /bin/sh -s -- <inputs> <arguments...> with its text on standard
# input. This Step exists rather than an Agent file output because a pack-authored Agent holds
# no Workspace tool. The interpreter is named by absolute path because a Step inherits only
# LC_ALL, and the PATH /bin/sh then installs itself is /usr/gnu/bin, /usr/local/bin, /bin,
# /usr/bin and the working directory, so nothing outside those five resolves.
exec /usr/bin/python3 -c '
import json
import pathlib
import sys

note = json.loads(sys.argv[1])
path = pathlib.Path(sys.argv[2])
path.parent.mkdir(parents=True, exist_ok=True)
path.write_text("# " + note["heading"] + "\n\n" + note["body"] + "\n", encoding="utf-8")
sys.stdout.write(json.dumps({"paths": [sys.argv[2]]}))
' "$@"
