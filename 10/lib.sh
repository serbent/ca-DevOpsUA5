# -----------------------------------------------------------------------------
# Function: logtofile
# Logs a message to a file named after the current date.
#
# Parameters:
#   $1 - Log level (1=INFO, 2=WARNING, 3=ERROR)
#   $2 - Message to log
#
# Behavior:
#   - Prepends each log entry with a timestamp and log level.
#   - Appends the log entry to a file named "$DATE.log".
#   - Uses the global variable $DATE for the log file name (must be set elsewhere).
# -----------------------------------------------------------------------------

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