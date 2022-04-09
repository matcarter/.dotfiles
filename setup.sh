#!/bin/bash

excludedFiles=". .. .git"
scriptDir="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

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

function doSetup {
    for FILE in "$scriptDir"/.*; do
        file=${FILE##*/}
        contains "$excludedFiles" "$file"

        if [[ $result -eq 0 ]]; then
            destPath="$HOME/$file"

            if ! [[ -f $destPath ]]; then
                srcPath="$scriptDir/$file"
                echo "Creating symlink $destPath -> $srcPath"

                ln -s "$srcPath" "$destPath"
            fi
        fi
    done

    return 0
}

function doUnlink {
    for FILE in "$scriptDir"/.*; do
        file=${FILE##*/}
        contains "$excludedFiles" "$file"

        if [[ $result -eq 0 ]]; then
            destPath="$HOME/$file"

            if [[ -f $destPath ]]; then
                echo "Removing symlink $destPath"

                unlink "$destPath"
            fi
        fi
    done

    return 0
}

# Entry point

while getopts ":u" opt; do
    case $opt in
        u)
            doUnlink
            if [[ $? -eq 0 ]]; then
                exit 0
            else
                echo "Error running unlink function"
                exit 1
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
    echo "HERE"
done

# Default, no options passed, run setup
doSetup
if [[ $? -eq 0 ]]; then
    exit 0
else
    echo "Error running setup"
    exit 1
fi

