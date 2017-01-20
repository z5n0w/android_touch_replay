为了LL自动打歌写的一个小程序
需要ROOT
和
一点点NDK使用知识

record.sh
format.sh
mix.sh

arm-**-gcc replay.c -o replay

adb root
adb shell mkdir /data/temp
adb push replay /data/temp/replay
adb push event.txt.out /data/temp/event

adb shell .............................................
