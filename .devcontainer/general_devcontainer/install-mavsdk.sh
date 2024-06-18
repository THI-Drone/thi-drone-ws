#!/bin/bash

ARCH=$(dpkg --print-architecture)

if [ "$ARCH" = "amd64" ]; then
   wget https://github.com/mavlink/MAVSDK/releases/download/v2.9.1/libmavsdk-dev_2.9.1_ubuntu22.04_amd64.deb -O /tmp/package.deb
elif [ "$ARCH" = "arm64" ]; then
   wget https://github.com/mavlink/MAVSDK/releases/download/v2.9.1/libmavsdk-dev_2.9.1_debian12_arm64.deb -O /tmp/package.deb
else
   echo "Unsupported architecture: $ARCH"
   exit 1
fi
# Install the package using dpkg
dpkg -i /tmp/package.deb
rm /tmp/package.deb