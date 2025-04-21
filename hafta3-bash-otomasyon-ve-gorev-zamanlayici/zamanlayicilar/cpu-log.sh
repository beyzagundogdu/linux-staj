#!/bin/bash

echo " $(date): CPU Durumu " >> ~/cpu-log.txt
top -bn1 | grep "Cpu(s)" >> ~/cpu-log.txt
echo "---------------------" >> ~/cpu-log.txt

 
