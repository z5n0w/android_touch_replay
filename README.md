#README.md

##基本要求
已经ROOT的Android机
一点点NDK使用知识

###record.sh <filename>
用于录制操作
###format.sh <filename>
将上一步生成的记录转换成程序直接能用的格式
###mix.sh
生成适配的c源码

##使用过程
arm-linux-androideabi-gcc replay.c -o replay

adb root

adb shell mkdir /data/temp

adb push replay /data/temp/replay
adb push <filename>.out /data/temp/replay.txt

adb shell /data/temp/replay /data/temp/replay.txt 
