#!/bin/bash
# command_line_murders.sh - helper for 'Command Line Murders'
# Usage: ./command_line_murders.sh

echo "1) List hint directory"
ls -la /home/admin/clmystery || true

echo
echo "2) Show hint files (first 200 lines)"
sed -n '1,200p' /home/admin/clmystery/* 2>/dev/null || true

echo
echo "3) Example: create ~/mysolution and check md5"
echo "Try with a trailing newline controlled by printf"
echo "Example commands to run interactively:"
echo "  printf "Suspect Name" > ~/mysolution"
echo "  md5sum ~/mysolution"

echo
echo "4) Example brute-force approach for candidate names (edit the list as needed):"
cat <<'EOF'
for name in "John Smith" "Jane Doe" "Mary Major"; do
  printf "%s" "$name" > ~/mysolution
  md5=$(md5sum ~/mysolution | awk '{print $1}')
  echo "$name -> $md5"
done
EOF

echo
echo "Note: MD5 depends on exact bytes, including newline. Use printf to control newline."
