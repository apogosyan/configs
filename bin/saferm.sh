#!/bin/bash
# Copy files to hidden folder before removing them
# set -x

TRASHDIR="$HOME/.rm-archive"
REALRM="$(which rm)"

die() {
    printf '%s\n' "$1" >&2
}

if [ $# -eq 0 ] ; then
    exec $REALRM
fi

FLAGS=""

while getopts "dfiPRrvW" opt; do
    FLAGS="$FLAGS -$opt"
done
shift $(( $OPTIND - 1 ))

mkdir -p "$TRASHDIR"
if [ ! -d "$TRASHDIR" ] || [ ! -w "$TRASHDIR" ] ; then
    die "$0 failed: cannot create/write to $TRASHDIR"
    exit 1
fi

for arg in "$@"; do
    dest="$TRASHDIR/$( date +%Y%m%d%H%M%S )__$(basename "$arg")"
    if [ -f "$arg" -o -d "$arg" ] ; then
        cp -R "$arg" "$dest"
    fi
done

exec $REALRM $FLAGS "$@"
