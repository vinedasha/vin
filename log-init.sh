START=$(date +%s)
echo "start time: $START"
echo $START > log-start.txt
INTERVAL=5
NAME=MYDA
TYPE=GAUGE
MIN=5
MAX=5000
STEP=2
ROWS=1200
FUNC=AVERAGE

rrdtool create \
	log-data.rrd \
	--start $START \
	--step $INTERVAL \
	DS:$NAME:$TYPE:$INTERVAL:$MIN:$MAX \
	RRA:$FUNC:0.5:$STEP:$ROWS

rrdtool create \
	log-data2.rrd \
	--start $START \
	--step $INTERVAL \
	DS:$NAME:$TYPE:$INTERVAL:$MIN:$MAX \
	RRA:$FUNC:0.5:$STEP:$ROWS

rrdtool create \
	log-data3.rrd \
	--start $START \
	--step $INTERVAL \
	DS:$NAME:$TYPE:$INTERVAL:$MIN:$MAX \
	RRA:$FUNC:0.5:$STEP:$ROWS
