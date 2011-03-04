x=$HOME/bin/utils/bin/xutil.sh
r=$HOME/bin/utils/bin/runutil.sh
lib=$HOME/bin/utils/lib

alias printcode='$x 1 filters.sh printcode'


# apt
# install a pkg
alias apti="$x 1 apt.sh apti"

# list installed pkgs
alias aptl="$x 1 apt.sh aptl"

# remove installed pkgs
alias aptr="$x 1 apt.sh aptr"

# search  pkgs
alias apts="source $lib/apt.sh && apts"

#runbang
alias runbang="source $lib/vimlib.sh && runbang"
