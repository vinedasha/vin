rm -f latens.rrd

DT="`date +%s`"
echo $DT > start.txt

rrdtool create latenc.rrd --start $DT --step 2 \
	DS:rrt:GAUGE:5:U:U \
	RRA:AVERAGE:0.5:2:5000
