#!/bin/bash
# saint_john.sh - helper commands for 'Saint John' scenario
# Usage: sudo ./saint_john.sh

echo "1) Show log file info"
ls -lh /var/log/bad.log || true
echo "----- last 50 lines -----"
sudo tail -n 50 /var/log/bad.log || true

echo
echo "2) Show processes holding the file"
sudo lsof /var/log/bad.log || true
sudo fuser -v /var/log/bad.log || true

echo
echo "3) If a PID is shown, inspect it (replace <PID> with actual)"
echo "Example:"
echo "  ps -ef | grep <PID>"
echo "  sudo pstree -ap <PID>"
echo
echo "4) Kill process (UNSAFE - only when you decide to stop it)"
echo "  sudo kill <PID>"
echo "If it doesn't stop: sudo kill -9 <PID>"

echo
echo "5) Verify file stops growing (run in another terminal):"
echo "  watch -n 1 'ls -lh /var/log/bad.log'"

# End of script
