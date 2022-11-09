echo "Hello Boss"
echo "Checking IP List Status ..."
echo "Help: tail -f output.log"

IPLIST=$(cat ip_list.txt)

for LINE in $IPLIST
do

    ping -t 2 $LINE >> /dev/null

    STATUS=$?
    TIME=`ping -t 2 $LINE | tail -1 | cut -f5 -d "/"`

    if [ $STATUS -eq $? ]
    then
        echo "$USER" "------" "$LINE" "------" "Success" "------" `date +%Y%m%d%H%M` "------" "$TIME">> output.txt
    else
        echo "$USER" "------" "$LINE" "------" "Failed" "------" `date +%Y%m%d%H%M`  >> output.txt
    fi

done

echo "Done !"
