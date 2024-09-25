set -l modsDir $argv[1]
function info
    echo $argv >&2
end
if test -z "$modsDir"
    info "Usage: create-templates <mod-dir>"
    exit 1
end

set -l variants gun mod gear ammo empty
set -l realismSubDirs weapons attatchments gear ammo ""
set -l commonFilter '(. != null) and (type == "object") and has("TemplateType")'
set -l filters \
    "($commonFilter) and ((.TemplateType == \"gun\") or has(\"WeapType\"))" \
    "($commonFilter) and ((.TemplateType == \"mod\") or has(\"ModType\"))" \
    "($commonFilter) and ((.TemplateType == \"gear\") or has(\"speedPenaltyPercent\"))" \
    "($commonFilter) and ((.TemplateType == \"ammo\") or has(\"PenetrationPower\") or has(\"Damage\"))" \
    '(. != null) and (type == "object") and ((has("TemplateType") | not) or (.TemplateType == "") or (.TemplateType == null)) and has("ItemID") and has("Name")'
set -l realismDir "$modsDir/Realism"

set -l outDir templates
mkdir -p "$outDir"

info "Finding other files..."
set -l jsonFiles (fd --type f --glob '*.json' "$modsDir")
set -l otherFiles
for file in $jsonFiles
    if jq --exit-status '(type == "object") and (to_entries | map(.value) | all(type == "object"))' $file &>/dev/null
        set -a otherFiles $file
    end
end
info "Number of other files found: $(count $otherFiles)"

for i in (seq (count $variants))
    set -l variant $variants[$i]
    set -l filter $filters[$i]
    info ""
    info "Making template for $variant"

    set -l realismSubDir $realismSubDirs[$i]
    set -l realismPath "$realismDir/user/mods/SPT-Realism/db/templates/$realismSubDir"
    set -l realismFiles (fd --type file --glob '*.json' "$realismPath")

    info "Number of realism files found: $(count $realismFiles)"

    set -l allFiles $otherFiles $realismFiles
    info "Total number of files found: $(count $allFiles)"
    set -l objectSets
    for file in $allFiles
        set -a objectSets (jq "map_values(select($filter))" $file)
    end

    set -l objects (echo $objectSets | jq -s 'add')
    info "Total number of objects found: $(echo $objects | jq 'length')"

    echo $objects | jq add >"$outDir/$variant.json"
end
