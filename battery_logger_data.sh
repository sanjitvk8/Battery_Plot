#!/bin/bash

# File: battery-log.sh
logfile="battery_log.csv"

# Write CSV header if file doesn't exist
if [ ! -f "$logfile" ]; then
    echo "timestamp,battery_percent,current_now_mA" > "$logfile"
fi

echo "📊 Battery logging started. Saving data to $logfile"

while true; do
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    percent=$(cat /sys/class/power_supply/BAT1/capacity)
    current=$(cat /sys/class/power_supply/BAT1/current_now)

    echo "$timestamp,$percent,$current" >> "$logfile"

    sleep 60  # Adjust interval as needed
done
