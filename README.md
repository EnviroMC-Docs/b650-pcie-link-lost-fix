This script injects a bash that overrides the default linux power management for the NICs. This causes a common `PCIe Link Lost` error for NICs on the b650d4u's as the kernel will put the NICs in power saving mode but is then unable to bring it back online.

You can use this command on Debian/Ubunto to install and run the script. It's currently configured to setup for enps40, you will need to modify the bash file if you have another NIC. 
curl -s https://github.com/EnviroMC-Docs/b650-pcie-link-lost-fix/raw/main/setup.sh | sudo bash
