#!/usr/bin/env bash

if [ -z "${HOME_SERVER_URL}" ]; then
	echo "HOME_SERVER_URL not set, 'http://localhost:8008' by default"
	export HOME_SERVER_URL="http://localhost:8008"
fi

if [ -z "${IDENTITY_SERVER_URL}" ]; then
	echo "IDENTITY_SERVER_URL not set, 'http://localhost:8090' by default"
	export IDENTITY_SERVER_URL="http://localhost:8090"
fi


generate_config() {
cat <<EOF > /var/www/riot/config.json
{
    "default_hs_url": "${HOME_SERVER_URL}",
    "default_is_url": "${IDENTITY_SERVER_URL}",
    "disable_custom_urls": false,
    "disable_guests": false,
    "disable_login_language_selector": false,
    "disable_3pid_login": false,
    "brand": "Riot",
    "integrations_ui_url": "https://scalar.vector.im/",
    "integrations_rest_url": "https://scalar.vector.im/api",
    "integrations_jitsi_widget_url": "https://scalar.vector.im/api/widgets/jitsi.html",
    "bug_report_endpoint_url": "https://riot.im/bugreports/submit",
    "features": {
        "feature_groups": "labs",
        "feature_pinning": "labs"
    },
    "default_federate": true,
    "default_theme": "dark",
    "roomDirectory": {
        "servers": [
            "${HOME_SERVER_URL}"
        ]
    },
    "welcomeUserId": "@riot-bot:matrix.org",
    "piwik": false,
    "enable_presence_by_hs_url": {
        "${HOME_SERVER_URL}": false
    },
    "settingDefaults": {
        "promptBeforeInviteUnknownUsers": false
    }
}

EOF
}

generate_config

exec "$@"
