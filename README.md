<<<<<<< HEAD
# Cosmic Pro Tools
Initial placeholder commit.
=======
🪐 Cosmic Master Toolkit — Pro Edition

By Don & Nova

<p align="center"> <img src="https://img.shields.io/github/actions/workflow/status/osi-don/cosmic-pro-tools/lint.yml?branch=main&label=Build%20Status&logo=github&style=for-the-badge"> <img src="https://img.shields.io/github/license/osi-don/cosmic-pro-tools?style=for-the-badge"> <img src="https://img.shields.io/github/v/release/osi-don/cosmic-pro-tools?style=for-the-badge&logo=semantic-release"> <img src="https://img.shields.io/github/last-commit/osi-don/cosmic-pro-tools?style=for-the-badge&logo=git"> <img src="https://img.shields.io/github/stars/osi-don/cosmic-pro-tools?style=for-the-badge&logo=github"> </p>

Ultimate font, theme, and performance optimizer for the COSMIC Desktop.
Designed for clarity, speed, and beauty — powered by Don & Nova.

✨ Features

✔️ macOS-quality font rendering
✔️ System-wide font improvements (Noto, Nerd Fonts, emoji)
✔️ Auto-install themes and icon packs (Catppuccin, Orchis, Tela)
✔️ COSMIC-friendly performance boosts
✔️ Clean, interactive TUI menu
✔️ Built-in auto-updater (updates README + workflows too)
✔️ Supports Fedora, Arch/CachyOS, Ubuntu, Debian, Pop!_OS, Nobara, PikaOS & more

🚀 Quick Install
Clone the repo:

git clone https://github.com/osi-don/cosmic-pro-tools.git
cd cosmic-pro-tools

Run the toolkit:

chmod +x cosmic-master-toolkit-pro.sh
./cosmic-master-toolkit-pro.sh

🛠 What It Can Do
1️⃣ Install High-Quality Fonts

    Google Noto Sans / Serif

    Noto Emoji

    Nerd Fonts Symbols

    Cleans + rebuilds font cache

    Fully COSMIC compatible

2️⃣ Apply macOS-Style Font Rendering

Creates:

~/.config/fontconfig/conf.d/10-hinting.conf

Enabling:

    Subpixel RGB rendering

    Hinting: slight

    LCD filter

    True antialiasing

3️⃣ Install Premium Themes & Icons

Installed in:

~/.themes
~/.icons

Includes:

    Catppuccin GTK theme

    Orchis GTK theme

    Tela icon pack

4️⃣ Apply Performance Enhancements

Applies:

    SSD trim timer

    Swappiness 10

    Cleaner, faster IO tweaks

    Better responsiveness on COSMIC + PipeWire

5️⃣ Built-in Auto-Updater

To update to the latest version, run:

./cosmic-master-toolkit-pro.sh --update

The updater:

    Checks version.txt on GitHub

    Downloads updated script

    Downloads updated README

    Downloads updated GitHub Actions workflows

    Creates a full backup in:

~/.backup_cosmic_toolkit

🧩 File Structure

cosmic-pro-tools/
├── cosmic-master-toolkit-pro.sh       # Main script
├── README.md                          # This file
├── version.txt                        # Auto-updater version info
├── .github/
│   └── workflows/
│       └── lint.yml                   # ShellCheck CI
└── preview/
    └── example.png                    # Placeholder

🧪 GitHub Workflow Included

The repo includes a GitHub Action:

    lint.yml
    Runs ShellCheck on every commit to guarantee clean, safe shell scripts.

🧭 Credits

Created by:
🪐 Don & Nova

Contact:
📧 osi-don@protonmail.com
📜 License

MIT License
You’re free to use, modify, remix, and contribute.

>>>>>>> 72d3ac1 (Initial Pro Edition release)
