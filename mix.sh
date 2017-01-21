#!/bin/bash

#组装c文件
modelcfile="s_model.c"
targetcfile="replay.c"
devicefile="device.conf"
#生成对应触摸设备的c文件
#----------------------------
#  函数: 获得触屏输入设备
#  返回: 触屏输入设备 /dev/event/inputX
#--------------------------------------------
get_touch_device(){
    adb shell getevent -pl|sed -e ':a;N;$!ba;s/\n / /g'|\
    grep 'ABS_MT_TOUCH'|awk '{print $4}'|tr -d '\011\012\015'
}


if [ -f $devicefile ];then
    touchdev=`cat $devicefile`
else
    touchdev=$(get_touch_device)
    echo $touchdev > $devicefile
fi

cat $modelcfile > $targetcfile
sed -i "s:_REPLACE_DEVICE_:${touchdev}:g" $targetcfile

