kind: stack

depends:
- gnome-build-meta.bst:gnomeos/repart-config.bst
- gnome-build-meta.bst:gnomeos/reload-sysext.bst
- gnome-build-meta.bst:gnomeos/confext.bst
- gnome-build-meta.bst:gnomeos/systemd-pcrlock-workaround.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:vm/config/useradd-default.bst
- os/deps/deps.bst
- os/initramfs/signed-modules.bst
- os/public-keys.bst
- os/replace-signed-systemd-boot.bst
- os/signed-boot-common.bst
- os/import-deployment-pub-key.bst
