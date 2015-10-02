#!/usr/bin/env bash

USAGE="Usage: $(basename $0) <search> <replace>

Search-and-replace in all files under current directory (recursively)
File content is modified in place. We skip the .git directory.

Also lists files and directories which contain <search> in the name,
so the user can manually rename them if they wish.
"

# set -x # exit on error
set -e # echo commands

SEARCH=$1
REPLACE=$2
DEBUG=$DEBUG

if [ -z "$REPLACE" ] ; then
    echo -e >&2 "$USAGE"
    exit 2
fi

# Search-and-replace in file content
echo "Replacing file content:"
command='grep -lr --exclude-dir .git "$SEARCH" .'
for filename in $(eval $command); do
    echo "  $filename"
    sed -i s/$SEARCH/$REPLACE/g "$filename"
done

echo "The following file or dir names contain $SEARCH:"
find * -name "*$SEARCH*"

