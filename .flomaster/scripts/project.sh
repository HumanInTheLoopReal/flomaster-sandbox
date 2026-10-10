# Each argument is one output_name=dotted.path pair read out of the canonical input JSON.
# An authored binding carries a schema digest and cannot select a field, so a Step needing one
# field of a built-in action's result projects it here instead. The interpreter is named by
# absolute path because a Step inherits only LC_ALL, and the PATH /bin/sh then installs
# itself is /usr/gnu/bin, /usr/local/bin, /bin, /usr/bin and the working directory, so
# nothing outside those five resolves.
exec /usr/bin/python3 -c '
import json
import sys

payload = json.loads(sys.argv[1])
projection = {}
for pair in sys.argv[2:]:
    output_name, _, path = pair.partition("=")
    value = payload
    for segment in path.split("."):
        value = value[segment]
    projection[output_name] = value
sys.stdout.write(json.dumps(projection, sort_keys=True))
' "$@"
