#!/bin/bash
# jakarta.sh - DNS troubleshooting helper for 'Jakarta'
# Usage: sudo ./jakarta.sh

echo "1) Show current ping failure"
ping -c 3 google.com || true

echo
echo "2) Show /etc/resolv.conf and symlink"
ls -l /etc/resolv.conf || true
echo "---- resolv.conf content ----"
cat /etc/resolv.conf || true

echo
echo "3) systemd-resolved state (if present)"
sudo systemctl status systemd-resolved --no-pager || true
resolvectl status 2>/dev/null || systemd-resolve --status 2>/dev/null || true

echo
echo "4) Try resolving via public DNS directly"
echo "dig +short google.com @8.8.8.8 || true"
dig +short google.com @8.8.8.8 || true
echo
echo "5) Temporary fix: overwrite /etc/resolv.conf with public DNS (RUN ONLY IF YOU UNDERSTAND):"
echo 'sudo sh -c "echo -e \"nameserver 8.8.8.8\nnameserver 1.1.1.1\" > /etc/resolv.conf"'
echo
echo "6) Restart resolver service if needed:"
echo "  sudo systemctl restart systemd-resolved"
