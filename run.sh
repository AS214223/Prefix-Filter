#!/bin/bash

# Script to run the Ansible playbook for updating FRR prefix lists
# Intended for local use only (manual or cron)

set -e

# Go to the script's directory
cd "$(dirname "$0")"

# Log file location (optional)
LOGFILE="/var/log/ansible_bgpq4_frr.log"

# Timestamp
echo "[$(date)] Starting bgpq4 -> FRR update via Ansible" | tee -a "$LOGFILE"

# Run the playbook
ansible-playbook -i inventory.yml playbook.yml >> "$LOGFILE" 2>&1

if [ $? -eq 0 ]; then
    echo "[$(date)] ✅ FRR update successful." | tee -a "$LOGFILE"
else
    echo "[$(date)] ❌ FRR update FAILED!" | tee -a "$LOGFILE"
fi
