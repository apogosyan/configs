#!/bin/bash
# Takes a picture from webcam and saves to ~/mugshots/

WORKDIR="${HOME}/mugshots"
PHOTOMAKER=imagesnap

die() {
  printf '%s\n' "$1" >&2
}

in_path() {
    local cmd=$1
    local path=$2
    local result=1
    local oldIFS=$IFS
    IFS=:

    for dir in $path
    do
        if [ -x "$dir/$cmd" ] ;
        then
            result=0
        fi
    done

    IFS=$oldIFS
    return $result
}

has_imagesnap() {
    in_path imagesnap $PATH
    return $?
}

mk_workdir() {
    mkdir -p "$WORKDIR" > /dev/null 2>&1

    if [ ! -d "$WORKDIR" ] || [ ! -w "$WORKDIR" ] ; then
        die "$0 failed: cannot create/write to $WORKDIR in $HOME"
        exit 1
    fi
}

mugshot() {
    local SUFFIX=$( date +%Y%m%d%H%M%S )
    imagesnap -w 1 -q "$WORKDIR/mug_$SUFFIX.png" > /dev/null 2>&1
}

if has_imagesnap ; then 
    mk_workdir
    mugshot
else
    die "Unable to locate imagesnap"
fi
