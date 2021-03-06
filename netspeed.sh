#!/bin/bash

if [ -z "$1" ]; then
        echo;
        echo usage: $0 network-interface;
        echo;
        echo e.g. $0 eth0;
        echo;
        exit;
fi

IF=$1;

i="0";
duration="1000";
logfile="NETLOG-$(id -u -n)-$(date +%d-%m-%Y"_"%H:%M:%S).txt"

#hash ifconfig $IF 2>/dev/null
#ifexists=$?

#if [ $ifexists -eq 1 ]; then
#	ifconfig $IF >> "$logfile";
#else
#	cat /proc/net/dev >> "$logfile";
#fi

cat /proc/net/dev >> "$logfile";

#ifconfig $IF >> "$logfile";
#ip -a >> "logfile";

while [ $i -lt $duration ]
do
        R1=`cat /sys/class/net/$1/statistics/rx_bytes`;
        T1=`cat /sys/class/net/$1/statistics/tx_bytes`;
        sleep 1;
        R2=`cat /sys/class/net/$1/statistics/rx_bytes`;
        T2=`cat /sys/class/net/$1/statistics/tx_bytes`;
        TBPS=`expr $T2 - $T1`;
        RBPS=`expr $R2 - $R1`;
        TKBPS=`expr $TBPS / 1024`;
        RKBPS=`expr $RBPS / 1024`;
        echo "$(date) tx $1: $TKBPS kb/s rx $1: $RKBPS kb/s" >> "$logfile";

	i=$[$i+1];
done

cat /proc/net/dev >> "$logfile";

#ifconfig $IF >> "$logfile";

#if [ $ifexists -eq 1 ]; then
#	ifconfig $IF >> "$logfile";
#else
#	cat /proc/net/dev >> "$logfile";
#fi
