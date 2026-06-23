# Hyprland Config

Hyprland desktop configuration for a minimal, keyboard-driven Wayland setup.

- No display manager — Hyprland starts from `~/.bash_profile` on tty1
- Idle locking via `hypridle` / `hyprlock`
- Top bar via Waybar with CJK workspace labels
- Region screenshot bound to Print

## Files

| File | Deploy to |
|---|---|
| `hyprland.conf` | `~/.config/hypr/` |
| `hypridle.conf` | `~/.config/hypr/` |
| `waybar/config` | `~/.config/waybar/` |
| `waybar/style.css` | `~/.config/waybar/` |
| `scripts/screenshot.sh` | `~/bin/` |
| `scripts/waybar-lan-ip.sh` | `~/bin/` |
| `scripts/waybar-cpu-temp.sh` | `~/bin/` |
| `scripts/waybar-gpu.sh` | `~/bin/` |
| `scripts/waybar-disk-root.sh` | `~/bin/` |

## Quick Deploy

```bash
mkdir -p ~/.config/hypr ~/.config/waybar ~/bin
cp hyprland.conf ~/.config/hypr/
cp hypridle.conf ~/.config/hypr/
cp waybar/config ~/.config/waybar/
cp waybar/style.css ~/.config/waybar/
cp scripts/* ~/bin/
chmod +x ~/bin/*
```

## Requirements

See `HYPERSETUP.md` for the full spec. Core dependencies:

- `hyprland` `hypridle` `hyprlock`
- `waybar` `kitty` `rofi`
- `wl-clipboard` `grim` `slurp`
- `pipewire` `wireplumber` `playerctl`
- `brightnessctl`
- `xdg-desktop-portal-hyprland` `xdg-desktop-portal-gtk`
- `ttf-jetbrains-mono-nerd` `noto-fonts-cjk` `otf-font-awesome` `noto-fonts-emoji`
