#!/bin/bash

REPO_URL="https://github.com/sinokadev/dokr.git"

INSTALL_DIR="$HOME/.dokr"
BIN_DIR="$HOME/.local/bin"

if ! command -v python3 &> /dev/null
then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3 before running this install script."
    exit 1
fi

if ! command -v git &> /dev/null
then
    echo "Error: git is not installed."
    echo "Please install git before running this install script."
    exit 1
fi

if ! command -v docker &> /dev/null
then
    echo "Warning: Docker is not installed."
    echo "dokr commands may fail without Docker."
fi

mkdir -p "$BIN_DIR"

if [ -d "$INSTALL_DIR" ]; then
    echo "Existing dokr installation found, removing..."
    rm -rf "$INSTALL_DIR"
fi

git clone "$REPO_URL" "$INSTALL_DIR" || { echo "Failed to clone repository."; exit 1; }

cp "$INSTALL_DIR/bin/dokr" "$BIN_DIR/dokr"
chmod +x "$BIN_DIR/dokr"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "Warning: $BIN_DIR is not in your PATH."
    echo "Add this to your shell config (e.g., ~/.bashrc or ~/.zshrc):"
    echo "export PATH=\"$BIN_DIR:\$PATH\""
fi

if "$BIN_DIR/dokr" install_testing 2>/dev/null | grep -q "installed"; then
    echo "dokr installed successfully! You can now run 'dokr' from anywhere."
else
    echo "Warning: install_testing failed. Please check your dokr installation."
fi