kind: meson

sources:
- kind: tar
  url: elementary_github:plymouth-theme/archive/cc7199569f22fad9d3b6ed20a2dc3c41bcf1e29a/plymouth-theme-cc71995.tar.gz
  ref: f9f3aac642a8c62775a82f450fcb3b214e4d43da8a69c04523e66a992298edcf

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

runtime-depends:
- gnome-build-meta.bst:core-deps/plymouth.bst

variables:
  strip-binaries: ''
