#!/bin/bash

source config/thresholds.conf

RAM_TOTAL=$(free | awk '/Mem/ {print $2}')
RAM_USED=$(free | awk '/Mem/ {print $3}')

RAM_PERCENT=$(( RAM_USED * 100 / RAM_TOTAL ))

echo "$(date) | RAM Usage: $RAM_PERCENT%" >> logs/system.log

if [ "$RAM_PERCENT" -gt "$RAM_LIMIT" ]; then
  echo "$(date) | RAM ALERT: $RAM_PERCENT%" >> logs/alerts.log"
fi

