echo $1
echo $2
echo $3

# ERCF
MAIN="cc0d95cbd610"
# spare MMB
SPARE="fa6cb4652cba"


case "$2" in
    "spare")
        UUID=$SPARE
        ;;
    "main")
        UUID=$MAIN
        ;;
esac

#if one arg it is the main/spare
#set klipper restart to false
if [ $# -eq 1 ]
  then
    echo "arg 1 only"
fi

echo $UUID

if [[ -f /sys/class/net/can0/operstate ]]; then
	echo can0 up
else
	echo can0 down
fi
