#!/bin/bash

source config/thresholds.conf

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_INT=${CPU%.*}

echo "$(date) | CPU Usage: $CPU_INT%" >> logs/system.log

if [ "$CPU_INT" -gt "$CPU_LIMIT" ]; then
  echo "$(date) | CPU ALERT: $CPU_INT%" >> logs/alerts.log"
fi

