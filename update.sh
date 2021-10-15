HOST=yandex.ru
HOST2=google.com
HOST3=bbc.com

DB=log-data
DB1=log-data2
DB2=log-data3

while :
do

	TS=$(date +%s)
	VAL=$(ping -c 2 -q -n $HOST | lua extract.lua)
	echo "$TS: $VAL ms"
	rrdtool update $DB.rrd $TS:$VAL

	TS=$(date +%s)
	VAL2=$(ping -c 2 -q -n $HOST2 | lua extract.lua)
	echo "$TS: $VAL2 ms"
	rrdtool update $DB1.rrd $TS:$VAL2

	TS=$(date +%s)
	VAL3=$(ping -c 2 -q -n $HOST2 | lua extract.lua)
	echo "$TS: $VAL3 ms"
	rrdtool update $DB2.rrd $TS:$VAL3

	sleep 1
done
