#!/bin/bash

maximo=0
minimo=99999

lineas=`cat consumo.txt|tail -n+2| wc -l`
for i in `seq 2 $lineas`
do
    consumo=`cat consumo.txt| head -n$i | tail -n1| awk '{print $4}'`
    if [ $consumo -gt $maximo ]
    then
        maximo=$consumo
        indiceMax=$i
    fi
    if [ $consumo -lt $minimo ]
    then
        minimo=$consumo
        indiceMin=$i
    fi
done
maximo=`cat consumo.txt| head -n$indiceMax | tail -n1 | awk '{print $1 " " $2 " " $3}'`
minimo=`cat consumo.txt| head -n$indiceMin | tail -n1 | awk '{print $1 " " $2 " " $3}'`
echo "Datos del consumo maximo: $maximo"
echo "Datos del consumo minimo: $minimo"

