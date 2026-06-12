kind: meson

sources:
- kind: local
  path: files/os-release

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
