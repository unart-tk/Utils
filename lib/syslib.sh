# sys lib - a functions library
# =============================
#
#    by: ben, untar.org
#    in: bash, utils
#
set -u ; set -e

die (){ echo >&2 "$@"; exit 1; }

usage(){ die "Usage - $1"; }


del_doc='A trash for the cli, a save rm '
del () {
    [ $# = 1 ] || { usage "del <file>"; }
    file="$1";  trash="$HOME/trash/$(date +"%S%M%H%m%d%y")"
    [ -f "$file" ] || [ -d "$file" ] ||  { die "Error: $file not exist."; }
    [ -d "$trash" ] || mkdir -p "$trash"
    mv "$file" "$trash"/
}
