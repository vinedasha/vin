NOW=$(date +%s)
host=lenta.ru
while :
do
val=$(ping -c 2 -q -n $host | lua test.lua)
rrdtool update \
	log-data.rrd \
	$NOW:$VAL

echo "added $VAL at $NOW"
sleep 5
done
