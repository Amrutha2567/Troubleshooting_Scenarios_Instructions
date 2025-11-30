#!/bin/bash
# manhattan.sh - Postgres troubleshooting helper for 'Manhattan'
# Usage: sudo ./manhattan.sh

echo "1) Check postgres service"
sudo systemctl status postgresql --no-pager || true
echo
echo "2) Show last journal entries for postgres"
sudo journalctl -u postgresql -n 200 --no-pager || true
echo
echo "3) Check postgresql.conf for data_directory (adjust path/version if needed)"
sudo grep -i data_directory /etc/postgresql/*/main/postgresql.conf 2>/dev/null || true
echo
echo "4) Disk and mount checks"
df -hT || true
mount || true
echo
echo "5) Filesystem write test (attempt safe write to /tmp)"
touch /tmp/sadservers_fs_test 2>/dev/null && echo '/tmp write OK' || echo 'Cannot write to /tmp (check permissions or read-only FS)'
echo
echo "6) Check ownership/permissions of typical data dir (adjust path if different)"
STAT_PATH='/var/lib/postgresql/14/main'
if [ -d "$STAT_PATH" ]; then
  sudo stat $STAT_PATH
  sudo ls -la $STAT_PATH | head -n 40
else
  echo "$STAT_PATH not found; adjust script to your Postgres version/path"
fi

echo
echo "7) If ownership wrong, example fix (RUN ONLY IF SURE):"
echo "  sudo chown -R postgres:postgres /var/lib/postgresql/14/main"
echo "  sudo chmod -R 700 /var/lib/postgresql/14/main"
echo
echo "8) Restart postgres and test insert"
echo "  sudo systemctl restart postgresql"
echo "  sudo -u postgres psql -d dt -c "insert into persons(name) values ('jane smith');""
