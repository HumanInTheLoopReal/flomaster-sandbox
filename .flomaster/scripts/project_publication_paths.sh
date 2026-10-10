# Project observer-owned changed paths from the temporary Implementation document.
exec /usr/bin/python3 -c '
import json
import pathlib
import sys

document = json.loads(pathlib.Path(sys.argv[2]).read_text(encoding="utf-8"))
paths = document["changed_paths"]
sys.stdout.write(json.dumps({"paths": paths, "path_count": len(paths)}))
' "$@"
