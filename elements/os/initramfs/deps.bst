kind: stack

depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/btrfs-progs.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/cpio.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/dbus.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/fuse3.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/linux-firmware.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/shadow.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/tpm2-tss.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/tpm2-tools.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/tzdata.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/util-linux.bst
- gnome-build-meta.bst:gnomeos-deps/intel-ucode.bst
- gnome-build-meta.bst:gnomeos-deps/udev-hide-usr.bst
- gnome-build-meta.bst:gnomeos-deps/zram-generator.bst
- gnome-build-meta.bst:gnomeos/reload-sysext.bst
- gnome-build-meta.bst:gnomeos/confext.bst
- gnome-build-meta.bst:gnomeos/live.bst
- system/plymouth-theme.bst
- os/initramfs/signed-modules.bst
- os/os-release.bst
