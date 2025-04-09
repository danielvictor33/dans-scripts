#!/bin/bash

TARGET_DIR="$(pwd)/bin"

if [[ -d "$TARGET_DIR" ]]; then
  echo "🗑️  Removing symlinks in $TARGET_DIR..."
  rm -rf "$TARGET_DIR"
  echo "✅ Done."
else
  echo "No symlinks to remove."
fi