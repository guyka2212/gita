#!/bin/bash
# install.sh - Gita Command Line Utility Installer
set -e

clear
echo -e "\e[1;35m"
echo "  ________.__  __          "
echo "  /  _____/|__|/  |______    "
echo " /   \  ___|  \   __\__  \   "
echo " \    \_\  \  ||  |  / __ \_ "
echo "  \______  /__||__| (____  /"
echo "         \/              \/  "
echo -e "\e[0m"
echo -e "\e[1;34m[*] Starting Gita Engine Installation...\e[0m"

# 1. Setup local environment directories
echo -e "\e[1;32m[1/4]\e[0m Creating deployment environment tracks inside ~/.gita/"
mkdir -p ~/.gita/scripts ~/.gita/templates ~/.gita/pushes

# 2. Generate Internal Setup Maps dynamically
echo -e "\e[1;32m[2/4]\e[0m Provisioning default local documentation manifests..."

cat << 'EOF' > ~/.gita/README.md
# 🐙 Central Gita Storage Hub (~/.gita/)

This directory acts as the local storage workspace database for Gita.
- /pushes   : Saved workspace states (`gita push {name}`)
- /templates: Base starter code skeletons (`gita -t {name}`)
- /scripts  : Extensionless custom automation binaries (`gita run {name}`)
EOF

cat << 'EOF' > ~/.gita/scripts/README.md
# 🛠️ Gita Automation Scripts Directory

Any executable script placed in this folder can be called from anywhere using:
`gita run {script-name}`

Rules for creating automations:
1. No file extensions (e.g., name it `backup`, not `backup.sh`).
2. Include a shebang as line 1 (`#!/bin/bash` or `#!/usr/bin/env python3`).
3. Make it an executable binary program: `chmod +x ~/.gita/scripts/{script-name}`
EOF

# 3. Deploy Core Engine — local file if available, otherwise pull from GitHub
echo -e "\e[1;32m[3/4]\e[0m Installing gita runtime engine..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup existing installation if present
if [ -f /usr/local/bin/gita ]; then
    sudo cp /usr/local/bin/gita /usr/local/bin/gita.bak
    echo -e "\e[1;34m  └─ Backed up previous version to /usr/local/bin/gita.bak\e[0m"
fi

if [ -f "$SCRIPT_DIR/gita" ]; then
    echo -e "\e[1;34m  └─ Using local gita engine found at $SCRIPT_DIR/gita\e[0m"
    sudo cp "$SCRIPT_DIR/gita" /usr/local/bin/gita
else
    echo -e "\e[1;34m  └─ Downloading gita engine from GitHub...\e[0m"
    sudo curl -sSL "https://raw.githubusercontent.com/guyka2212/gita/main/gita" -o /usr/local/bin/gita
fi
sudo chmod +x /usr/local/bin/gita

# 4. Resolve Runtime Visualization Dependencies
echo -e "\e[1;32m[4/4]\e[0m Mapping python framework module dependencies..."
if command -v pip &> /dev/null; then
    pip install rich --quiet
else
    if command -v pip3 &> /dev/null; then
        pip3 install rich --quiet
    else
        echo -e "\e[1;33m[!] Warning: Python Package Index (pip) not found. Please install the 'rich' library manually.\e[0m"
    fi
fi

echo -e "\e[1;35m"
echo "===================================================="
echo " ✅ GITA CLI ENGINE INSTALLED SUCCESSFULLY!"
echo "===================================================="
echo -e "\e[0m"
echo "Open a fresh terminal layout and run 'gita' to verify syntax hooks."
