#!/bin/bash

set -euo pipefail

ip_line=$(ip -4 -o addr show scope global up 2>/dev/null | awk '!/ lo / {print; exit}')

if [[ -z "${ip_line}" ]]; then
    printf "LAN down\n"
    exit 0
fi

iface=$(awk '{print $2}' <<<"$ip_line")
cidr=$(awk '{print $4}' <<<"$ip_line")
addr=${cidr%/*}

printf "LAN %s %s\n" "$iface" "$addr"
