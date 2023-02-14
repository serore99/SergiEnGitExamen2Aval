#!/bin/bash

media=`./cmedia.sh $1| awk '{print $9}'`

if [ $media -lt 400 ]
then 

  echo "La ciudad de $1 es ECO" 

else 

  echo "La ciudad de $1 NO es ECO" 

fi 