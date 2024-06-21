#!/bin/bash

# Define the script path
SCRIPT="/usr/local/bin/keep_nic_on.sh"

# Create and write the script to keep the network interface on
echo "#!/bin/bash" > "$SCRIPT"
echo "echo on > /sys/class/net/enp4s0/power/control" >> "$SCRIPT"

# Make the script executable
chmod +x "$SCRIPT"

# Add the script to cron to run every minute
# Using bash -c to ensure environment variables and path are correctly handled
CRON_JOB="* * * * * /bin/bash $SCRIPT"

# Check if the cron job already exists
if ! crontab -l | grep -Fq "$CRON_JOB"; then
  # Append the cron job if it does not exist
  (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
fi
