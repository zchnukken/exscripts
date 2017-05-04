#!/bin/bash

logfile="CPULOG-$('date').txt";

interval="1";
duration="1000";

echo "Collecting CPU utilization data ...";
echo "Will run for $duration seconds";
echo "Sample rate: $interval seconds";

mpstat $interval $duration >> "$logfile";

echo "Results written to file \"$logfile\""
