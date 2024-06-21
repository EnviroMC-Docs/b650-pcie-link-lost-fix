#!/bin/bash

# URL of the setup.sh script
SETUP_URL="https://github.com/EnviroMC-Docs/b650-pcie-link-lost-fix/raw/main/setup.sh"

# Download setup.sh
curl -sL $SETUP_URL -o /tmp/setup.sh

# Ensure the script is executable
chmod +x /tmp/setup.sh

# Run the script with root permissions
sudo /tmp/setup.sh
