#!/bin/bash - 
file=${1:-"event.txt"}

get_touch_device(){
    adb shell getevent -pl|sed -e ':a;N;$!ba;s/\n / /g'|\
        grep 'ABS_MT_TOUCH'|awk '{print $4}'|tr -d '\011\012\015'
}

touchdev=$(get_touch_device)
echo "touch device is [ $touchdev ]"

echo "--record start--"
adb shell getevent -t $touchdev >$file
trap "echo  '= recoder had stop ='" SIGINT
echo "record end, output file is [ $file ]"
