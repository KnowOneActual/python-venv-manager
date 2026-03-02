# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

[1.0.0]

### Changed
- Updated `venv_manager.sh` to improve cross-platform compatibility (added support for Windows/Git Bash).
- Removed `--system-site-packages` flag to ensure better environment isolation.
- Added dynamic detection for `python` vs `python3` executables.
- Updated `.gitignore` to correctly exclude the `.venv/` directory.


## [Unreleased]

### Added
- Improved Self-healing logic to automatically detect and rebuild broken virtual environments:
    - Detect Moves: Compares the actual path of the `.venv` directory with the path defined in the `activate` script to identify if the project has been moved.
    - Automatic Rebuild: Deletes and recreates the virtual environment if a path mismatch is detected.
    - Path Correction: Ensures all internal paths and shebangs (e.g., for `pip`) are correctly updated to the new location.
- Support for `pyproject.toml` to automatically install projects in editable mode.
- Support for functional verification of the Python interpreter before activation.


