//This is a bash script to update/upgrade your debian based distro!
//Proper update with shutdown at end of script
//Creates a log with Timestamps
//Always being Developed



function upd {                                                                  //Updates List
sudo apt -y update
echo "updated"
}
 
function upgd {                                                                     //Upgrades Packages
sudo apt -y upgrade
echo "upgraded"
}

function distupgd {                                                                 //Function For Upgrading Distro
sudo apt -y dist-upgrade
echo "dist upgraded"
}

//ENTRY POINT

read -p "Do you want a log file?" logwt                                            //Added Option to Write/Ignore Logs                   

read -p "Do you want to shutdown after the script finishes its work?" answer       //Added Optional Shutdown Functionality
clear

upd
let RETVAL=$?                                             
until [[ $RETVAL == 0 ]] ; do
upd
let RETVAL=$?
done

if [[ $logwt == 'y' ]]; then
touch logfile.txt
echo "updated @" >> logfile.txt                                                  
TIME=$(date +'%m/%d/%Y/%T')
echo $TIME >> logfile.txt
echo "----" >> logfile.txt
fi

upgd
let RETVAL=$?
until [[ $RETVAL == 0 ]] ; do
upgd
let RETVAL=$?
done

if [[ $logwt == 'y' ]]; then
touch logfile.txt
echo "upgraded @ " >> logfile.txt
TIME=$(date +'%m/%d/%Y/%T')
echo $TIME >> logfile.txt
echo "----" >> logfile.txt
fi

distupgd
let RETVAL=$?
until [[ $RETVAL == 0 ]] ; do
distupgd
let RETVAL=$?
done

if [[ $logwt == 'y' ]]; then
touch logfile.txt
echo "Finish : " >> logfile.txt
TIME=$(date +'%m/%d/%Y/%T')
echo $TIME >> logfile.txt
echo "----" >> logfile.txt
fi

while [[ true ]]; do
  case $answer in
    [yY]* ) echo "Shutting Down!";
    shutdown now
    break;;

    [nN]* ) echo "Done!"
    break;;

    *) echo "Invalid Option"; break;;
  esac
done
