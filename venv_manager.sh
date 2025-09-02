#!/bin/bash
# A smart script to manage Python virtual environments.
#
# Features:
# - Creates a .venv if one doesn't exist.
# - Activates an existing .venv.
# - Deactivates the currently active environment.
# - Automatically upgrades pip on creation.
# - Automatically installs from requirements.txt on creation.
# - Provides helpful feedback to the user.

function venv_manager() {
    # --- Help Flag ---
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "Usage: venv"
        echo "A smart manager for Python virtual environments."
        echo ""
        echo "This command will:"
        echo "  - Deactivate the current environment if one is active."
        echo "  - Activate the .venv in the current directory if it exists."
        echo "  - Create, configure, and activate a new .venv if none exists."
        echo "    - Upon creation, it will also upgrade pip and install dependencies"
        echo "      from a requirements.txt file if one is found."
        return 0
    fi

    local VENV_DIR=".venv"

    # --- Deactivation Logic ---
    # Check if a virtual environment is already active ($VIRTUAL_ENV is set by activate scripts)
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "Deactivating virtual environment..."
        deactivate
        return 0
    fi

    # --- Activation Logic ---
    # If not active, check if a venv folder exists in the current directory
    if [ -d "$VENV_DIR" ]; then
        echo "Activating existing virtual environment..."
        source "$VENV_DIR/bin/activate"
        return 0
    fi

    # --- Creation Logic ---
    # If no venv is active and none exists here, create one.
    echo "No virtual environment found. Creating one..."
    # Use the --system-site-packages flag to include system packages
    python3 -m venv --system-site-packages "$VENV_DIR"

    if [ $? -ne 0 ]; then
        echo "Error: Failed to create the virtual environment. Is python3-venv installed?"
        return 1
    fi

    echo "Configured to include system site-packages."

    # Activate the newly created environment
    echo "Activating new virtual environment..."
    source "$VENV_DIR/bin/activate"

    # Upgrade pip
    echo "Upgrading pip..."
    python -m pip install --upgrade pip > /dev/null 2>&1

    # Check for requirements.txt and install dependencies
    if [ -f "requirements.txt" ]; then
        echo "requirements.txt found. Installing dependencies..."
        pip install -r requirements.txt
    else
        echo "No requirements.txt found. Skipping dependency installation."
    fi

    echo "Done. Your new environment is ready."
}