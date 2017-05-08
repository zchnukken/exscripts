#!/bin/bash

logfile="MEMLOG-$(id -u -n)-$(date +%d-%m-%Y"_"%H:%M:%S).txt"
interval="1";
duration="1500";

sar -r $interval $duration >> "$logfile";
