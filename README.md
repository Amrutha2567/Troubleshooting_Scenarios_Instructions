SadServers - Helper Code Files
================================

This archive contains helper scripts and templates you can use while recording your SadServers troubleshooting scenarios.

Files:
- saint_john.sh         : Commands to find and stop process writing to /var/log/bad.log
- command_line_murders.sh : Commands to inspect hints and produce ~/mysolution with exact md5
- manhattan.sh          : Postgres troubleshooting checklist and fix commands
- jakarta.sh            : DNS troubleshooting checklist and fixes
- checklist.txt         : Short one-page checklist for quick reference
- run_checks.sh         : Wrapper script to inspect environment and optionally run scenario 'check' scripts if present

Usage:
1. Copy these files into the VM(s) or your local machine where you will run the scenarios.
2. Make them executable: chmod +x *.sh
3. Run them while recording; narrate what each command does.
4. Edit the scripts if the scenario uses different paths or PIDs.

Important:
- These scripts contain potentially destructive commands (kill -9, chown). ONLY run them in the scenario VMs where you are allowed to perform admin actions.
- Review each script before running. Use them as a guide, not as an automatic "fix everything" tool.

Good luck!

sadservers-troubleshooting/
│
├── saint-john.md
├── command-line-murders.md
├── manhattan.md
├── jakarta.md
│
├── scripts/
│   ├── system_diagnose.sh
│   ├── webserver_fix.sh
│   └── kill_high_cpu.sh
│
└── README.md
