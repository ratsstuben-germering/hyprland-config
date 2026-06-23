# Hyprland Setup Specification

This document defines the intended Hyprland desktop setup for this environment.
It is a specification for how the setup should behave, not a record of one specific machine.

## Scope

- Wayland session using Hyprland
- TTY login flow with no display manager required
- Minimal desktop environment with explicit tools instead of a full DE
- Top bar via Waybar
- Idle locking via `hypridle` and `hyprlock`

## Required Components

### Core

- `hyprland`
- `hypridle`
- `hyprlock`
- `waybar`

### Terminal and Launcher

- `kitty`
- `rofi`

### Clipboard and Screenshots

- `wl-clipboard`
- `grim`
- `slurp`

### Audio and Media Keys

- `pipewire`
- `wireplumber`
- `pipewire-pulse`
- `playerctl`

### Brightness

- `brightnessctl`

### Portals

- `xdg-desktop-portal-hyprland`
- `xdg-desktop-portal-gtk`
- `qt5-wayland`
- `qt6-wayland`

### Fonts

- `ttf-jetbrains-mono-nerd`
- `noto-fonts-cjk`
- `otf-font-awesome`
- `noto-fonts-emoji`
- fallback fonts as needed

## Session Model

- Hyprland should start from `~/.bash_profile` when logging into `tty1`
- The startup command should use `start-hyprland`
- Startup should be guarded so it does not run if `DISPLAY` or `WAYLAND_DISPLAY` is already set
- No display manager is required

## Hyprland Configuration

Primary config file:

- `~/.config/hypr/hyprland.conf`

### Startup

The Hyprland session should:

- import `WAYLAND_DISPLAY` and `XDG_CURRENT_DESKTOP` into the user/systemd environment
- start `hypridle`
- start `waybar`

### Layout and Appearance

- Layout should be `dwindle`
- `pseudotile = true`
- `preserve_split = true`
- `gaps_in = 0`
- `gaps_out = 0`
- borders enabled
- rounded corners enabled
- shadows enabled
- blur enabled
- animations enabled

### Input

- keyboard layout should be `us`
- `follow_mouse = 1`
- 3-finger horizontal gesture should switch workspaces

## Keybind Specification

Primary modifier:

- `SUPER`

This setup intentionally uses a `SUPER`-only workflow for core window-management actions.
`ALT` should not be used as the main workspace modifier because application shortcuts commonly consume it.

### Required Core Binds

- `SUPER+Q` → open terminal
- `SUPER+R` → open launcher
- `SUPER+C` → kill active window
- `SUPER+M` → exit Hyprland
- `SUPER+V` → toggle floating
- `SUPER+P` → toggle pseudotile

### Focus Movement

Both of these should exist:

- `SUPER+Left/Right/Up/Down`
- `SUPER+H/J/K/L`

### Window Movement

- `SUPER+CTRL+H/J/K/L`

### Workspaces

- `SUPER+1..0` → switch to workspaces `1..10`
- `SUPER+SHIFT+1..0` → move active window to workspaces `1..10`
- `SUPER+mouse wheel` → cycle workspaces

### Scratchpad

- `SUPER+S` → toggle special workspace
- `SUPER+SHIFT+S` → move active window to special workspace

### Mouse Actions

- `SUPER+LMB drag` → move window
- `SUPER+RMB drag` → resize window

### Media and Brightness Keys

The setup should include binds for:

- volume up/down
- mute
- microphone mute
- brightness up/down
- media previous/play-pause/next

### Screenshot

- `Print` should trigger region screenshot capture
- screenshot should be saved to disk
- screenshot should also be copied to the Wayland clipboard

## Idle and Locking

Config file:

- `~/.config/hypr/hypridle.conf`

Notes:

- for this setup, `hypridle` config is expected under `~/.config/hypr/`
- `hyprlock` should be used when available

Required behavior:

- after 5 minutes idle: lock session
- after 10 minutes idle: turn displays off via DPMS
- on resume: turn displays back on
- before sleep: lock session

## Waybar Specification

Config files:

- `~/.config/waybar/config`
- `~/.config/waybar/style.css`

Waybar should be launched by Hyprland `exec-once`, not relied on via the user service unit.

### Bar Layout

- position: top
- thin presentation
- target height: `22px`
- compact spacing

### Modules

Left:

- Hyprland workspaces

Center:

- active window title

Right:

- LAN IP
- audio
- CPU temperature and total CPU usage
- GPU temperature and GPU utilization
- RAM usage
- root filesystem usage
- clock
- tray

Battery should not be part of the default bar specification.

### Workspace Display

- workspaces `1..10` must always be visible
- workspace labels should use standard Chinese numerals:
  - `一 二 三 四 五 六 七 八 九 十`
- a CJK-capable font must be present so these glyphs render correctly

### Styling Requirements

- dark translucent background
- compact typography
- workspace buttons sized for a thin bar
- fixed-width status modules so changing values do not cause horizontal layout shifts
- tray icons sized to keep the bar thin

### Audio Module

- audio click action should toggle mute via `wpctl`
- do not depend on `pavucontrol`

## Helper Scripts

Expected helper scripts in `~/bin`:

- `screenshot.sh`
- `waybar-lan-ip.sh`
- `waybar-cpu-temp.sh`
- `waybar-gpu.sh`
- `waybar-disk-root.sh`

Expected behavior:

- `waybar-lan-ip.sh` prints LAN interface and IPv4 address
- `waybar-cpu-temp.sh` prints CPU temperature and total utilization
- `waybar-gpu.sh` prints GPU temperature and utilization
- `waybar-disk-root.sh` prints root filesystem usage

## Terminal and Launcher

### Kitty

- use JetBrains Mono Nerd Font
- slightly transparent background

### Rofi

- use the Monokai theme

## Design Intent

This setup should remain:

- minimal
- keyboard-driven
- stable in application-heavy workflows
- explicit rather than desktop-environment-like
- visually compact

## Non-Goals

- no display manager requirement
- no full desktop environment
- no file manager requirement
- no clipboard history daemon requirement
- no notification daemon requirement
- no dependency on application-specific shortcuts for window management
