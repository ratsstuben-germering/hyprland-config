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

## Requirements (Arch Linux)

See `HYPERSETUP.md` for the full spec.

```bash
sudo pacman -S --needed \
  hyprland waybar kitty rofi \
  wl-clipboard grim slurp \
  pipewire wireplumber playerctl \
  brightnessctl \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  noto-fonts-cjk noto-fonts-emoji ttf-font-awesome
```

`hypridle` and `hyprlock` are bundled with `hyprland`.

For the terminal font (JetBrains Mono Nerd Font), install one of:
- `ttf-jetbrains-mono` (community, no Nerd icons)
- `ttf-jetbrains-mono-nerd` (AUR, with Nerd icons)
