#!/bin/bash

set -e -u

declare X_DEBIAN_MULTIARCH_TRIPLET=""

# * Environmental variables - doc - snapcraft.io
#   https://forum.snapcraft.io/t/environmental-variables/7983
# * Multiarch/Tuples - Debian Wiki
#   https://wiki.debian.org/Multiarch/Tuples
#   NOTE: Only consider Linux archs with the `released` status in Debian for now
case "${SNAP_ARCH}" in
    # These are the special cases
    amd64)
        X_DEBIAN_MULTIARCH_TRIPLET=x86_64-linux-gnu
    ;;
    armel)
        X_DEBIAN_MULTIARCH_TRIPLET=arm-linux-gnueabi
    ;;
    armhf)
        X_DEBIAN_MULTIARCH_TRIPLET=arm-linux-gnueabihf
    ;;
    arm64)
        X_DEBIAN_MULTIARCH_TRIPLET=aarch64-linux-gnu
    ;;
    ppc64el)
        X_DEBIAN_MULTIARCH_TRIPLET=powerpc64le-linux-gnu
    ;;
    # Consider rest of them not exceptions
    s390x \
    |*)
        X_DEBIAN_MULTIARCH_TRIPLET="${SNAP_ARCH}"-linux-gnu
    ;;
esac

echo ${X_DEBIAN_MULTIARCH_TRIPLET}
