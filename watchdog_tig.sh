#!/bin/bash

# Log File
LOG_FILE="$HOME/tig_pool/tig.log"

# Read the 4 last lines
last_lines=$(tail -n 4 "$LOG_FILE")

# Extract data from logs, date, TW, status
#log_date=$(echo "$last_lines" | grep -Eo "^[0-9\-:, ]+" | tail -1)
log_date=$(echo "$last_lines" | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}" | tail -1)
tw_value=$(echo "$last_lines" | grep -Eo "TW  [0-9]+" | grep -Eo "[0-9]+" | tail -1)
status=$(echo "$last_lines" | grep -Eo "(MINING|IDLE Phase)" | tail -1)

# Convert date to timestamp
log_epoch=$(date -d "$log_date" +%s)
current_epoch=$(date +%s)

# Calculate difference in minutes
elapsed_minutes=$(( (current_epoch - log_epoch) / 60 ))

# TW color
if [ "$tw_value" -eq 0 ]; then
    tw_color="\e[31m" # Red
elif [ "$tw_value" -ge 1 ] && [ "$tw_value" -le 50 ]; then
    tw_color="\e[34m" # Blue
else
    tw_color="\e[33m" # Yellow
fi


# Elapsed Color
if [ "$elapsed_minutes" -eq 3 ] || [ "$elapsed_minutes" -eq 4 ]; then
    elapsed_color="\e[33m" # Yellow
elif [ "$elapsed_minutes" -ge 5 ]; then
    elapsed_color="\e[31m" # Red
else
    elapsed_color="\e[0m" 
fi


# Display informations
echo "------------------------------------------------"
echo "Last Job : $log_date"
echo -e "TW : ${tw_color}$tw_value\e[0m"
echo "Status : $status"
echo -e "Elapsed Time : ${elapsed_color}$elapsed_minutes minutes\e[0m"

# if more than 5 minutes, restart miner
if [ "$elapsed_minutes" -ge 5 ]; then
    echo -e "\e[31m$(date '+%Y-%m-%d %H:%M:%S') - INACTIVITY : Restarting TIG Miner\e[0m"
    #tig restart
    /usr/bin/pkill screen > /dev/null 2>&1 
    /usr/bin/screen -wipe > /dev/null 2>&1
    /usr/bin/pkill screen > /dev/null 2>&1
    cd $HOME/tig_pool
    /usr/bin/screen -S pool_tig -L -Logfile "$HOME/tig_pool/tig.log" -dm bash -c "$HOME/tig_pool/pool_tig_launch_*; exec bash"
fi
