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

  declare -rA DCONF_SETTINGS=(
    # Power
    ["/org/gnome/settings-daemon/plugins/power/power-button-action"]="'interactive'"
    # Multitasking
    ["/org/gnome/mutter/workspaces-only-on-primary"]="false"
    ["/org/gnome/shell/app-switcher/current-workspace-only"]="true"
    # Appearance
    ["/org/gnome/desktop/background/primary-color"]="'#000000'"
    ["/org/gnome/desktop/interface/color-scheme"]="'prefer-dark'"
    ["/org/gnome/desktop/interface/cursor-theme"]="'Yaru'"
    ["/org/gnome/desktop/interface/icon-theme"]="'Yaru-blue-dark'"
    ["/org/gnome/desktop/interface/gtk-theme"]="'Yaru-blue-dark'"
    ["/org/gnome/desktop/interface/font-name"]="'Cantarell 11'"
    ["/org/gnome/desktop/interface/document-font-name"]="'Cantarell 12'"
    ["/org/gnome/desktop/interface/monospace-font-name"]="'Monospace 11'"
    # Keyboard
    ["/org/gnome/desktop/wm/keybindings/switch-applications"]="['<Super>Tab']"
    ["/org/gnome/desktop/wm/keybindings/switch-applications-backward"]="['<Shift><Super>Tab']"
    ["/org/gnome/desktop/wm/keybindings/switch-windows"]="['<Alt>Tab']"
    ["/org/gnome/desktop/wm/keybindings/switch-windows-backward"]="['<Shift><Alt>Tab']"
    ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/name"]="'Open terminal'"
    ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/command"]="'gnome-terminal'"
    ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/binding"]="'<Control><Alt>t'"
    ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"]="['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-terminal/']"
    # Privacy
    ["/org/gnome/desktop/privacy/remove-old-temp-files"]="true"
    ["/org/gnome/desktop/privacy/old-files-age"]="uint32 7"
    ["/org/gnome/desktop/privacy/recent-files-max-age"]="30"

    # Extensions
    ["/org/gnome/shell/enabled-extensions"]="['appindicatorsupport@rgcjonas.gmail.com', 'caffeine@patapon.info', 'dash-to-dock@micxgx.gmail.com', 'user-theme@gnome-shell-extensions.gcampax.github.com']"
    # Caffeine
    ["/org/gnome/shell/extensions/caffeine/restore-state"]="true"
    # Dash to Dock
    ["/org/gnome/shell/extensions/dash-to-dock/multi-monitor"]="true"
    ["/org/gnome/shell/extensions/dash-to-dock/isolate-workspaces"]="true"
    ["/org/gnome/shell/extensions/dash-to-dock/isolate-monitors"]="true"
    ["/org/gnome/shell/extensions/dash-to-dock/show-trash"]="false"
    ["/org/gnome/shell/extensions/dash-to-dock/show-mounts"]="false"
    ["/org/gnome/shell/extensions/dash-to-dock/disable-overview-on-startup"]="true"
    ["/org/gnome/shell/extensions/dash-to-dock/running-indicator-style"]="'DASHES'"
    # User Themes
    ["/org/gnome/shell/extensions/user-theme/name"]="'Yaru-dark'"

    # Organize applications into folders
    ["/org/gnome/desktop/app-folders/folders/accessories/name"]="'Accessories'"
    ["/org/gnome/desktop/app-folders/folders/accessories/categories"]="['Utility']"
    ["/org/gnome/desktop/app-folders/folders/chromeapps/name"]="'Chrome Apps'"
    ["/org/gnome/desktop/app-folders/folders/chromeapps/categories"]="['chrome-apps']"
    ["/org/gnome/desktop/app-folders/folders/games/name"]="'Games'"
    ["/org/gnome/desktop/app-folders/folders/games/categories"]="['Game']"
    ["/org/gnome/desktop/app-folders/folders/graphics/name"]="'Graphics'"
    ["/org/gnome/desktop/app-folders/folders/graphics/categories"]="['Graphics']"
    ["/org/gnome/desktop/app-folders/folders/internet/name"]="'Internet'"
    ["/org/gnome/desktop/app-folders/folders/internet/categories"]="['Network', 'WebBrowser', 'Email']"
    ["/org/gnome/desktop/app-folders/folders/office/name"]="'Office'"
    ["/org/gnome/desktop/app-folders/folders/office/categories"]="['Office']"
    ["/org/gnome/desktop/app-folders/folders/programming/name"]="'Programming'"
    ["/org/gnome/desktop/app-folders/folders/programming/categories"]="['Development']"
    ["/org/gnome/desktop/app-folders/folders/science/name"]="'Science'"
    ["/org/gnome/desktop/app-folders/folders/science/categories"]="['Science']"
    ["/org/gnome/desktop/app-folders/folders/soundvideo/name"]="'Sound & Video'"
    ["/org/gnome/desktop/app-folders/folders/soundvideo/categories"]="['AudioVideo', 'Audio', 'Video']"
    ["/org/gnome/desktop/app-folders/folders/systemtools/name"]="'System Tools'"
    ["/org/gnome/desktop/app-folders/folders/systemtools/categories"]="['System', 'Settings']"
    ["/org/gnome/desktop/app-folders/folders/universalaccess/name"]="'Universal Access'"
    ["/org/gnome/desktop/app-folders/folders/universalaccess/categories"]="['Accessibility']"
    ["/org/gnome/desktop/app-folders/folders/wine/name"]="'Wine'"
    ["/org/gnome/desktop/app-folders/folders/wine/categories"]="['Wine', 'X-Wine', 'Wine-Programs-Accessories']"
    ["/org/gnome/desktop/app-folders/folder-children"]="['accessories', 'chromeapps', 'games', 'graphics', 'internet', 'office', 'programming', 'science', 'soundvideo', 'systemtools', 'universalaccess', 'wine']"

    # Applications pinned to the dock
    ["/org/gnome/shell/favorite-apps"]="['org.mozilla.firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Settings.desktop']"
  )

  dconf reset -f "/org/gnome/desktop/app-folders/"
  for DCONF_KEY in "${!DCONF_SETTINGS[@]}"; do
    dconf write "$DCONF_KEY" "${DCONF_SETTINGS[$DCONF_KEY]}"
  done

  sudo systemctl set-default graphical.target
)
