DB=log-data
DB2=log-data2
DB3=log-data3

TS=$(date +%s)

T0=$(expr $TS \* 50)
T1=$TS

rrdtool fetch $DB.rrd AVERAGE -s $T0 -e $T1
rrdtool fetch $DB2.rrd AVERAGE -s $T0 -e $T1
rrdtool fetch $DB3.rrd AVERAGE -s $T0 -e $T1
