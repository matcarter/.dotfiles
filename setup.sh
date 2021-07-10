#!/bin/bash

excludedFiles=". .. .git"

function contains {
    local list="$1"
    local item="$2"

    if [[ $list =~ (^|[[:space:]])"$item"($|[[:space:]]) ]]; then
        result=1
    else
        result=0
    fi

    return $result
}

for FILE in .*; do
    contains "$excludedFiles" "$FILE"

    if [[ $result -eq 0 ]]; then
        ln -s "$FILE" ../"$FILE"
    fi
done
