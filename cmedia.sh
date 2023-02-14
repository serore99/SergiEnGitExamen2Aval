#!/bin/bash

consumoT=0
apariciones=`cat consumo.txt|grep $1 | wc -l`
for i in `seq 1 $apariciones`
do
    consumo=`cat consumo.txt|grep $1| head -n$i | tail -n1| awk '{print $4}'`
    consumoT=$(($consumoT + $consumo))
done

media=$(($consumoT/$apariciones))

Echo "La media de la ciudad de $1 es $media"