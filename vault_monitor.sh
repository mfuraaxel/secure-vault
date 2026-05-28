#!/usr/bin/env bash 

VAULT_DIR="$HOME/secure_vault"
REPORT="$VAULT_DIR/vault_report.txt"

> "$REPORT"

for file in "$VAULT_DIR"/*; do
    perms=$(stat -c "%a" "$file")
    size=$(stat -c "%s" "$file")
    modified=$(stat -c "%y" "$file")
    name=$(basename "$file")

    {
        echo "File: $name"
        echo "Size: $size bytes"
        echo "Last Modified: $modified"
        echo "Permissions: $perms"

        if [[ "$perms" -gt 644 ]]; then
            echo "SECURITY RISK DETECTED"
        fi

        echo "----------------------------"
    } >> "$REPORT"
done

echo " Vault report created at: $REPORT"
