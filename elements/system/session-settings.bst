kind: meson
sources:
- kind: git_repo
  url: elementary_github:session-settings.git
  track: '*.*.*'
  # Use latest commit for now
  ref: 0a69481c20b73d7cd774e88e6fb043c52644e350

build-depends:
- gnome-build-meta.bst:sdk/glib.bst
- gnome-build-meta.bst:core/gnome-settings-daemon.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/desktop-file-utils.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
public:
  bst:
    split-rules:
      void:
      - '%{datadir}/cups/data/default-testpage.pdf'
      - '%{sysconfdir}/netplan/01-network-manager-all.yml'
      - '%{sysconfdir}/NetworkManager/conf.d/10-globally-managed-devices.conf'
