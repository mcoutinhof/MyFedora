#!/usr/bin/env bash

sudo dnf install -y firefox

sudo mkdir -p "/etc/firefox/defaults/pref"
sudo tee "/etc/firefox/defaults/pref/user.js" >/dev/null <<EOF
pref("browser.bookmarks.file", "");
pref("browser.newtabpage.pinned", "[]");
pref("browser.startup.homepage", "about:home");

pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
EOF

sudo mkdir -p "/etc/firefox/policies"
sudo tee "/etc/firefox/policies/policies.json" >/dev/null <<EOF
{
  "policies": {
    "ExtensionSettings": {
      "uBlock0@raymondhill.net": {
        "installation_mode": "normal_installed",
        "install_url": "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
      }
    }
  }
}
EOF
