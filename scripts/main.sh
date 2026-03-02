
#!/bin/bash

LOG_FILE="../logs/system.log"

source ../config/threshold.sh

CPU_VALUE=$(./cpu_monitor.sh)
DISK_VALUE=$(./disk_monitor.sh)
MEMORY_VALUE=$(./memory_monitor.sh)

CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$CPU_VALUE" -gt "$CPU_LIMIT" ];
then
    CPU_STATUS="ERROR"
else
    CPU_STATUS="OK"
fi


if [ "$DISK_VALUE" -gt "$DISK_LIMIT" ];
then
    DISK_STATUS="ERROR"
else
    DISK_STATUS="OK"
fi


if [ "$MEMORY_VALUE" -gt "$RAM_LIMIT" ]; 
then
    RAM_STATUS="ERROR"
else
    RAM_STATUS="OK"
fi


# -------- Terminal Output (Single Line) --------
echo "$CURRENT_TIME | CPU:$CPU_VALUE ($CPU_STATUS) | DISK:$DISK_VALUE ($DISK_STATUS) | RAM:$MEMORY_VALUE ($RAM_STATUS)"


# -------- Append Data Row --------
{
printf "%-20s | %-20s | %-20s | %-20s\n" \
"$CPU_VALUE ($CPU_STATUS)" \
"$DISK_VALUE ($DISK_STATUS)" \
"$MEMORY_VALUE ($RAM_STATUS)" \
"$CURRENT_TIME" >> "$LOG_FILE"

} | tee -a "$LOG_FILE"


