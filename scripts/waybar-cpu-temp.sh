#!/bin/bash

set -euo pipefail

temp=$(sensors 2>/dev/null | awk '
    /Tctl:/ {
        for (i = 1; i <= NF; i++) {
            if ($i ~ /^\+[0-9.]+°C$/) {
                gsub(/^\+/, "", $i)
                gsub(/°C$/, "", $i)
                print $i
                exit
            }
        }
    }
')

usage=$(grep 'cpu ' /proc/stat | awk '
    {
        idle = $5 + $6
        total = 0
        for (i = 2; i <= NF; i++) {
            total += $i
        }
        print idle, total
    }
')

read -r idle1 total1 <<<"$usage"
sleep 0.2
usage=$(grep 'cpu ' /proc/stat | awk '
    {
        idle = $5 + $6
        total = 0
        for (i = 2; i <= NF; i++) {
            total += $i
        }
        print idle, total
    }
')
read -r idle2 total2 <<<"$usage"

cpu_pct=$(awk -v idle1="$idle1" -v total1="$total1" -v idle2="$idle2" -v total2="$total2" '
    BEGIN {
        idle = idle2 - idle1
        total = total2 - total1
        if (total <= 0) {
            print "--"
            exit
        }
        printf "%.0f", (100 * (total - idle) / total)
    }
')

if [[ -z "${temp}" ]]; then
    temp="--"
fi

printf "CPU %sC %s%%\n" "$temp" "$cpu_pct"
