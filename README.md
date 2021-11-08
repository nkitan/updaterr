# updaterr
updater script to update your linux distro.

a functional script written in bash.
more managers are gonna be added soon. creates a log file with timestamps,asks if you wanna shut down after the script finishes and yes,it works with apt.

* update your system without worries of overnight run
* shuts down system when work is over
* creates logs so you know what went wrong and when
* works with your favourite debian (apt) based distro
* supports automation by passing arguments during call

## USAGE
--------

## RUN EXECUTABLE
---------------

Just the essentials. 
Follow these instructions to get your script up and running in no time

1.  `cd updaterr/`
2.  `chmod +x updaterr.sh`  
3.  `./updaterr.sh`  

BULD IT YOURESELF
-----------------
You can have your custom actions during/post update.
Edit the updaterr.sh file to your liking, 
The Possibilties are Endless.

after you're done editing the script, proceed to the following steps.

1.  `cd updaterr/`

2.  `chmod +X updaterr.sh`

3.  `sudo sh updaterr.sh`


PASSING ARGUMENTS
------------------
(This feature is new and has it's bugs)

argument '1': ./updaterr 1 or ./updaterr.sh
