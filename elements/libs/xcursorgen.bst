kind: meson

sources:
- kind: tar
  url: xorg:xcursorgen-1.0.9.tar.xz
  ref: 0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sed.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:components/libpng.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-x11.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-xcursor.bst
