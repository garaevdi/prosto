kind: meson

sources:
- kind: tar
  url: elementary_github:granite/archive/7.8.1/granite-7.8.1.tar.gz
  ref: bc8e7946ca091fdeeeebeb64db4e95d33a3ffb879048137f8d8a41ecd76caa3f

build-depends:
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:sdk/gobject-introspection.bst
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:sdk-deps/sassc.bst
- gnome-build-meta.bst:core-deps/libshumate.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- libs/stylesheet.bst
- gnome-build-meta.bst:sdk/gtk.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/appstream.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{bindir}/granite-7-demo"
        - "%{datadir}/applications/io.elementary.granite-7.demo.desktop"
        - "%{libdir}/libgranite-7.so"
