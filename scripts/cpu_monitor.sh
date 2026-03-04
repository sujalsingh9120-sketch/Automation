#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_INT=${CPU%.*}
echo $CPU_INT
