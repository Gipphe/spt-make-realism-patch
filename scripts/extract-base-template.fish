set -l modsDir $argv[1]
function info
    echo $argv >&2
end
if test -z "$modsDir"
    info "Usage: extract-base-template <mod-dir>"
    exit 1
end

set -l filter '(. != null) and (type == "object") and has("_id") and has ("_name") and has ("_props")'
set -l outDir templates
mkdir -p "$outDir"

info "Finding template files..."
set -l jsonFiles (fd --type f --glob '*.json' "$modsDir")
set -l allFiles
for file in $jsonFiles
    if jq --exit-status '(type == "object") and (to_entries | map(.value) | all(type == "object"))' $file &>/dev/null
        set -a allFiles $file
    end
end
info "Number of template files found: $(count $allFiles)"

info "Total number of files found: $(count $allFiles)"
set -l objectSets
for file in $allFiles
    set -a objectSets (jq "map_values(select($filter))" $file)
end

set -l objects (echo $objectSets | jq -s 'add')
info "Total number of objects found: $(echo $objects | jq 'length')"

echo $objects | jq add >"$outDir/base.json"
