#!/bin/bash

source config/thresholds.conf

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "$(date) | Disk Usage: $DISK%" >> logs/system.log

if [ "$DISK" -gt "$DISK_LIMIT" ]; then
  echo "$(date) | DISK ALERT: $DISK%" >> logs/alerts.log"
fi

