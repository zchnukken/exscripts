# Collects CPU, network and memory statistics.
## Required packages
* sysstat

## Add permissions
chmod u+x mpstat.sh netspeed.sh memstat.sh

## Make sure you replace \<device name> with an appropiate device
## i.e eth0
./mpstat.sh &! ./netspeed.sh \<device name> &! ./memstat.sh 

