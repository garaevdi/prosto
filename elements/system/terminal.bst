kind: meson

sources:
- kind: tar
  url: elementary_github:terminal/archive/8.0.0/terminal-8.0.0.tar.gz
  ref: 42c51c28c82302cac152a773e717531a845a6eed091a9c54452919da7dc246aa

build-depends:
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- libs/granite-7.bst
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:sdk/libadwaita.bst
- gnome-build-meta.bst:core-deps/vte.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/libxml2.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
