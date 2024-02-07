#!/bin/sh

if [ -z "${HOME_SERVER_URL}" ]; then
	echo "HOME_SERVER_URL not set, 'http://localhost:8008' by default"
	export HOME_SERVER_URL="http://localhost:8008"
fi

if [ -z "${IDENTITY_SERVER_URL}" ]; then
	echo "IDENTITY_SERVER_URL not set, 'http://localhost:8090' by default"
	export IDENTITY_SERVER_URL="http://localhost:8090"
fi


generate_config() {
cat <<EOF > /app/config.json
{
    "default_server_config": {
        "m.homeserver": {
            "base_url": "${HOME_SERVER_URL}",
            "server_name": "${DOMAIN}"
        },
        "m.identity_server": {
            "base_url": "${IDENTITY_SERVER_URL}"
        }
    },
    "disable_custom_urls": false,
    "disable_guests": false,
    "disable_login_language_selector": false,
    "disable_3pid_login": false,
    "brand": "Element",
    "integrations_ui_url": "https://scalar.vector.im/",
    "integrations_rest_url": "https://scalar.vector.im/api",
    "integrations_widgets_urls": [
        "https://scalar.vector.im/_matrix/integrations/v1",
        "https://scalar.vector.im/api",
        "https://scalar-staging.vector.im/_matrix/integrations/v1",
        "https://scalar-staging.vector.im/api",
        "https://scalar-staging.riot.im/scalar/api"
    ],
    "default_country_code": "GB",
    "show_labs_settings": false,
    "features": {},
    "default_federate": true,
    "default_theme": "dark",
    "room_directory": {
        "servers": ["matrix.org"]
    },
    "enable_presence_by_hs_url": {
        "https://matrix.org": false,
        "https://matrix-client.matrix.org": false
    },
    "setting_defaults": {
        "breadcrumbs": true
    },
    "jitsi": {
        "preferred_domain": "meet.element.io"
    },
    "element_call": {
        "url": "https://call.element.io",
        "participant_limit": 8,
        "brand": "Element Call"
    },
    "map_style_url": "https://api.maptiler.com/maps/streets/style.json?key=fU3vlMsMn4Jb6dnEIFsx",
    "csp_extra_source": "${CSP_EXTRA_SOURCE}"
}
EOF
}

generate_config

exec "$@"
