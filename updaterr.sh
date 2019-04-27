function upd {
sudo apt -y update
echo "updated"
}

function upgd {
sudo apt -y upgrade
echo "upgraded"
}

function distupgd {
sudo apt -y dist-upgrade
echo "dist upgraded"
}

read -p "Do you want a log file? " logwt
clear

read -p "Do you want to shutdown after the script finishes its work? " answer
clear

upd
let RETVAL=$?
until [[ $RETVAL == 0 ]] ; do
upd
let RETVAL=$?
done

if [ $logwt == 'y' ] && [ $RETVAL == 0 ]; then
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

if [ $logwt == 'y' ] && [ $RETVAL == 0 ]; then
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

if [ $logwt == 'y' ] && [ $RETVAL == 0 ]; then
echo "Finish : " >> logfile.txt
TIME=$(date +'%m/%d/%Y/%T')
echo $TIME >> logfile.txt
echo "----" >> logfile.txt
echo "END OF UPDATE" >> logfile.txt
fi

while [[ true ]]; do
  case $answer in
    [yY]* ) echo "Shutting Down!"
    echo "Shutdown! @" >> logfile.txt
    TIME=$(date +'%m/%d/%Y/%T')
    echo $TIME >> logfile.txt
    echo "--------------------------------------" >> logfile.txt
    sleep 10
    shutdown now
    break;;

    [nN]* ) echo "Done!"
    break;;



    *) echo "Invalid Option"; break;;
  esac
done
