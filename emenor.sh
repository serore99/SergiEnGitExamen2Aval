#!/bin/bash

apariciones=`cat consumo.txt | tail -n+2 | awk '{print $1}' | uniq |wc -l`
mediaMen=9999

for i in `seq 1 $apariciones`
do
    ciudad=`cat consumo.txt | tail -n+2 | awk '{print $1}' | uniq | head -n$i |tail -n1`
    media=`./cmedia.sh $ciudad| awk '{print $9}'`
    if [ $media -lt $mediaMen ]
    then
        mediaMen=$media
        indice=$i
    fi
done

ciudad=`cat consumo.txt | tail -n+2 | awk '{print $1}' | uniq | head -n$indice |tail -n1`
echo "La ciudad de $ciudad es la que menor media de emisiones tiene"