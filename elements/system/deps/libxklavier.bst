kind: autotools

sources:
- kind: git_repo
  url: gnome_gitlab:Infrastructure/Mirrors/lorry-mirrors/gitlab_freedesktop_org/archived-projects/libxklavier.git
  track: 'libxklavier-*.*'
  ref: libxklavier-5.4-0-g396955bd2ba2db34a42b3807b03155fcc11dfe50

build-depends:
- gnome-build-meta.bst:sdk/glib.bst
- gnome-build-meta.bst:sdk/gtk-doc.bst
- gnome-build-meta.bst:sdk/gobject-introspection.bst
- gnome-build-meta.bst:core-deps/intltool.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/libxml2.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/iso-codes.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-x11.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-xcb.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

variables:
  conf-global: |
    --disable-static
