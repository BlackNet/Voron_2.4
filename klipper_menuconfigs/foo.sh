echo $1
echo $2
echo $3


if [[ -f /sys/class/net/can0/operstate ]]; then
	echo can0 up
else
	echo can0 down
fi
