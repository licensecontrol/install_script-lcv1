#!/bin/bash

# Array of software installation commands
commands=(
  "bash <(curl https://api.licensecontrol.net/pre.sh) cPanel; installCP"
  "bash <(curl https://api.licensecontrol.net/pre.sh) Softaculous; installSoftaculous"
  "bash <(curl https://api.licensecontrol.net/pre.sh) Sitepad; installSitepad"
  "bash <(curl https://api.licensecontrol.net/pre.sh) WHMReseller; installWHMReseller"
  "bash <(curl https://api.licensecontrol.net/pre.sh) liteSpeed; installLSWS"
  "bash <(curl https://api.licensecontrol.net/pre.sh) CloudLinux; installCLN"
  "bash <(curl https://api.licensecontrol.net/pre.sh) Imunify360; installImunify360"
  "bash <(curl https://api.licensecontrol.net/pre.sh) JetBackup; installJetBackup"
)

# Array of software names
names=(
  "cPanel"
  "Softaculous"
  "Sitepad"
  "WHMReseller"
  "LiteSpeed"
  "CloudLinux"
  "Imunify360"
  "JetBackup"
)

# Loop through each command
for i in "${!commands[@]}"; do
  read -p "Do you want to install ${names[$i]}? (yes/no): " answer
  if [[ "$answer" == "yes" ]]; then
    eval "${commands[$i]}"
  else
    echo "Skipping ${names[$i]} installation."
  fi
done
