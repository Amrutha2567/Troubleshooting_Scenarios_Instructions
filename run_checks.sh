#!/bin/bash
# run_checks.sh - wrapper to show environment and optionally run scenario helpers
echo "Environment overview:"
uname -a
echo
echo "Current user:"
whoami
echo
echo "Disk usage:"
df -h
echo
echo "Memory:"
free -h
echo
echo "Network:"
ip a || ifconfig || true
echo
echo "Available helper scripts:"
ls -1 *.sh || true

echo
echo "To run a particular helper, execute: sudo ./saint_john.sh  (or other script)"
