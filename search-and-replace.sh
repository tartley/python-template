#!/usr/bin/env bash

USAGE = "\
Usage: $0 <search> <replace>

Search-and-replace in all files under current directory (recursively)
both in file content and in file and directory names.

We use a quick hack to skip '.git' directories, so as not to break the
repo, but in doing so we also skip all top level dot files (e.g. .gitignore)
"

# set -x # exit on error
set -e # echo commands

SEARCH=$1
REPLACE=$2
DEBUG=$DEBUG

function log {
  if [[ $DEBUG ]]; then
    echo "$1"
  fi
}

if [ -z "$REPLACE" ] ; then
    echo $USAGE
    exit 2
fi

# Search-and-replace in file content
log "Replacing file content:"
command='grep -lr --exclude-dir .git "$SEARCH" .'
for filename in $(eval $command); do
    log "  $filename"
    sed -i s/$SEARCH/$REPLACE/g "$filename"
done

# Search-and-replace in directory and file names.
# Using '*' instead of '.' skips the .git & .idea directories.
# We do this in two loops, dirs followed by files, so that files of the form:
#   xxx/xxxSEARCHxxx/xxx/xxxSEARCHxxx
# have their directory renamed by the first iteration,
# and their base file name renamed by the second iteration.
# avoiding the file-not-found errors that occur otherwise.
# This will break if we start using directories with more than one occurence of
# the search term, e.g:
#   xxx/xxxSEARCHxxx/xxx/xxxSEARCHxxx/xxx
log "Renaming dirs:"
command='find * -type d -name "*$SEARCH*"'
for filename in $(eval $command); do
  log "  $filename"
  mv "$filename" "${filename/$SEARCH/$REPLACE}"
done

log "Renaming files:"
command='find * -type f -name "*$SEARCH*"'
for filename in $(eval $command); do
  log "  $filename"
  mv "$filename" "${filename/$SEARCH/$REPLACE}"
done

