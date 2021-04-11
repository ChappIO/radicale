#!/bin/bash
set -eu

if [ ! -f /data/.htpasswd ]; then
  echo "No .htpasswd configuration found. Loading default admin user."
  htpasswd -Bbc -C 12 /data/.htpasswd admin admin
fi

python3 -m radicale \
  --config "" \
  --server-hosts 0.0.0.0:5232 \
  --storage-filesystem-folder /data \
  --auth-type htpasswd \
  --auth-htpasswd-filename /data/.htpasswd \
  --auth-htpasswd-encryption bcrypt \
  --logging-level info
