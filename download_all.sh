#!/bin/bash

set -euo pipefail

# Parse arguments
PARALLEL=false
DOWNLOAD=wget
for arg in "$@"; do
    case $arg in
        -p|--parallel)
            PARALLEL=true
            ;;
        *)
            echo "Unknown option: $arg" >&2
            ;;
    esac
done

if $PARALLEL; then
    sudo apt install -y axel
    DOWNLOAD="axel -n 10"
fi

$DOWNLOAD https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v3.0/toolchain/aarch64--glibc--stable-2022.08-1.tar.bz2
$DOWNLOAD https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v4.3/release/Jetson_Linux_r36.4.3_aarch64.tbz2
$DOWNLOAD https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v4.3/release/Tegra_Linux_Sample-Root-Filesystem_r36.4.3_aarch64.tbz2
$DOWNLOAD https://developer.nvidia.com/downloads/embedded/l4t/r36_release_v4.3/sources/public_sources.tbz2
