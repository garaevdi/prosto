kind: meson

sources:
- kind: tar
  url: elementary_github:stylesheet/archive/8.2.2/stylesheet-8.2.2.tar.gz
  ref: b5f016c9e7c528d18bb1fa7a405bc294af336a9d967574a66eb22e5fffb89aa9

build-depends:
- gnome-build-meta.bst:sdk-deps/sassc.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
