#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "$0")/.." && pwd)/system-config/asusd/override.conf"
DST="/etc/systemd/system/asusd.service.d/override.conf"
DST_DIR="$(dirname "$DST")"

# must run as root
if [[ $EUID -ne 0 ]]; then
  echo "Run as root"
  exit 1
fi

mkdir -p "$DST_DIR"

# if file exists and is identical → exit
if [[ -f "$DST" ]] && cmp -s "$SRC" "$DST"; then
  echo "asusd override already correct"
  exit 0
fi

echo "Installing asusd override"
install -m 0644 "$SRC" "$DST"

systemctl daemon-reload
systemctl restart asusd.service

