# Hype - Arch Linux Hyprland Setup

This repository contains my personal Arch Linux configuration (Hyprland, Waybar, Kitty, Zsh, etc.).
Follow these steps to replicate the setup on a fresh Arch install.

## Prerequisites

1.  **Arch Linux Installed**: Ensure you have a working Arch Linux installation.
2.  **Git Installed**: `sudo pacman -S git`
3.  **AUR Helper**: Install `yay` (or `paru`).
    ```bash
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    ```

## 1. Clone the Repository

```bash
git clone https://github.com/djsbenelen/Hype.git
cd Hype
```

## 2. Install Packages

Install the packages listed in `pkglist.txt`. You may want to review the list first.

```bash
# Filter and install official packages
cat pkglist.txt | cut -d' ' -f1 | xargs -I{} yay -S --needed --noconfirm {}
```

*Note: Some packages might be from AUR, `yay` handles both.*

## 3. Copy Configurations

**Backup your existing configs first!**

```bash
# Create config directory if not exists
mkdir -p ~/.config

# Copy config folders
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r kitty ~/.config/
cp -r rofi ~/.config/
cp -r dunst ~/.config/
cp -r fastfetch ~/.config/

# Zsh Configs
cp zsh/.zshrc ~/
cp zsh/.p10k.zsh ~/
```

## 4. System Configurations (Root Required)

### GRUB Theme
```bash
sudo cp -r grub/theme /boot/grub/themes/
sudo cp grub/default /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Plymouth Theme
```bash
sudo cp -r plymouth/themes/spinner /usr/share/plymouth/themes/
# Edit /etc/plymouth/plymouthd.conf to set the theme if needed
#[Daemon]
#Theme=spinner
sudo mkinitcpio -P
```

### SDDM Theme
```bash
sudo cp -r sddm/sugar-candy /usr/share/sddm/themes/
# Create/Edit /etc/sddm.conf.d/theme.conf
# [Theme]
# Current=sugar-candy
```

### Initramfs
Copy the `mkinitcpio.conf` if you want my specific hooks/modules.
```bash
sudo cp mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -P
```

## 5. Finalize

- **Reboot** to verify everything works.
- **Wallpapers**: Default wallpapers are expected in `~/Pictures/Wallpapers`.
- **Scripts**: Check `~/.config/waybar/scripts` are executable (`chmod +x ...`).

## Documentation

- [Keybindings](keybindings.md)
- [Aliases](alias.md)
