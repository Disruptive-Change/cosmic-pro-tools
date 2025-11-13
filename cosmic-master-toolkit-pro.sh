#!/usr/bin/env bash
# =====================================================
# 🪐 COSMIC MASTER TOOLKIT PRO
#    by Don & Nova
# =====================================================
# Version: 1.0.0
# Project: https://github.com/osi-don/cosmic-pro-tools
# =====================================================

# ────────────────────────────────────────────────
#  CONFIG
# ────────────────────────────────────────────────
VERSION="1.0.0"
REPO_USER="osi-don"
REPO_NAME="cosmic-pro-tools"
REMOTE_BASE="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/main"

BACKUP_DIR="$HOME/.backup_cosmic_toolkit"
FONTS_DIR="$HOME/.local/share/fonts"
THEME_DIR="$HOME/.themes"
ICONS_DIR="$HOME/.icons"

# ────────────────────────────────────────────────
#  ASCII SPLASH
# ────────────────────────────────────────────────
splash_screen() {
    clear
    echo ""
    echo "🪐  COSMIC MASTER TOOLKIT PRO"
    echo "     by Don & Nova"
    echo "───────────────────────────────────────────────"
    echo ""
}

# ────────────────────────────────────────────────
#  HELPER FUNCTIONS
# ────────────────────────────────────────────────
pause() { read -rp "Press [Enter] to continue..."; }

backup_file() {
    local file="$1"
    [[ -f "$file" ]] || return
    mkdir -p "$BACKUP_DIR"
    cp -f "$file" "$BACKUP_DIR/$(basename "$file").bak"
}

print_step() {
    echo ""
    echo "🔧  $1"
}

# ────────────────────────────────────────────────
#  FONT INSTALLATION
# ────────────────────────────────────────────────
install_fonts() {
    print_step "Installing Noto and Nerd Fonts…"
    mkdir -p "$FONTS_DIR"
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -Sy --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y google-noto-sans-fonts google-noto-emoji-fonts
    elif command -v apt >/dev/null 2>&1; then
        sudo apt install -y fonts-noto fonts-noto-color-emoji
    else
        echo "⚠️  Unsupported package manager. Install fonts manually."
    fi
    fc-cache -fv >/dev/null 2>&1
    echo "✅  Fonts installed and cache rebuilt."
}

# ────────────────────────────────────────────────
#  FONTCONFIG TWEAKS (macOS STYLE)
# ────────────────────────────────────────────────
apply_fontconfig_tweaks() {
    print_step "Applying macOS-style font rendering..."
    mkdir -p "$HOME/.config/fontconfig/conf.d"
    cat <<EOF > "$HOME/.config/fontconfig/conf.d/10-hinting.conf"
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
 <match target="font">
  <edit name="hintstyle" mode="assign"><const>hintslight</const></edit>
  <edit name="antialias" mode="assign"><bool>true</bool></edit>
  <edit name="rgba" mode="assign"><const>rgb</const></edit>
  <edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit>
 </match>
</fontconfig>
EOF
    echo "✅  Fontconfig tweaks applied."
}

# ────────────────────────────────────────────────
#  THEME + ICON INSTALLER
# ────────────────────────────────────────────────
install_themes() {
    print_step "Installing Catppuccin and Orchis themes..."
    mkdir -p "$THEME_DIR" "$ICONS_DIR"
    git clone --depth=1 https://github.com/catppuccin/gtk.git "$THEME_DIR/Catppuccin" >/dev/null 2>&1 || true
    git clone --depth=1 https://github.com/vinceliuice/Orchis-theme.git "$THEME_DIR/Orchis" >/dev/null 2>&1 || true
    git clone --depth=1 https://github.com/vinceliuice/Tela-icon-theme.git "$ICONS_DIR/Tela" >/dev/null 2>&1 || true
    echo "✅  Themes and icons ready."
}

# ────────────────────────────────────────────────
#  SYSTEM OPTIMIZATION
# ────────────────────────────────────────────────
apply_performance_tweaks() {
    print_step "Applying lightweight performance tweaks..."
    sudo systemctl enable --now fstrim.timer >/dev/null 2>&1 || true
    echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-cosmic-performance.conf >/dev/null
    echo "✅  System tweaks applied."
}

# ────────────────────────────────────────────────
#  UPDATE CHECK
# ────────────────────────────────────────────────
check_for_updates() {
    print_step "Checking for updates..."
    local remote_version
    remote_version=$(curl -fsSL "${REMOTE_BASE}/version.txt" 2>/dev/null || echo "unknown")

    if [[ "$remote_version" == "unknown" ]]; then
        echo "⚠️  Could not fetch remote version info."
        return
    fi

    if [[ "$remote_version" != "$VERSION" ]]; then
        echo "🔔  Update available: $VERSION → $remote_version"
        read -rp "Do you want to update now? [y/N]: " choice
        if [[ "$choice" =~ ^[Yy]$ ]]; then
            perform_update
        else
            echo "Skipped update."
        fi
    else
        echo "✅  You’re running the latest version ($VERSION)."
    fi
}

perform_update() {
    mkdir -p "$BACKUP_DIR"
    echo "Backing up current files..."
    cp -f cosmic-master-toolkit-pro.sh "$BACKUP_DIR/" 2>/dev/null || true
    cp -f README.md "$BACKUP_DIR/" 2>/dev/null || true
    cp -rf .github "$BACKUP_DIR/" 2>/dev/null || true

    echo "Downloading latest files..."
    curl -fsSL "${REMOTE_BASE}/cosmic-master-toolkit-pro.sh" -o cosmic-master-toolkit-pro.sh
    curl -fsSL "${REMOTE_BASE}/README.md" -o README.md
    mkdir -p .github/workflows
    curl -fsSL "${REMOTE_BASE}/.github/workflows/lint.yml" -o .github/workflows/lint.yml

    chmod +x cosmic-master-toolkit-pro.sh
    echo "✅  Update complete. Relaunching..."
    exec ./cosmic-master-toolkit-pro.sh
}

# ────────────────────────────────────────────────
#  MAIN MENU
# ────────────────────────────────────────────────
main_menu() {
    splash_screen
    echo "1) Install fonts"
    echo "2) Apply font rendering tweaks"
    echo "3) Install themes and icons"
    echo "4) Apply performance tweaks"
    echo "5) Check for updates"
    echo "0) Exit"
    echo ""
    read -rp "Choose an option: " opt
    case "$opt" in
        1) install_fonts ;;
        2) apply_fontconfig_tweaks ;;
        3) install_themes ;;
        4) apply_performance_tweaks ;;
        5) check_for_updates ;;
        0) echo "Goodbye, Don 🪐"; exit 0 ;;
        *) echo "Invalid option." ;;
    esac
    pause
    main_menu
}

# ────────────────────────────────────────────────
#  ENTRY POINT
# ────────────────────────────────────────────────
if [[ "$1" == "--update" ]]; then
    perform_update
else
    main_menu
fi
