#!/usr/bin/env bash

# If it's a laptop, use TLP for power management; otherwise, use tuned for performance.
if grep -q "Battery" /sys/class/power_supply/*/type; then
  sudo dnf install -y tlp tlp-pd tlp-rdw
  sudo dnf remove -y power-profiles-daemon tuned tuned-ppd
  sudo systemctl enable --now tlp.service
  sudo systemctl enable --now tlp-pd.service
  sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket
else
  sudo systemctl start tuned tuned-ppd
  sudo tuned-adm profile latency-performance
fi
