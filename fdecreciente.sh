#!/bin/bash

apariciones=`cat consumo.txt | tail -n+2 | awk '{print $1}' | uniq |wc -l`
mediaMen=9999

for i in `seq 1 $apariciones`
do
    ciudad=`cat consumo.txt | tail -n+2 | awk '{print $1}' | uniq | head -n$i |tail -n1`
    emisionAnt=99999999
    salir=1
    aparicionC=`cat consumo.txt | grep $ciudad| wc -l`
    for j in `seq 1 $aparicionC`
    do
        emision=`cat consumo.txt | grep $ciudad | head -n$j |tail -n1 | awk '{print $4}'`
        if [ $emision -lt $emisionAnt ]
        then
            emisionAnt=$emision
        else
            salir=0
            break
        fi
        echo "$ciudad tiene un consumo decreciente"
    done
    if [ salir -eq 0 ]
    then
        break
    fi
done