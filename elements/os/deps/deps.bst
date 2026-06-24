kind: stack

depends:
- gnome-build-meta.bst:core/meta-gnome-core-os-services.bst
- gnome-build-meta.bst:sdk-platform.bst
- system/meta.bst
- libs/meta.bst

- system/systemd-presets.bst
- gnome-build-meta.bst:gnomeos-deps/preset-all.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:components/xdg-desktop-portal.bst
- gnome-build-meta.bst:core-deps/xdg-desktop-portal-gtk.bst

- gnome-build-meta.bst:core-deps/phodav.bst
- gnome-build-meta.bst:core-deps/dnsmasq.bst
- gnome-build-meta.bst:gnomeos-deps/disable-iscsi.bst
# - gnome-build-meta.bst:gnomeos-deps/flathub-config.bst
- gnome-build-meta.bst:gnomeos-deps/journald-config.bst
- gnome-build-meta.bst:gnomeos-deps/nm-connectivity-config.bst
# - gnome-build-meta.bst:gnomeos-deps/plymouth-gnome-theme.bst
- system/plymouth-theme.bst
- gnome-build-meta.bst:gnomeos-deps/spice-vdagent.bst
- gnome-build-meta.bst:gnomeos-deps/wpa-supplicant-config.bst
- gnome-build-meta.bst:gnomeos-deps/sysupdate-config.bst
- gnome-build-meta.bst:gnomeos-deps/pcrlock-config.bst
- gnome-build-meta.bst:gnomeos-deps/udev-hide-usr.bst
- gnome-build-meta.bst:gnomeos-deps/hidraw-udev.bst
- gnome-build-meta.bst:gnomeos-deps/vte-config.bst
- gnome-build-meta.bst:gnomeos-deps/ld-config.bst
- gnome-build-meta.bst:gnomeos-deps/modprobe-config.bst
- gnome-build-meta.bst:gnomeos-deps/debuginfod-config.bst

- gnome-build-meta.bst:gnomeos-deps/alsa-ucm-conf.bst
- gnome-build-meta.bst:gnomeos-deps/android-udev-rules.bst
- gnome-build-meta.bst:gnomeos-deps/bindfs.bst
- gnome-build-meta.bst:gnomeos-deps/fish.bst
- gnome-build-meta.bst:gnomeos-deps/fprintd.bst
- gnome-build-meta.bst:gnomeos-deps/nss-mdns.bst
- gnome-build-meta.bst:gnomeos-deps/opensc.bst
- gnome-build-meta.bst:gnomeos-deps/pam-pkcs11.bst
- gnome-build-meta.bst:gnomeos-deps/switcheroo-control.bst
- gnome-build-meta.bst:gnomeos-deps/uresourced.bst
- gnome-build-meta.bst:gnomeos-deps/zram-generator.bst
- gnome-build-meta.bst:core-deps/boltd.bst

- gnome-build-meta.bst:gnomeos-deps/ibus-anthy.bst
- gnome-build-meta.bst:gnomeos-deps/ibus-hangul.bst
- gnome-build-meta.bst:gnomeos-deps/ibus-libpinyin.bst
- gnome-build-meta.bst:gnomeos-deps/ibus-typing-booster.bst

- gnome-build-meta.bst:gnomeos-deps/NetworkManager-openconnect.bst
- gnome-build-meta.bst:gnomeos-deps/NetworkManager-openvpn.bst
- gnome-build-meta.bst:gnomeos-deps/NetworkManager-vpnc.bst

- gnome-build-meta.bst:gnomeos-deps/noto-cjk.bst
- gnome-build-meta.bst:gnomeos-deps/words.bst

- gnome-build-meta.bst:gnomeos-deps/mokutil.bst

# For gvfs
- gnome-build-meta.bst:gnomeos-deps/wsdd.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:components/pipewire-daemon.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/wireplumber.bst
- gnome-build-meta.bst:gnomeos-deps/noise-suppression-for-voice.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:vm/config/sudo.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:vm/mesa-default.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/bash-completion.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/bash-config.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/btrfs-progs.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/ccid.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/linux-firmware.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/man-db.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/open-iscsi.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/openssh-systemd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/rsync.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sof-firmware.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/steam-devices.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/wireless-regdb-bin.bst
- gnome-build-meta.bst:gnomeos-deps/iio-sensor-proxy.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:components/jq.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/less.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/nano.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/vim.bst
- gnome-build-meta.bst:gnomeos-deps/nano-default-editor.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:components/iproute2.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/iputils.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/usbutils.bst

- gnome-build-meta.bst:core-deps/systemd-hwdb.bst

- gnome-build-meta.bst:gnomeos-deps/nftables.bst
- gnome-build-meta.bst:gnomeos-deps/firewalld.bst

# Containers
- gnome-build-meta.bst:freedesktop-sdk.bst:components/podman.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/skopeo.bst
- gnome-build-meta.bst:gnomeos-deps/distrobox.bst
- gnome-build-meta.bst:gnomeos-deps/toolbox.bst

- gnome-build-meta.bst:freedesktop-sdk.bst:components/git.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/git-lfs.bst

- gnome-build-meta.bst:gnomeos-deps/uinput.bst
- gnome-build-meta.bst:gnomeos-deps/nvme-cli.bst
