# 触屏回放

## 基本要求
已经ROOT的Android机
一点点NDK使用知识

### record.sh <filename>
用于录制操作
### format.sh <filename>
将上一步生成的记录转换成程序直接能用的格式
### mix.sh
生成适配的c源码

## 使用过程
arm-linux-androideabi-gcc replay.c -o replay

adb root

adb shell mkdir /data/temp

adb push replay /data/temp/replay
adb push <filename>.out /data/temp/replay.txt

adb shell /data/temp/replay /data/temp/replay.txt 

MIT License

Copyright (c) 2017 z5n0w

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
