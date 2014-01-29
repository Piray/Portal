#!/bin/sh

PORTAL_FRAMEWORK="../../library"

# install or update portal framework
THIS_DIR=`pwd`
if [ -d "$PORTAL_FRAMEWORK/vendor" ]; then
    cd $PORTAL_FRAMEWORK; composer update
else
    cd $PORTAL_FRAMEWORK; composer install
fi
cd $THIS_DIR

# create assets link
ln -snf ../../assets ../../public/assets/portal
ln -snf ../../library/vendor ../../public/assets/vendor

