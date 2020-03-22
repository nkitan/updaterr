function upd {
if [[ $pkm == 1 ]]; then  
 sudo apt -y update
 echo "updated using apt"
elif [[ $pkm == 2 ]]; then
 sudo pacman -Sy
 echo "updated usinc pacman" 
fi

}

function upgd {
if [[ $pkm == 1 ]]; then  
 sudo apt -y upgrade
 echo "upgraded using apt"
elif [[ $pkm == 2 ]]; then
 sudo pacman -Syu
 echo "upgraded usinc pacman" 
fi

}

function distupgd {
if [[ $pkm == 1 ]]; then  
 sudo apt -y update
 echo "updated using apt"
elif [[ $pkm == 2 ]]; then
 echo "dist usinc pacman" 
fi
}

read -t 5 -p "Do you want a log file? " logwt
clear
let answer=k
read -t 5 -p "Do you want to shutdown after the script finishes its work? " answer
echo "1.APT 2.PACMAN"
read -t 5 -p "package manager? " pkm

if [[ answer == 'k' ]]; then
sleep 10
echo "Default Option Chosen as no User Input for 10 seconds"
let answer = 'n'
fi

if [[ $1 == 1 ]]; then
  let answer=n
  let logwt=y
fi

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
