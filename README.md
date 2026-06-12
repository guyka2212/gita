<div align="center">
  <pre>
  ________.__  __
  /  _____/|__|/  |______
 /   \  ___|  \   __\__  \
 \    \_\  \  ||  |  / __ \_
  \______  /__||__| (____  /
         \/              \/
  </pre>
  <h1>🐙 Gita</h1>
  <p><strong>Portable project snapshots, templates & automation — from anywhere, for anywhere.</strong></p>
  <p>
    <a href="#-one-command-install"><code>curl -sSL ... | bash</code></a> •
    <a href="#-usage">Usage</a> •
    <a href="#%EF%B8%8F-commands">Commands</a> •
    <a href="#-directory-structure">Structure</a>
  </p>
  <br>
</div>

---

## ⚡ One-Command Install

```bash
curl -sSL "https://raw.githubusercontent.com/guyka2212/gita/main/install.sh" | bash
```

That's it. After a fresh terminal, run **`gita`** to verify.

### What the installer does

| Step | Action |
|------|--------|
| 1 | Creates `~/.gita/{scripts,templates,pushes}` |
| 2 | Writes inline documentation manifests |
| 3 | Downloads the `gita` engine to `/usr/local/bin/gita` |
| 4 | Installs the `rich` Python library (if `pip`/`pip3` is available) |

---

## 📁 Directory Structure

```text
~/.gita/
├── README.md          # Storage hub documentation
├── pushes/            # Project snapshots via `gita push`
├── templates/         # Starter blueprints via `gita -t`
└── scripts/           # Custom automations via `gita run`
```

### `pushes/` — Project Snapshots
Full working-tree copies saved with `gita push {name}`. Restore them anywhere
with `gita pull {dest-folder}/{name}`.

### `templates/` — Starter Blueprints
Framework skeletons (e.g. `npm_app`, `python_app`). Apply one into the current
directory with `gita -t {name}`.

### `scripts/` — Custom Automations
Executable scripts (no extension required) that you can invoke from any
directory via `gita run {name}`. See `~/.gita/scripts/README.md` for authoring
rules.

---

## ⌨️ Commands

| Action | Command | Description |
|--------|---------|-------------|
| **Save state** | `gita push {name}` | Copy current directory into `~/.gita/pushes/{name}` |
| **Restore state** | `gita pull {folder}/{name}` | Extract a saved push into a new subdirectory |
| **Apply template** | `gita -t {name}` | Copy a starter blueprint into the current folder |
| **List templates** | `gita -t -ls` | Show all available templates |
| **Run automation** | `gita run {name}` | Execute a script from `~/.gita/scripts/` |

### `gita push <name>`

Backs up the entire current working directory (excluding `.git` and `.gita`) into
`~/.gita/pushes/<name>/`.

```bash
cd ~/projects/my-app
gita push my-app-v2
# Saved in ~/.gita/pushes/my-app-v2/
```

### `gita pull <dest-folder>/<name>`

Reconstructs a previously saved snapshot as a new directory under the current
working tree.

```bash
gita pull restored-app/my-app-v2
# Creates ./restored-app/ from ~/.gita/pushes/my-app-v2/
```

### `gita -t <template-name>`

Injects a template from `~/.gita/templates/<template-name>/` into the current
directory. All files and subdirectories inside the template are copied here.

```bash
mkdir my-new-project && cd my-new-project
gita -t npm_app
# package.json, index.js, etc. are now present
```

### `gita -t -ls`

Lists every subdirectory inside `~/.gita/templates/`.

```bash
gita -t -ls
# Available Gita Templates:
#   • npm_app
#   • python_app
```

### `gita run <script-name>`

Safely executes `~/.gita/scripts/<script-name>` via `bash`. Scripts must be
executable and contain a valid shebang.

```bash
gita run sys-check
# Runs: bash ~/.gita/scripts/sys-check
```

---

## 🧩 Extending

### Adding a Template
```bash
mkdir -p ~/.gita/templates/react-app
# populate with package.json, src/, etc.
gita -t react-app   # use it anywhere
```

### Adding an Automation Script
```bash
touch ~/.gita/scripts/deploy
chmod +x ~/.gita/scripts/deploy
# First line: #!/bin/bash
gita run deploy
```

---

## 🛠 Requirements

- **Python 3.6+** (for the `gita` engine)
- **curl** (for the installer)
- **pip / pip3** (optional — only needed for automatic `rich` installation)

---

<p align="center">
  <sub>Built with ❤️ — <a href="https://github.com/guyka2212">guyka2212</a></sub>
<br>
  <sub>
    <a href="#-one-command-install">Install</a> •
    <a href="#%EF%B8%8F-commands">Commands</a> •
    <a href="#-directory-structure">Structure</a> •
    <a href="#-extending">Extending</a>
  </sub>
</p>
