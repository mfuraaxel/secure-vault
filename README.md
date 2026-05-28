# Secure Vault

A collection of Bash scripts for managing a local secure vault — storing secrets, logging activity, auditing file permissions, and controlling access on a Unix/Linux system.

---

## Project Structure

```
secure_vault/
├── keys.txt        # Stores access keys
├── secrets.txt     # Stores secret entries
├── logs.txt        # Stores log entries
└── vault_report.txt # Auto-generated audit report
```

---

## Scripts

### 1. `setup_vault.sh` — Initialize the Vault
Sets up the secure vault directory and creates the three core files (`keys.txt`, `secrets.txt`, `logs.txt`) with welcome messages.

**Usage:**
```bash
bash setup_vault.sh
```

---

### 2. `vault_menu.sh` — Interactive Vault Menu
A looping menu interface for interacting with the vault. Supports:

| Option | Action |
|--------|--------|
| 1 | Add a secret to `secrets.txt` |
| 2 | Update an existing secret (find & replace) |
| 3 | Add a timestamped log entry to `logs.txt` |
| 4 | Attempt to access keys (returns ACCESS DENIED) |
| 5 | Exit the vault |

**Usage:**
```bash
bash vault_menu.sh
```

---

### 3. `update_permissions.sh` — File Permission Manager
Interactively update file permissions for each vault file. Shows current permissions, prompts for changes, and applies secure defaults if no input is given.

| File | Default Permission |
|------|--------------------|
| `keys.txt` | `600` (owner read/write only) |
| `secrets.txt` | `640` (owner read/write, group read) |
| `logs.txt` | `644` (owner read/write, others read) |

**Usage:**
```bash
bash update_permissions.sh
```

---

### 4. `audit_vault.sh` — Vault Audit Report
Scans all files in the vault and generates a report (`vault_report.txt`) listing each file's name, size, last modified date, and permissions. Flags any file with permissions above `644` as a **SECURITY RISK**.

**Usage:**
```bash
bash audit_vault.sh
```

**Sample output in `vault_report.txt`:**
```
File: secrets.txt
Size: 128 bytes
Last Modified: 2026-05-27 14:32:01
Permissions: 640
----------------------------
```

---

## ⚙️ Requirements

- Unix/Linux or macOS environment
- Bash 4+
- `stat`, `grep`, `sed`, `chmod` (standard on most systems)

---

## Getting Started

```bash
# 1. Initialize the vault
bash setup_vault.sh

# 2. Set secure permissions
bash update_permissions.sh

# 3. Use the vault interactively
bash vault_menu.sh

# 4. Run an audit anytime
bash audit_vault.sh
```

---

## Security Notes

- `keys.txt` is restricted to owner-only access (`600`) by default
- Any file with permissions above `644` will trigger a warning in the audit report
- The "Access Keys" menu option is intentionally locked (`ACCESS DENIED`)
