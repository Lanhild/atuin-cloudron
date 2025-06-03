#!/bin/bash
set -eu

echo "==> Ensure directories"
mkdir -p /app/data/

if [[ ! -f /app/data/env.sh ]]; then
cat > /app/data/env.sh << EOF
# Add custom ENV configuraiton in this file.
EOF
fi

export ATUIN_HOST="0.0.0.0"
export ATUIN_PORT=3000
export ATUIN_OPEN_REGISTRATION=true
export ATUIN_DB_URI=${CLOUDRON_POSTGRESQL_URL}

source /app/data/env.sh

echo "==> Changing ownership"
chown -R cloudron:cloudron /app/data

echo "==> Starting Atuin server"
exec gosu cloudron:cloudron atuin server start