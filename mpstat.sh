#!/bin/bash

logfile="CPULOG-$(id -u -n)-$(date +%d-%m-%Y"_"%H:%M:%S).txt"
interval="1";
duration="1500";

mpstat $interval $duration >> "$logfile";
