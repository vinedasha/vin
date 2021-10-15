DB=log-data
DB2=log-data2
DB3=log-data3

NAME=MYDA
GR=graph1
GR2=graph2
GR3=graph3

NM=$(hostname)+'Dart'
IMG=graph.png

WIDTH=750
HEIGHT=350

TS=$(date +%s)

T0=$(expr $TS - 200)
T1=$TS

rrdtool graph $IMG \
	--width=$WIDTH	--height=$HEIGHT	\
	--start $T0	--end $T1	\
	--full-size-mode	\
	--disable-rrdtool-tag	\
	--font-render-mode light	\
	--border 0 \
	--color ARROW#baacc7	--color AXIS#000000 \
	--color FRAME#993322	--color CANVAS#222222	\
	--color FONT#a2a2d0		--color BACK#321414	\
	--color GRID#465945		--color MGRID#20155e	\
	--watermark "$(date): $NM"	\
	DEF:$GR=$DB.rrd:$NAME:AVERAGE	\
	DEF:$GR2=$DB2.rrd:$NAME:AVERAGE	\
	DEF:$GR3=$DB3.rrd:$NAME:AVERAGE	\
	LINE1:$GR#ffa000:yandex.ru \
	LINE2:$GR2#99ff99:google.com \
	LINE3:$GR3#deaa88:bbc.com 
