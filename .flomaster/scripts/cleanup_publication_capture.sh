# Remove only a known temporary document after generic Artifact capture has retained its bytes.
shift
for path in "$@"; do
  case "$path" in
    artifacts/intake.json|artifacts/plan.json|artifacts/implementation.md|artifacts/.flomaster-publication-implementation.json|artifacts/.flomaster-publication-review.json) ;;
    *)
      echo "publication capture cleanup path is not allowed" >&2
      exit 2
      ;;
  esac
done
for path in "$@"; do
  rm -f -- "$path"
done
printf '{}'
