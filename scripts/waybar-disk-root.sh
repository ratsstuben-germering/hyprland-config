#!/bin/bash

set -euo pipefail

used=$(df -h / | awk 'NR==2 {print $5}')

if [[ -z "${used}" ]]; then
    printf "DISK --%%\n"
    exit 0
fi

printf "DISK %s\n" "$used"
