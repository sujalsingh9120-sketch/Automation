#!/bin/bash

RAM_TOTAL=$(free | awk '/Mem/ {print $2}')
RAM_USED=$(free | awk '/Mem/ {print $3}')

RAM_PERCENT=$(( RAM_USED * 100 / RAM_TOTAL ))
 
echo $RAM_PERCENT

