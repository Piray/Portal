#!/bin/sh

APACHE_CONFIG_PATH="/usr/local/etc/apache24/Includes"

PIRAY_PORTAL_CONFIG_FILE="Portal-hostname.conf Portal-modules.conf Portal-web.conf"
RESTART_APACHE="no"

for config_file in $PIRAY_PORTAL_CONFIG_FILE; do
    if [ -d "$APACHE_CONFIG_PATH" ]; then
        cp -f $config_file $APACHE_CONFIG_PATH
        echo "Install $config_file to $APACHE_CONFIG_PATH/$config_file"
        RESTART_APACHE="yes"
    fi
done

if [ $RESTART_APACHE = "yes" ]; then
    echo "Install Portal finished and restart Apache now ..."
    /usr/local/etc/rc.d/apache24 restart
fi
