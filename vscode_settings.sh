#!/bin/bash

TARGET_DIR="./Linux_for_Tegra/source/kernel/kernel-jammy-src/.vscode"

# Create the directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Write the JSON content to the file using a here-document
cat << 'EOF' > "$TARGET_DIR/c_cpp_properties.json"
{
    "configurations": [
        {
            "name": "Jetson Linux Kernel Module",
            "includePath": [
                "${workspaceFolder}/**",
                "${workspaceFolder}/../../../../l4t-gcc/aarch64--glibc--stable-2022.08-1/include",
                "${workspaceFolder}/include",
                "${workspaceFolder}/arch/arm64/include",
                "${workspaceFolder}/../../../../Linux_for_Tegra/rootfs/usr/src/linux-headers-5.15.148-tegra-ubuntu22.04_aarch64/3rdparty/canonical/linux-jammy/kernel-source/include",
                "${workspaceFolder}/../../../../Linux_for_Tegra/rootfs/usr/src/linux-headers-5.15.148-tegra-ubuntu22.04_aarch64/3rdparty/canonical/linux-jammy/kernel-source/arch/arm64/include/generated"
            ],
            "defines": [
                "__KERNEL__",
                "MODULE"
            ],
            "compilerPath": "${workspaceFolder}/../../../../l4t-gcc/aarch64--glibc--stable-2022.08-1/bin/aarch64-buildroot-linux-gnu-gcc",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "linux-gcc-arm64"
        }
    ],
    "version": 4
}
EOF

echo "c_cpp_properties.json has been created in: $TARGET_DIR"
