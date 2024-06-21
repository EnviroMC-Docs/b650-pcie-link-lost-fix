#!/bin/bash

# Define the script path
SCRIPT="/usr/local/bin/keep_nic_on.sh"

# Create and write the script to keep the network interface on
if [ ! -f "$SCRIPT" ]; then
  echo "#!/bin/bash" > "$SCRIPT"
  echo "echo on > /sys/class/net/enp4s0/power/control" >> "$SCRIPT"
  chmod +x "$SCRIPT"
fi

# Add the script to cron to run every minute
CRON_JOB="* * * * * $SCRIPT"
if ! crontab -l | grep -Fq "$CRON_JOB"; then
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
fi
