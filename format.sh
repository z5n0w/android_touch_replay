#!/bin/bash

file=${1:-"event.txt"}

afile=${file}.a
tfile=${file}.t
bfile=${file}.b
ofile=${file}.out
sed "s:\[::g;s:\.::g;s:\]::g" $file > $afile


if [ -f "$tfile" ];then
    rm $tfile
fi

n=0
cat $afile |while read line
do
    if [ $n -eq 0 ];then 
        let time1=`echo $line |awk '{print $1}'`
    fi
    let time2=`echo $line |awk '{print $1}'`
    let time_t=$time2-$time1
    let time1=$time2
    let n=$n+1
    echo $time_t >> $tfile 
done

paste $tfile $afile |awk '{print $1 " " $3 " " $4 " " $5}' > $bfile
cat $bfile |\
    awk '{print $1 " " strtonum("0x"$2) " " strtonum("0x"$3) " " strtonum("0x"$4)}' |\
    sed 's/4294967295/-1/g' > $ofile

rm $afile
rm $tfile
rm $bfile
