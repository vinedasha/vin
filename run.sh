ping -q -n -c 2 yandex.ru > res.txt
AVG="'lua5.3 test.lua'"
echo $AVG

rrdtool update latency.rrd `date +%s`:$AVG
#rrdtool fetch latency.rrd MAX --start `cat start.txt` \
--end `date +%s` | tail

rrdtool graph ping.png --start `cat start.txt` \
--end `date +%s` \
DEF:ping=latency.rrd:rtt:AVERAGE \
LINE2:ping#FF0000
