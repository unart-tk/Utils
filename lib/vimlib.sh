# Vim lib - a functions library
# =============================
#
#    by: ben, untar.org
#    in: bash, utils
#
usage(){
    echo "Usage - $1"
    exit 1
}

runbang_doc='Run a script with matching interpreter, based on the shebang. Usefull for vim'
runbang () {
    [ $# = 1 ] || { usage "runbang <file>"; }
    # find shebangs, args are allowed:  '#!/usr/bin/perl -w'
    intp=$(head -n 1 "$1" | perl -wpl -e 's/.*\/(\w+\s*.*)\s*$/$1/g')
    ${intp} "$1"
}
