
# Python Virtual Environment Manager
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20Windows*-blue)](README.md#installation)
[![Language](https://img.shields.io/badge/Language-Shell%20Script-black)](venv_manager.sh)

*\*Windows support via Git Bash*

A smart shell script to simplify your Python development workflow. This script provides a single, intelligent command to create, activate, or deactivate a Python virtual environment based on the current context of your directory.


## The Why: Simplify Your Workflow

Managing Python virtual environments can be repetitive. This script streamlines that entire process into a single command. It knows what to do, so you don't have to.


## The What: Key Features

This script is an all-in-one solution that will:



* **Create:** If no virtual environment is found in the current folder, it creates a new one named .venv.
* **Configure:** Automatically sets include-system-site-packages = true in the pyvenv.cfg file upon creation, giving you access to globally installed packages.
* **Activate:** If a .venv folder exists but is not active, it activates it.
* **Deactivate:** If a virtual environment is already active, it deactivates it.


## The How: Installation and Usage

The script is designed to be sourced by your shell, making its function available as a command-line tool.


### Quick Usage

Once installed, simply navigate to your project directory and run:

venv 


The script will automatically figure out what to do.


### Installation on macOS & Linux (zsh, bash)

These instructions work for the default Terminal on macOS (Zsh) and most Linux distributions (Bash or Zsh).

**1. Create a Scripts Directory**

First, create a place to store your utility scripts in your home directory (if you don't have one already).

```bash
mkdir -p ~/scripts 

```

**2. Save the Script**

Download or copy the venv_manager.sh script from this repository into your new ~/scripts/ directory.

**3. Make the Script Executable**

Give your system permission to run the script.

```bash

chmod +x ~/scripts/venv_manager.sh 

```


**4. Connect the Script to Your Shell**

You need to tell your shell to load this script every time it starts.



* **If you use Zsh** (default on modern macOS), add the following lines to your ~/.zshrc file:

```
# Load custom python venv manager
source ~/scripts/venv_manager.sh
alias venv="venv_manager"

```

* **If you use Bash**, add the same lines to your ~/.bashrc file instead.

**5. Reload Your Shell**

To apply the changes, either close and reopen your terminal or run source ~/.zshrc (or source ~/.bashrc). The venv command is now ready to use!


### Installation on Windows (via Git Bash)

**Note:** This script is a Bash script and has not been tested on Windows. The following instructions are for users running **Git Bash** or a similar Bash-like environment on Windows, which should be compatible. It will **not** work in Command Prompt (CMD) or PowerShell.

**1. Create a Scripts Directory**

Open Git Bash and create a folder for your scripts in your user's home directory.

```
mkdir -p ~/scripts 

```


**2. Save the Script**

Download or copy the venv_manager.sh script into ~/scripts/.

**3. Connect the Script to Git Bash**

You need to tell Git Bash to load the script on startup. Add the following lines to your ~/.bashrc file. You may need to create this file if it doesn't exist.

```

# Load custom python venv manager
source ~/scripts/venv_manager.sh 
alias venv="venv_manager" 

```

**4. Restart Git Bash**

Close and reopen your Git Bash terminal. The venv command should now be available.
