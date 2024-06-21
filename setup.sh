#!/bin/bash

# Creating the script file
SCRIPT="/usr/local/bin/keep_nic_on.sh"
echo "#!/bin/bash" > "$SCRIPT"
echo "echo on > /sys/class/net/enp4s0/power/control" >> "$SCRIPT"

# Making the script executable
chmod +x "$SCRIPT"

# Adding the script to cron to run every minute
(crontab -l 2>/dev/null; echo "* * * * * $SCRIPT") | crontab -
