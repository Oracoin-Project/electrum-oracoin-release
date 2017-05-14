#!/bin/bash
set -xeo pipefail
source build-config.sh
source helpers/build-common.sh
cp build-config.sh helpers
check_vars
$DOCKERBIN run --rm -it --privileged -e MKPKG_VER=${VERSION} -v $(pwd)/helpers:/root  -v $(pwd)/repo:/root/repo  -v $(pwd)/source:/opt/wine-electrum/drive_c/electrum-oracoin/ -v $(pwd):/root/electrum-oracoin-release oracoin/electrum-oracoin-winbuild:${VERSION} /root/build-binary $VERSION 
