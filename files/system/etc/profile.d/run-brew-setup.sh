#!/bin/bash

# Versioned script to install Homebrew packages on first login
# This will run again when the version is updated

# Only run for interactive login shells
if [[ $- == *i* ]]; then
    # Current script version
    CURRENT_VERSION="1.0"
    VERSION_FILE="$HOME/.brew_packages_version"
    INSTALLED_VERSION="0.0"

    # Check if we've run before and which version
    if [ -f "$VERSION_FILE" ]; then
        INSTALLED_VERSION=$(cat "$VERSION_FILE")
    fi

    # Exit if we're already at the current version
    if [ "$INSTALLED_VERSION" = "$CURRENT_VERSION" ]; then
        exit 0
    fi

    # Version-specific package additions
    V1_0_PACKAGES=(
        go
        nvm
        rust
    )

    # Handle version-specific upgrades
    case "$INSTALLED_VERSION" in
        "0.0")
            # Fresh install or upgrade from 0.0
            echo "Installing packages for version 1.0..."
            brew install "${V1_0_PACKAGES[@]}"
            # Initialize NVM if it was just installed
            if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
                export NVM_DIR="$HOME/.nvm"
                . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"

                # Install latest LTS version of Node
                echo "Installing latest LTS version of Node.js..."
                nvm install --lts
                nvm use --lts
            fi
            ;;
        # Add more cases for future versions
        # "1.0")
        #     echo "Upgrading to version 1.1..."
        #     brew install package-added-in-1.1
        #     ;;
    esac

    # Update version file
    echo "$CURRENT_VERSION" > "$VERSION_FILE"
fi
