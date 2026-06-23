#!/bin/bash

set -euo pipefail

if ! output=$(nvidia-smi --query-gpu=temperature.gpu,utilization.gpu --format=csv,noheader,nounits 2>/dev/null | head -n 1); then
    printf "GPU --C --%%\n"
    exit 0
fi

temp=$(awk -F',' '{gsub(/ /, "", $1); print $1}' <<<"$output")
util=$(awk -F',' '{gsub(/ /, "", $2); print $2}' <<<"$output")

if [[ -z "${temp}" || -z "${util}" ]]; then
    printf "GPU --C --%%\n"
    exit 0
fi

printf "GPU %sC %s%%\n" "$temp" "$util"
