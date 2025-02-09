# Jetpack 6.2 L4T 36.4.3

- Author: Otis B.C. Chung



This repository provides tools to build and flash the kernel image, out-of-tree modules, and DTBs to the Jetson Orin Nano Developer Kit.

It also applies the official patches.



## Get Started

### Download All Files

```bash
./download_all.sh
```



### Setup the Build Environment

```bash
./setup_build_env.sh
```



### Compile All

```bash
./compile_kernel.sh
```



### Flash to Jetson Orin Nano Dev. Kit

```bash
./flash_jetson_orin_nano_nvme.sh
```



## Official Patches

We include some official patches in this repository.



### ExFAT Filesystem Issue

Ensure that you have completed [setting up the build environment](#Setup-the-Build-Environment), then run the following command:

```bash
./add_exfat.sh
```

Finally, [compile everything](#Compile-All) and then [flash](#Flash-to-Jetson-Orin-Nano-Dev.-Kit) it to your device.



## Enable Wireguard and IPTables (Experimental)

Ensure that you have completed [setting up the build environment](#Setup-the-Build-Environment), then run the following command:

```bash
./enable_kernel_modules.sh
```

This configuration includes the [exFAT](#ExFAT-Filesystem-Issue).

Finally, [compile everything](#Compile-All) and then [flash](#Flash-to-Jetson-Orin-Nano-Dev.-Kit) it to your device.



### GPIO Issue

Ensure that you have completed [setting up the build environment](#Setup-the-Build-Environment), then run the following command:

```bash
./modify_pinctrl.sh
./apply_dtsi_changes.sh
```

Finally, [compile everything](#Compile-All) and then [flash](#Flash-to-Jetson-Orin-Nano-Dev.-Kit) it to your device.



## Configure Your Own Kernel Modules

You can configure your custom kernel modules using `make menuconfig` (also known as `nconfig`).

```bash
cd Linux_for_Tegra/source/kernel/kernel-jammy-src
make ARCH=arm64 O=$(pwd) nconfig
```

After completing the configuration, press **F6** to save your configuration file. Then, replace the contents of the saved file with `Linux_for_Tegra/source/kernel/kernel-jammy-src/arch/arm64/configs/defconfig`.



## Notes for the Developer

Here is the block for testing. Not sure for work.



### defconfig_v1

Add the following modules from the `defconfig_default_after_menuconfig`

```
File systems  --->
	DOS/FAT/EXFAT/NT Filesystems  --->
		<*> exFAT filesystem support
		<*> NTFS Read-Write file system support
```

The following highlights the differences before and after applying the changes.

```
❯ diff defconfig_default_after_menuconfig defconfig_v1
8728c8728,8729
< # CONFIG_EXFAT_FS is not set
---
> CONFIG_EXFAT_FS=y
> CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
8732c8733,8736
< # CONFIG_NTFS3_FS is not set
---
> CONFIG_NTFS3_FS=y
> # CONFIG_NTFS3_64BIT_CLUSTER is not set
> # CONFIG_NTFS3_LZX_XPRESS is not set
> # CONFIG_NTFS3_FS_POSIX_ACL is not set
```

