#!/usr/bin/env sh

set -e

if [ -z "$FIREFOX_VERSION" ]; then
    echo "Set FIREFOX_VERSION environment variable." >&2
    exit 1
fi

# Remove existing Firefox files
rm -rf /opt/firefox

# Download Firefox tarball
FIREFOX_DOWNLOAD_URL="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2"
curl -sSL "$FIREFOX_DOWNLOAD_URL" -o /tmp/firefox.tar.bz2

# Extract tarball
tar -C /opt -xjf /tmp/firefox.tar.bz2

# Remove bz2 archive
rm /tmp/firefox.tar.bz2

# Create symlink to Firefox bin
mv /opt/firefox "/opt/firefox-$FIREFOX_VERSION"
ln -fs "/opt/firefox-$FIREFOX_VERSION/firefox" /usr/bin/firefox
