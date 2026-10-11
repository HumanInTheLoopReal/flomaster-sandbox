# Runs the project's own check, the same command a person runs before a commit: ./check at the
# root of the Workspace. The check's output goes to standard error, so standard output carries
# only the one JSON object the engine reads.
#
# A missing ./check (absent, or present but not executable) fails this Step, because a checkout
# that cannot run its own check has not been verified. A failing ./check fails this Step, which
# sends the Run back to the change with the check's output in the retained text. A passing
# ./check reports the passed outcome.
#
# The engine does not tell a script which Attempt it is, so this script reports one Attempt,
# which is the Attempt it ran in. The Run still counts its Attempts against the restart policy.
if [ ! -x ./check ]; then
  printf '%s\n' './check is absent from this Workspace, so the unit suite did not run' >&2
  exit 1
fi
if ! ./check 1>&2; then
  printf '%s\n' 'the project check ./check failed' >&2
  exit 1
fi
printf '{"outcome":"passed","attempts":1}\n'
