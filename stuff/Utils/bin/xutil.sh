#!/bin/bash

u=$HOME/bin/utils
lib=$u/lib


[ "$#" -lt '3' ] && { 
    echo "Usage: $0 argnumber module command [args]"
    exit 1
}

argv=$1
mod=$2
cmd=$3
args=''

argn=0 # how many args effectively

i=0
eval last=\${$#}
while [ $# -gt 0 ]; do
    let i=$i+1
    if [ $i -gt 3 ]; then
        args="$args $1"
        let argn=$argn+1
    fi
    shift
done



[ -f $lib/$mod ] || {
    echo "Error: the module $mod doesn't exist in the library"
    exit 1
}

# source the file with the functions
source $lib/$mod

trim(){ echo $1; }
usage() { b=`basename $0`; echo "Usage - $b  $1 "; exit 1;  }

# catch  'doc' switch
cmdname=$(echo $cmd | sed 's/\..*//g')

cmddoc=${cmdname}_doc
cmdarg=${cmdname}_arg
doctxt=$(eval "echo \$$cmddoc")
argtxt=$(eval "echo \$$cmdarg")

args=$(trim $args)
[ "$args" = 'doc' ] && { 
    echo "$doctxt"
    usage "$argtxt"
}

[ "$argn" -lt "$argv" ] && {
    echo "Error: at least $argv args are needed"
    usage "$argtxt"
}

eval $cmd "$args"
