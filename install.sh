#!/bin/bash

set -e

TARGET_DIR="$(pwd)/bin"
mkdir -p "$TARGET_DIR"

for script_dir in scripts/*; do
  if [[ -d "$script_dir" ]]; then
    script_file="$(find "$script_dir" -maxdepth 1 -name '*.sh' | head -n 1)"
    if [[ -f "$script_file" ]]; then
      filename=$(basename "$script_file")
      linkname="${filename%.*}"
      ln -sf "$script_file" "$TARGET_DIR/$linkname"
      chmod +x "$script_file"
      echo "🔗 Linked $script_file -> $TARGET_DIR/$linkname"
    fi
  fi

done

echo -e "\n✅ All scripts symlinked to $TARGET_DIR"
echo "📌 Add this to your shell config if not already in PATH:"
echo "export PATH=\"\$PATH:$TARGET_DIR\""