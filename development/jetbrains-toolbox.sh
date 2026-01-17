#!/usr/bin/env bash

mkdir -p "$HOME/.local/share/JetBrains/Toolbox"

curl -fsSL "https://data.services.jetbrains.com/products/download?platform=linux&code=TBA" |
  tar -xzf - -C "$HOME/.local/share/JetBrains/Toolbox" --strip-components=1

"$HOME/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox" &
