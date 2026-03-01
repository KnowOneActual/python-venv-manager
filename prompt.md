# Instruction: Update python-venv-manager for Robustness

## The Problem
Virtual environments (`.venv`) use absolute paths in their internal scripts (like `bin/pip` and `bin/python`). If a project directory is moved, these paths break, leading to "bad interpreter" errors or "command not found" even if the `.venv` folder still exists.

## The Goal
Update the `python-venv-manager` script to "self-heal" by detecting broken interpreters and rebuilding the environment automatically.

## Required Logic
Replace simple directory checks (e.g., `if [ -d .venv ]`) with a functional check.

### Bash Snippet for Implementation:
```bash
VENV_DIR=".venv"

# 1. Check if the directory exists
if [ -d "$VENV_DIR" ]; then
    # 2. Verify the interpreter is functional
    # This detects broken absolute paths (bad interpreter errors)
    if ! "$VENV_DIR/bin/python" --version >/dev/null 2>&1; then
        echo "⚠️ Virtual environment is broken (likely due to a directory move)."
        echo "🔧 Rebuilding..."
        rm -rf "$VENV_DIR"
        python3 -m venv "$VENV_DIR"
        
        # Ensure dependencies are reinstalled
        "$VENV_DIR/bin/pip" install --upgrade pip
        
        # Adjust this line based on how the script usually handles installs:
        if [ -f "pyproject.toml" ]; then
            "$VENV_DIR/bin/pip" install -e .
        elif [ -f "requirements.txt" ]; then
            "$VENV_DIR/bin/pip" install -r requirements.txt
        fi
        
        echo "✅ Environment restored."
    else
        echo "✨ Environment verified (functional)."
    fi
else
    echo "Creating new virtual environment..."
    python3 -m venv "$VENV_DIR"
    # ... standard setup ...
fi
```

## Action Items
1. Review the existing `python-venv-manager` script.
2. Identify where it checks for the existence of `.venv`.
3. Wrap that check with the `bin/python --version` verification logic shown above.
4. Ensure it triggers a full reinstall/rebuild if the environment is deleted.
