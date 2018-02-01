#!/usr/bin/env bash

if [ -z "${HOME_SERVER_URL}" ]; then
	echo "HOME_SERVER_URL not set, 'http://localhost:8008' by default"
	export HOME_SERVER_URL="http://localhost:8008"
fi

if [ -z "${IDENTITY_SERVER_URL}" ]; then
	echo "IDENTITY_SERVER_URL not set, 'http://localhost:8090' by default"
	export IDENTITY_SERVER_URL="http://localhost:8090"
fi

if [ -z "${BRAND}" ]; then
	echo "BRAND not set, 'Riot' by default"
	export BRAND="Riot"
fi

generate_config() {
cat <<EOF > /var/www/riot/config.json
{
    "default_hs_url": "${HOME_SERVER_URL}",
    "default_is_url": "${IDENTITY_SERVER_URL}",
    "brand": "${BRAND}",
    "integrations_ui_url": "https://scalar.vector.im/",
    "integrations_rest_url": "https://scalar.vector.im/api"

}
EOF
}

generate_config

exec "$@"
