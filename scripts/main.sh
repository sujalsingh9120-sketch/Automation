#!/bin/bash

# -------------------- ENV FIX FOR CRON --------------------
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# -------------------- BASE PATH --------------------
BASE_DIR="/nfs/Automation"
LOG_FILE="$BASE_DIR/logs/system.log"

# -------------------- LOAD THRESHOLD --------------------
source "$BASE_DIR/config/threshold.sh"

# -------------------- GET VALUES --------------------
CPU_VALUE=$("$BASE_DIR/scripts/cpu_monitor.sh")
DISK_VALUE=$("$BASE_DIR/scripts/disk_monitor.sh")
MEMORY_VALUE=$("$BASE_DIR/scripts/memory_monitor.sh")

CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

# -------------------- STATUS CHECK --------------------
if [ "$CPU_VALUE" -gt "$CPU_LIMIT" ]; then
    CPU_STATUS="ERROR"
else
    CPU_STATUS="OK"
fi

if [ "$DISK_VALUE" -gt "$DISK_LIMIT" ]; then
    DISK_STATUS="ERROR"
else
    DISK_STATUS="OK"
fi

if [ "$MEMORY_VALUE" -gt "$RAM_LIMIT" ]; then
    RAM_STATUS="ERROR"
else
    RAM_STATUS="OK"
fi

# -------------------- TERMINAL OUTPUT --------------------
echo "$CURRENT_TIME | CPU:$CPU_VALUE ($CPU_STATUS) | DISK:$DISK_VALUE ($DISK_STATUS) | RAM:$MEMORY_VALUE ($RAM_STATUS)" 


# -------------------- LOG FILE ENTRY --------------------
printf "%-20s | %-20s | %-20s | %-20s\n" \
"$CPU_VALUE ($CPU_STATUS)" \
"$DISK_VALUE ($DISK_STATUS)" \
"$MEMORY_VALUE ($RAM_STATUS)" \
"$CURRENT_TIME" >> "$LOG_FILE"

#-------------------- Alert Notification --------------------------
   
ALERT_MSG="$CURRENT_TIME | CPU:$CPU_VALUE ($CPU_STATUS) | DISK:$DISK_VALUE ($DISK_STATUS) | RAM:$MEMORY_VALUE ($RAM_STATUS)"

if [[ "$CPU_STATUS" == "ERROR" || "$DISK_STATUS" == "ERROR" || "$RAM_STATUS" == "ERROR" ]]; then
    echo "$ALERT_MSG" | mail -s "SERVER ALERT" sujalsingh9120@gmail.com
fi

