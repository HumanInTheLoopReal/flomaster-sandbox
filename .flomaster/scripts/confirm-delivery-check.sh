set -eu

check="./check"
name="delivery_fast_check"
purpose="Confirm the changed fixture still preserves its upload behavior."

if [ ! -x "$check" ]; then
	passed=false
	summary="The fixture fast check is absent or not executable."
elif "$check" >/dev/null 2>&1; then
	passed=true
	summary="The fixture fast check passed against the changed Workspace."
else
	passed=false
	summary="The fixture fast check failed against the changed Workspace."
fi

printf '{"check_name":"%s","command":"%s","purpose":"%s","passed":%s,"summary":"%s"}\n' \
	"$name" "$check" "$purpose" "$passed" "$summary"
