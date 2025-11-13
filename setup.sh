#!/usr/bin/env bash
# Cosmic Master Toolkit — Pro Edition
# Setup Script (Prepares the environment)
# By Don & Nova

set -e

echo "🪐 Cosmic Master Toolkit — Pro Edition"
echo "--------------------------------------"
echo "Preparing your environment..."
echo

# -------------------------------------------------------
# 1. Detect OS and prepare package manager
# -------------------------------------------------------

if command -v dnf &>/dev/null; then
    PM="sudo dnf install -y"
elif command -v pacman &>/dev/null; then
    PM="sudo pacman -Sy --needed"
elif command -v apt &>/dev/null; then
    PM="sudo apt install -y"
elif command -v nala &>/dev/null; then
    PM="sudo nala install -y"
else
    echo "❌ No compatible package manager found."
    echo "Supported: dnf, pacman, apt, nala"
    exit 1
fi

# -------------------------------------------------------
# 2. Install required dependencies
# -------------------------------------------------------

echo "📦 Checking dependencies..."

DEPS=(curl git unzip)

for pkg in "${DEPS[@]}"; do
    if ! command -v "$pkg" &>/dev/null; then
        echo "→ Installing $pkg..."
        $PM "$pkg"
    else
        echo "✓ $pkg OK"
    fi
done

echo

# -------------------------------------------------------
# 3. Verify COSMIC Desktop exists
# -------------------------------------------------------

if ! command -v cosmic-settings &>/dev/null; then
    echo "⚠️ COSMIC components not detected!"
    echo "You can still use the toolkit for fonts & themes."
else
    echo "✓ COSMIC Desktop detected"
fi

echo

# -------------------------------------------------------
# 4. Create required folders
# -------------------------------------------------------

echo "📂 Creating required folders..."

mkdir -p ~/.config/fontconfig/conf.d
mkdir -p ~/.local/share/fonts
mkdir -p ~/.themes
mkdir -p ~/.icons
mkdir -p ~/.backup_cosmic_toolkit

echo "✓ Directory structure ready"
echo

# -------------------------------------------------------
# 5. Make toolkit executable
# -------------------------------------------------------

if [[ -f "./cosmic-master-toolkit-pro.sh" ]]; then
    chmod +x cosmic-master-toolkit-pro.sh
    echo "✓ Main script made executable"
else
    echo "⚠️ Main script not found. Place it in this directory."
fi

echo

# -------------------------------------------------------
# 6. Success message
# -------------------------------------------------------

echo "🎉 Setup Complete!"
echo
echo "You can now run:"
echo "   ./cosmic-master-toolkit-pro.sh"
echo
echo "🪐 Welcome to the Pro Edition of the Cosmic Toolkit."
echo "   — Don & Nova"
echo
