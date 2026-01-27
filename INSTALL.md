# Hyprland Setup Installation Guide

This guide covers how to reinstall my Hyprland setup on a fresh Arch Linux install using the configurations in this repository.

## 1. Install `yay` (AUR Helper)

If you haven't installed `yay` yet, run the following commands:

```bash
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
```

## 2. Install Packages

### Official Repositories (Pacman)

Install the main packages from the official repositories using the generated list:

```bash
sudo pacman -S --needed - < pkg_lists/pacman_packages.txt
```

### AUR Packages (Yay)

Install the AUR packages:

```bash
yay -S --needed - < pkg_lists/aur_packages.txt
```

## 3. Apply Configurations

Clone this repository and copy the config files to your local `~/.config` directory.

**Warning: This will overwrite existing configurations. Back up your current configs if needed.**

```bash
# Clone the repo (if you haven't already)
git clone https://github.com/Dijo-404/Hype.git
cd Hype
git checkout Dj-Configs

# Copy configs
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r rofi ~/.config/
cp -r kitty ~/.config/
cp -r Kvantum ~/.config/
cp -r dunst ~/.config/
cp -r fastfetch ~/.config/
cp -r qt5ct ~/.config/
cp -r qt6ct ~/.config/

# Copy Wallpapers
mkdir -p ~/Pictures/Wallpapers
cp -r Wallpapers/* ~/Pictures/Wallpapers/
# Ensure scripts are executable (if any)
chmod +x ~/.config/waybar/scripts/*
```

## 4. Post-Install

- **Themes**: Open `kvantummanager` and `qt5ct`/`qt6ct` to select the installed themes.
- **Wallpapers**: Ensure your wallpapers are in `~/Pictures/Wallpapers` as configured in `hyprland.conf` and `hyprlock.conf`.
- **Reboot**: Reboot your system to apply all changes.
