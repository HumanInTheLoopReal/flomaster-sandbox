set -eu

# The engine hands this Step its validated inputs as one canonical JSON object in $1 and
# reads one JSON object back from standard output. The Workspace environment carries no PATH,
# so the single declared field is read by matching that canonical text instead of by asking an
# interpreter that is not reachable from here.
case "$1" in
*'"needs_e2e":"required"'*) planned="./check ./check-e2e" ;;
*) planned="./check" ;;
esac

checks=""
failures=0
inconclusive=0
for command in $planned; do
	if [ ! -x "$command" ]; then
		# A selected check that is not here did not pass. Counting it as one would let a
		# checkout able to run nothing at all report a clean validation, so an absent check
		# is counted apart from a failing one and the retained text names which it was.
		checks="$checks $command is absent from this checkout, so it did not run."
		inconclusive=$((inconclusive + 1))
	elif "$command" >/dev/null 2>&1; then
		checks="$checks $command passed."
	else
		checks="$checks $command failed."
		failures=$((failures + 1))
	fi
done

printf '{"checks":"%s","failures":%s,"inconclusive":%s}\n' "${checks# }" "$failures" "$inconclusive"
