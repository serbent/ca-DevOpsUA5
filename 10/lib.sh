function logtofile() {
    case $1 in
    1)
        local INFOLEVEL='[INFO]'
        ;;
    2) 
        local INFOLEVEL='[WARNING]'
        ;;
    3) 
        local INFOLEVEL='[ERROR]'
        ;;
    esac

    echo "[`date '+%d-%m-%Y %H:%M:%S'`]" $INFOLEVEL" "$2 >> $DATE.log
}