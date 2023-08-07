zd() {
    usage() {
        echo "usage: zd [OPTIONS]"
        echo "\tzd: cd to selected options below"
        echo "OPTIONS:"
        echo "\t-d [path]: Directory (default)"
        echo "\t-a [path]: Directory included hidden"
        echo "\t-r [path]: Parent directory"
        echo "\t-s [query]: Directory from stack"
        echo "\t-f [query]: Directory of the selected file"
        echo "\t-z [query]: Frecency directory"
        echo "\t-h: Print this usage"
    }

    # No arg
    if [ ! $1 ]; then
        _fd
    # Args is '..' or '-' or [path]
    elif [ $1 = '..' ]; then
        shift; _fdr $1
    elif [ $1 = '-' ]; then
        shift; _fst "$*"
    elif [ ${1:0:1} != '-' ]; then  # first string is not -
        _fd $(realpath $1)
    # Args is start from '-'
    else
        while getopts darfszh OPT; do
            case $OPT in
                d) shift; _fd  $1; return 0;;
                a) shift; _fda $1; return 0;;
                r) shift; _fdr $1; return 0;;
                s) shift; _fst "$*"; return 0;;
                f) shift; _cdf "$*"; return 0;;
                z) shift; _zz  "$*"; return 0;;
                h) usage; return 0;;
                *) usage; return 1;;
            esac
        done
    fi
}
