#!/bin/bash

# A smart manager for Python virtual environments.
#
# This function checks the state of the current directory and shell to determine
# whether to create, activate, or deactivate a Python virtual environment.
#
# Logic:
# 1. If a virtual environment is currently active, it deactivates it.
# 2. If no environment is active but a '.venv' directory exists, it activates it.
# 3. If no environment is active and no '.venv' directory exists, it creates one,
#    configures it to include system site-packages, and then activates it.

venv_manager() {
  # The standard name for the virtual environment directory.
  VENV_DIR=".venv"

  # --- CASE 1: A virtual environment is already active ---
  # The $VIRTUAL_ENV variable is set by the 'activate' script.
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "Deactivating virtual environment..."
    deactivate
    echo "✅ Virtual environment deactivated."

  # --- CASE 2: No active venv, but a .venv directory exists ---
  # Check for the existence of the directory.
  elif [ -d "$VENV_DIR" ]; then
    echo "Activating existing virtual environment..."
    source "$VENV_DIR/bin/activate"
    echo "✅ Virtual environment activated from '$VENV_DIR'."

  # --- CASE 3: No active venv and no .venv directory ---
  else
    echo "No virtual environment found. Creating a new one..."
    # Create the virtual environment using Python 3's built-in venv module.
    python3 -m venv "$VENV_DIR"

    # Check if the 'python3 -m venv' command was successful.
    if [ $? -eq 0 ]; then
      echo "Virtual environment created in '$VENV_DIR'."

      # Append the system site-packages configuration to the config file.
      echo "include-system-site-packages = true" >> "$VENV_DIR/pyvenv.cfg"
      echo "🔧 Configured to include system site-packages."

      # Activate the newly created environment.
      echo "Activating new virtual environment..."
      source "$VENV_DIR/bin/activate"
      echo "✅ New virtual environment activated."
    else
      # Notify the user if creation failed for some reason.
      echo "❌ Error: Failed to create the virtual environment."
      return 1
    fi
  fi
}
