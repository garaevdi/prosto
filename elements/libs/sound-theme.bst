kind: meson

sources:
- kind: tar
  url: elementary_github:sound-theme/archive/1.1.0/sound-theme-1.1.0.tar.gz
  ref: ef1989edb2fa0a0db12392242bea0678018b9070f3f202bc1c915f80f0abf982

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- gnome-build-meta.bst:core-deps/intltool.bst
- gnome-build-meta.bst:core-deps/xdg-sound-theme.bst
