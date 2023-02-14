#!/bin/bash

until [ $apariciones -ne 0 ]
do
read -p "Introduce la ciudad a buscar los datos: " ciudad
apariciones=`cat consumo.txt|grep $ciudad | wc -l`
done
total=0
for i in `seq 1 $apariciones`
do
    consumo=`cat consumo.txt|grep $ciudad| head -n$i | tail -n1| awk '{print $4}'`
    total=$(($total + $consumo))
done

echo "La ciudad de $ciudad ha tenido un consumo total de $total"

