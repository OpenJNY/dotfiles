#!/bin/bash
name="Pomotimer"
ratio=$1
width=$2
if [ -z $ratio ]
    then ratio=5 # ratio for work:rest = 5:1.
fi
if [ -z $width ]
    then width=60 # work duration is 60 minutes.
fi

rest=$(($width/($ratio+1)))
work=$(($width-$rest))
restsec=$(($rest*60))
worksec=$(($work*60))

while :
do timenext=`date -d "+$work min" +%R`
    terminal-notifier -message "開始です。$timenext まで $work 分の集中をお願いします。" -title $name > /dev/null
    sleep $worksec
    timenext=`date -d "+$rest min" +%R`
    terminal-notifier -message "休憩です。$timenext まで $rest 分休んでください" -title $name > /dev/null
    sleep $restsec
done
