#!/bin/bash

# File name of the NGINX log
LOG_FILE="nginx_access.log"

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found!"
  exit 1
fi

echo "Analyzing log file: $LOG_FILE"
echo ""

# Top 5 IP addresses with the most requests
echo "Top 5 IP addresses:"
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 most requested paths
echo "Top 5 requested paths:"
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 response status codes
echo "Top 5 response status codes:"
awk '{print $9}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
echo ""

# Top 5 user agents
echo "Top 5 user agents:"
awk -F'"' '{print $6}' $LOG_FILE | sort | uniq -c | sort -nr | head -5
echo ""
