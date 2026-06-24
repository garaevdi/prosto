kind: autotools

sources:
- kind: git_repo
  url: github:ubuntu/lightdm.git
  track: '*.*.*'
  ref: 1.32.0-0-g4b10d07b7bf87668a245b438b5ffc82e3956bd1c
- kind: local
  path: 'files/lightdm/lightdm.pam'
- kind: local
  path: 'files/lightdm/lightdm.rules'
- kind: local
  path: 'files/lightdm/lightdm.service'
- kind: local
  path: 'files/lightdm/lightdm-sysusers.conf'
- kind: local
  path: 'files/lightdm/lightdm-autologin.pam'
- kind: local
  path: 'files/lightdm/lightdm-tmpfiles.conf'

build-depends:
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
depends:
- system/deps/libxklavier.bst
- gnome-build-meta.bst:sdk/glib.bst
- gnome-build-meta.bst:sdk/gtk-doc.bst
- gnome-build-meta.bst:sdk/gobject-introspection.bst
- gnome-build-meta.bst:sdk/yelp-tools.bst
- gnome-build-meta.bst:core-deps/intltool.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/audit.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/linux-pam.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/libgcrypt.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-x11.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-xcb.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-xdmcp.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  conf-global: |
    --disable-static --disable-silent-rules --enable-gtk-doc --enable-libaudit --enable-introspection

# These files was taken from fedora's package
config:
  install-commands:
    (>):
    - mkdir -p %{install-root}%{sysconfdir}/pam.d
    - install -Dm644 -t %{install-root}%{sysconfdir}/pam.d lightdm.pam
    - install -Dm644 -t %{install-root}%{sysconfdir}/pam.d lightdm-autologin.pam

    - mkdir -p %{install-root}%{prefix}/lib/tmpfiles.d
    - install -Dm644 -t %{install-root}%{prefix}/lib/tmpfiles.d lightdm-tmpfiles.conf

    - mkdir -p %{install-root}%{prefix}/lib/sysusers.d
    - install -Dm644 -t %{install-root}%{prefix}/lib/sysusers.d lightdm-sysusers.conf

    - mkdir -p %{install-root}%{prefix}/lib/systemd/system
    - install -Dm644 -t %{install-root}%{prefix}/lib/systemd/system lightdm.service

    - mkdir -p %{install-root}%{datadir}/polkit-1/rules.d
    - install -Dm644 -t %{install-root}%{datadir}/polkit-1/rules.d lightdm.rules
