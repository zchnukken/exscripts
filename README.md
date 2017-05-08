# Collects CPU, network and memory statistics.
## Required packages
* sysstat

## Get chrome compatible video file
$ cd ~/Videos  
$ wget http://media.xiph.org/video/derf/y4m/FourPeople_1280x720_60.y4m

## Add permissions
$ chmod u+x mpstat.sh netspeed.sh memstat.sh

## Running the scripts
## (You only have to run the script once per conference)
Make sure you replace \<device name> with an appropiate device i.e eth0  
$ ./mpstat.sh &! ./netspeed.sh \<device name> &! ./memstat.sh &

## Close any running chrome instance and run
$ google-chrome-stable --use-file-for-fake-video-capture="/home/$(id -u -n)/Videos/FourPeople_1280x720_60.y4m" --use-fake-device-for-media-stream

Open 192.168.1.10/test001 when instructed. (Jitsi specific)  
When the conference has completed, open a new tab and go to chrome://webrtc-internals.  
Create dump -> download the peerconnection updates and stats data.  

Send dump file and the generated logfiles to antsu913@gmail.com.  
Please add Jitsi or Briteback in the subject field depending on the test.  
If possible, rename the webrtc dump file to whatever <i>id -u -n</i> returns on your system.  

Thanks!
