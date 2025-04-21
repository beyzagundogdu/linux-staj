#!/bin/bash

read -p "Kac saniyeden geriye sayilsin?" SURE

while [ $SURE -gt 0 ]
do
    echo " $SURE..."
    sleep 1
    SURE=$((SURE-1))
done
    echo "Basla!"
