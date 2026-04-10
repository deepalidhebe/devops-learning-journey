# Day 9 – Shell Scripting Basics (Zero to Hero)

## 📌 Purpose of Scripting & Automation
- Reduce repetitive manual tasks.
- Example: Creating 1000 files manually is impractical → automate with shell scripts.
- In DevOps: Automates deployments, log rotations, monitoring tasks, and environment setups.

## 📂 File Operations
### > Create a File
```bash
touch first_script.sh
```
Creates an empty file with `.sh` extension.

### > List Files & Folders
```bash
ls
ls -ltr
```
- `ls`: Lists files/folders.
- `ls -ltr`: Lists with timestamps, permissions, and ownership.

## 📘 Command Reference
### > MAN Command
```bash
man ls
man touch
```
Shows manual/help for any command with usage and options.

## ✍️ Editing Files
### > Using vi/vim
```bash
vi first_script.sh
```
- Press `i` → Insert mode.
- Save & quit: `Esc :wq!`
- Quit without saving: `Esc :q!`

## 🔑 Touch command vs VI command
- **touch**: Creates empty files (used in automation).
- **vim/vi**: Creates and opens files for editing.
- Automation prefers `touch` since `vim` is interactive.

## 📋 Copying Content
- Double‑click text in terminal → auto‑copies.
- Paste with `Ctrl+V` (Windows) or `Cmd+V` (Mac).

## ⚡ Shebang OR Hash-Bang (`#!/bin/bash`)
- First line in scripts:
```bash
#!/bin/bash
```
- Defines which shell executes the script.
- Common options: `bash`, `sh`, `ksh`, `dash`.
- **Best practice:** Always use `#!/bin/bash` for consistency.

## 🌀 Shell Variants
- **bash**: Most widely used, modern, easier syntax.
- **ksh**: Older, less common now.
- **dash**: Lightweight, sometimes default for `/bin/sh` in Ubuntu.
- **sh**: Historically linked to bash, but now may link to dash → scripts can break.

## 🖊️ Insert Mode
- In `vi/vim`, press `i` to enter insert mode.
- Bottom‑left shows `-- INSERT --`.

## 📜 Executing a Shell Script
```bash
chmod +x first_script.sh
./first_script.sh
```
- `chmod +x`: Makes script executable.
- `./script.sh`: Runs the script.

## ✅ Commands Learned Today
- `touch` → Create files.
- `ls` → List files/folders.
- `man` → Manual/help.
- `vi/vim` → Edit files.
- `cat` → Print file contents.
- `chmod` → Change permissions.
- `echo` → Print text in scripts.

## 🚀 Key Takeaway

- Shell scripting is the backbone of DevOps automation.  
- Day 9 focused on **file operations, editing, shebang usage, and execution basics** — the foundation for writing scalable automation scripts.
---
