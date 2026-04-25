#!/usr/bin/env bash

(
  declare -r PACKAGES=(
    gnome-shell             # Base desktop environment

    gnome-terminal          # Terminal emulator
    nautilus                # File manager
    gnome-terminal-nautilus # "Open in terminal" context menu in file manager
    file-roller             # Archive manager
    gnome-system-monitor    # System monitor
    gnome-disk-utility      # Partition manager
    gnome-logs              # Log viewer
    baobab                  # Disk usage analyzer

    gnome-calculator        # Calculator
    gnome-text-editor       # Text editor
    papers                  # Document viewer
    loupe                   # Image viewer
    decibels                # Audio player
    showtime                # Video player

    gnome-extensions-app
    gnome-shell-extension-appindicator
    gnome-shell-extension-caffeine
    gnome-shell-extension-dash-to-dock
    gnome-shell-extension-user-theme
    gnome-browser-connector

    gnome-tweaks
    yaru-theme
  )

  sudo dnf install -y "${PACKAGES[@]}" --exclude=gnome-tour

  # Clipboard History extension
  EXT_DIR="$HOME/.local/share/gnome-shell/extensions/clipboard-history@alexsaveau.dev"
  [ -d "$EXT_DIR" ] || git clone https://github.com/SUPERCILEX/gnome-clipboard-history.git "$EXT_DIR"
  make -C "$EXT_DIR"

  dconf reset -f "/org/gnome/desktop/app-folders/"
  dconf load / <<'EOF'
[org/gnome/settings-daemon/plugins/power]
power-button-action='interactive'

[org/gnome/mutter]
workspaces-only-on-primary=false

[org/gnome/shell/app-switcher]
current-workspace-only=true

[org/gnome/desktop/background]
primary-color='#000000'

[org/gnome/desktop/interface]
color-scheme='prefer-dark'
cursor-theme='Yaru'
icon-theme='Yaru-blue-dark'
gtk-theme='Yaru-blue-dark'
font-name='Cantarell 11'
document-font-name='Cantarell 12'
monospace-font-name='Monospace 11'

[org/gnome/desktop/wm/keybindings]
switch-applications=['<Super>Tab']
switch-applications-backward=['<Shift><Super>Tab']
switch-windows=['<Alt>Tab']
switch-windows-backward=['<Shift><Alt>Tab']

[org/gnome/settings-daemon/plugins/media-keys]
custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/']

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal]
name='Open terminal'
command='gnome-terminal'
binding='<Control><Alt>t'

[org/gnome/desktop/privacy]
remove-old-temp-files=true
old-files-age=uint32 7
recent-files-max-age=30

[org/gnome/shell]
enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com', 'caffeine@patapon.info', 'clipboard-history@alexsaveau.dev', 'dash-to-dock@micxgx.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']
favorite-apps=['org.mozilla.firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Settings.desktop']

[org/gnome/shell/extensions/caffeine]
restore-state=true

[org/gnome/shell/extensions/dash-to-dock]
multi-monitor=true
isolate-workspaces=true
isolate-monitors=true
show-trash=false
show-mounts=false
disable-overview-on-startup=true
running-indicator-style='DASHES'

[org/gnome/shell/extensions/user-theme]
name='Yaru-dark'

[org/gnome/desktop/app-folders]
folder-children=['accessories', 'chromeapps', 'games', 'graphics', 'internet', 'office', 'programming', 'science', 'soundvideo', 'systemtools', 'universalaccess', 'wine']

[org/gnome/desktop/app-folders/folders/accessories]
name='Accessories'
categories=['Utility']

[org/gnome/desktop/app-folders/folders/chromeapps]
name='Chrome Apps'
categories=['chrome-apps']

[org/gnome/desktop/app-folders/folders/games]
name='Games'
categories=['Game']

[org/gnome/desktop/app-folders/folders/graphics]
name='Graphics'
categories=['Graphics']

[org/gnome/desktop/app-folders/folders/internet]
name='Internet'
categories=['Network', 'WebBrowser', 'Email']

[org/gnome/desktop/app-folders/folders/office]
name='Office'
categories=['Office']

[org/gnome/desktop/app-folders/folders/programming]
name='Programming'
categories=['Development']

[org/gnome/desktop/app-folders/folders/science]
name='Science'
categories=['Science']

[org/gnome/desktop/app-folders/folders/soundvideo]
name='Sound & Video'
categories=['AudioVideo', 'Audio', 'Video']

[org/gnome/desktop/app-folders/folders/systemtools]
name='System Tools'
categories=['System', 'Settings']

[org/gnome/desktop/app-folders/folders/universalaccess]
name='Universal Access'
categories=['Accessibility']

[org/gnome/desktop/app-folders/folders/wine]
name='Wine'
categories=['Wine', 'X-Wine', 'Wine-Programs-Accessories']
EOF

  sudo systemctl set-default graphical.target
)
