set -eu

# The Workspace environment carries no PATH, so this Step is shell builtins only: a test for the
# file and printf for the one JSON object the engine reads back and retains as Run Evidence.
component="src/components/UploadButton.tsx"
name="reviewed_component_present"
invocation="[ -f $component ]"
purpose="Confirm the change under review still carries the file its concern names."

if [ -f "$component" ]; then
	passed=true
	summary="The file both reviewers read is present in the reviewed tree."
else
	# A check that found nothing to confirm reports that and exits cleanly. A failed check is a
	# fact about the change under review, not a failure of the Step that went looking.
	passed=false
	summary="The file both reviewers read is absent from the reviewed tree."
fi

printf '{"check_name":"%s","command":"%s","purpose":"%s","passed":%s,"summary":"%s"}\n' \
	"$name" "$invocation" "$purpose" "$passed" "$summary"
