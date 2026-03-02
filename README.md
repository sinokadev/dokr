# Dokr!

Dokr is a shell command that make using Docker even better.

## Install Requirements
 - Python3
 - bash
 - docker
 - git

## Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/sinokadev/dokr/refs/heads/main/install.sh)"
```

or using wget

```bash
bash -c "$(wget -qO- https://raw.githubusercontent.com/sinokadev/dokr/refs/heads/main/install.sh)"
```

You should run `export PATH="$HOME/.local/bin:$PATH"` if your shell cannot find the dokr command after installation, meaning `$HOME/.local/bin` is not already included in your PATH environment variable.