#!/bin/bash
threshold=20
result=0

while read -r line; do
    mount_point=$(echo "$line" | awk '{print $6}')
    usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')
    device=$(echo "$line" | awk '{print $1}')
    if [ "$usage" -ge $((100 - threshold)) ]; then
        result=1
    fi
done < <(df -h | grep '^/dev')

if [ "$result" -eq 0 ]; then
    echo "0"
else
    echo "1"
fi