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
        return 0
    fi

    local VENV_DIR=".venv"
    local PYTHON_CMD=""

    # Determine which python executable to use
    if command -v python3 &> /dev/null; then
        PYTHON_CMD="python3"
    elif command -v python &> /dev/null; then
        PYTHON_CMD="python"
    else
        echo "Error: Python is not installed or not found in PATH."
        return 1
    fi

    # --- Deactivation Logic ---
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "Deactivating virtual environment..."
        deactivate
        return 0
    fi

    # --- Activation Helper Function ---
    function activate_venv() {
        if [ -f "$VENV_DIR/bin/activate" ]; then
            source "$VENV_DIR/bin/activate"
        elif [ -f "$VENV_DIR/Scripts/activate" ]; then
            source "$VENV_DIR/Scripts/activate"
        else
            echo "Error: Could not find activation script in $VENV_DIR."
            return 1
        fi
    }

    # --- Activation Logic ---
    if [ -d "$VENV_DIR" ]; then
        echo "Activating existing virtual environment..."
        activate_venv
        return 0
    fi

    # --- Creation Logic ---
    echo "No virtual environment found. Creating one..."
    
    # Removed --system-site-packages for better isolation
    $PYTHON_CMD -m venv "$VENV_DIR"

    if [ $? -ne 0 ]; then
        echo "Error: Failed to create the virtual environment."
        return 1
    fi

    echo "Activating new virtual environment..."
    activate_venv

    # Upgrade pip
    echo "Upgrading pip..."
    $PYTHON_CMD -m pip install --upgrade pip > /dev/null 2>&1

    # Check for requirements.txt and install dependencies
    if [ -f "requirements.txt" ]; then
        echo "requirements.txt found. Installing dependencies..."
        pip install -r requirements.txt
    else
        echo "No requirements.txt found. Skipping dependency installation."
    fi

    echo "Done. Your new environment is ready."
}