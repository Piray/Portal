#!/bin/sh

APACHE_CONFIG_PATH="/usr/local/etc/apache24/Includes"

PIRAY_PORTAL_CONFIG_FILE="Portal-hostname.conf Portal-modules.conf Portal-web.conf"
RESTART_APACHE="no"

for config_file in $PIRAY_PORTAL_CONFIG_FILE; do
    if [ -f "$APACHE_CONFIG_PATH/$config_file" ]; then
        rm -f $APACHE_CONFIG_PATH/$config_file
        echo "Remove $APACHE_CONFIG_PATH/$config_file"
        RESTART_APACHE="yes"
    else
        echo "$APACHE_CONFIG_PATH/$config_file is not exist"
    fi
done

if [ $RESTART_APACHE = "yes" ]; then
    echo "Deinstall Portal finished and restart Apache now ..."
    /usr/local/etc/rc.d/apache24 restart
fi
