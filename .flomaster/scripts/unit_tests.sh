# This stands in for the project's own unit suite, and it has two gates.
#
# The first is the suite: the label the ticket asks for has to be in the file that holds it. A
# suite that read only its own counter would pass on the second Attempt whatever the Agent did,
# so the phase would walk green over a Workspace nothing had changed, and an Agent that never
# makes the change now fails every Attempt and exhausts the Run's declared restart instead.
#
# The second is the counter, which forces exactly one failure so the Run exercises that restart.
# It is a separate gate because the Agent driving this phase writes the same change on every
# Attempt, so nothing about the Workspace can distinguish the first Attempt from the repaired
# one. The counter lives in the Workspace because nothing resets the Workspace between Attempts:
# the number a failed Attempt wrote is still there for the repaired one to read. Removing it on
# the way out is what leaves the Workspace holding only the change the staging Step goes on to
# stage.
#
# A Step holding write_workspace can pre-write this number, pass the suite on its first
# invocation and report a repair that never happened. Hiding the file does not close that:
# every path the Workspace tools refuse is either absent here or outside the Workspace, and a
# linked worktree keeps `.git` as a file rather than a directory. Closing it needs the engine
# to tell a script Step which Attempt it is, which is the fact the counter exists to
# reconstruct.
ledger=.unit-test-attempts
attempts=1
if [ -f "$ledger" ]; then
  attempts=$(( $(cat "$ledger") + 1 ))
fi
fail() {
  printf '%s\n' "$attempts" > "$ledger"
  printf '%s on attempt %s\n' "$1" "$attempts" >&2
  exit 1
}
if ! grep -Fqx 'label = "Upload"' ui/upload_button.conf; then
  fail 'the upload button label is still too long'
fi
if [ "$attempts" -lt 2 ]; then
  fail 'the unit suite failed'
fi
rm -f "$ledger"
printf '{"outcome":"passed","attempts":%s}\n' "$attempts"
