function upd {
sudo apt -y update
echo "updated"}

function upgd {
sudo apt -y upgrade
echo "upgraded"}

function distupgd {
sudo apt -y dist-upgrade
echo "dist upgraded"}

upd
let RETVAL=$?
until [[ $RETVAL == 100 ]] ; do
upd
let RETVAL=$?
done

touch Desktop/logfile.txt
echo "updated" > ~/Desktop/logfile.txt
echo $(date) >> ~/Desktop/logfile.txt

upgd
let RETVAL=$?
until [[ $RETVAL == 100 ]] ; do
upgd
let RETVAL=$?
done

touch ~/Desktop/logfile.txt
echo "upgraded" >> ~/Desktop/logfile.txt
echo $(date) >> ~/Desktop/logfile.txt


distupgd
let RETVAL=$?
until [[ $RETVAL == 100 ]] ; do
distupgd
let RETVAL=$?
done
touch ~/Desktop/logfile.txt
echo "Finish : " >> ~/Desktop/logfile.txt
echo $(date) >> ~/Desktop/logfile.txt

echo "Shutting Down!"; >> ~/Desktop/logfile.txt
echo $(date) >> ~/Desktop/logfile.txt
shutdown now
