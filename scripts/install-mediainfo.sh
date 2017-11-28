#!/bin/sh

set -e

BUILD_DIR=$1
CACHE_DIR=$2
MEDIAINFO_VERSION="0.7.91"
ARCHIVE="mediainfo-${MEDIAINFO_VERSION}.tar.gz"

# config
echo "-----> Extract mediainfo"
mkdir -p "${BUILD_DIR}/vendor"
rm -rf "${BUILD_DIR}/vendor/mediainfo"
tar -xf "${ARCHIVE}" -C "${BUILD_DIR}/vendor"
chown -R node:node $BUILD_DIR
echo "-----> chmod +x mediainfo"
chmod +x "${BUILD_DIR}/vendor/mediainfo/mediainfo"

echo "-----> Exporting PATH and LIBRARY_PATH"
PROFILE_PATH="$BUILD_DIR/.profile.d/mediainfo.sh"
mkdir -p $(dirname $PROFILE_PATH)
echo 'export PATH="$PATH:$HOME/vendor/mediainfo"' >> $PROFILE_PATH
echo "-----> MEDIAINFO " $MEDIAINFO_VERSION " COMPLETED"