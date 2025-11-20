# Contributing to Python Virtual Environment Manager

First off, thanks for taking the time to contribute! 🎉

I want to make contributing to this project as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features

## Develop with Github

I use github to host code, to track issues and feature requests, and to accept pull requests.

## Report Bugs using Github's [issue tracker]

I use GitHub issues to track public bugs. Report a bug by [opening a new issue](); it's that easy!

**Great Bug Reports** tend to have:
- A quick summary and/or background.
- Steps to reproduce (be specific!).
- What you expected would happen.
- What actually happened.
- Notes on what operating system and shell you are using (Zsh, Bash, Git Bash, etc.).

I have a **Bug Report Template** set up to help you with this.

## Suggesting Enhancements

If you have an idea to improve the script, I'd love to hear it. Open a new issue and select the **Feature Request** template. 

Please describe:
- The problem you are trying to solve.
- The solution you'd like to see.
- Any alternatives you've considered.

## Pull Requests

I actively welcome your pull requests.

1.  **Fork** the repo and create your branch from `main`.
2.  **Clone** the project to your own machine.
3.  **Code** your changes.
4.  **Test** your changes locally to ensure the script still behaves as expected on your system.
5.  **Update the Changelog**. If your change is notable, please add an entry to the `[Unreleased]` section of `CHANGELOG.md`.
6.  **Push** to your fork and submit a Pull Request.

### Coding Standards

To keep the code consistent and readable, please adhere to the following:

* **Style:** This project uses an `.editorconfig` file to maintain style. Please ensure your editor supports it (Indent style: Space, Size: 2).
* **Shellcheck:** It is highly recommended to run your changes through [ShellCheck](https://www.shellcheck.net/) to catch common bash script errors before submitting.
* **Compatibility:** Remember that this script aims to support macOS, Linux, and Windows (via Git Bash). Avoid using commands that are specific to only one platform if possible.

## License

By contributing, you agree that your contributions will be licensed under its MIT License.