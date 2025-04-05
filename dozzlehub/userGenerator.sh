#!/bin/bash
set -e

# Benutzer interaktiv nach Benutzernamen und Passwort fragen
read -p "Bitte Benutzername eingeben: " USERNAME
read -sp "Bitte Passwort eingeben: " PASSWORD
echo ""

# Erzeuge SHA-256-Hash des Passworts
HASH=$(echo -n "$PASSWORD" | openssl dgst -sha256 | awk '{print $2}')

echo "Erzeugter SHA-256 Hash: $HASH"

# Erstelle die users.yml Datei im gewünschten Format
cat <<EOF > users.yml
users:
  ${USERNAME}:
    email:
    name: ${USERNAME}
    password: ${HASH}
    filter:
EOF

echo "Die Datei users.yml wurde generiert:"
cat users.yml