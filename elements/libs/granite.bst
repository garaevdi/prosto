kind: meson

sources:
- kind: tar
  url: elementary_github:granite/archive/6.2.0/granite-6.2.0.tar.gz
  ref: 067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5

build-depends:
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:sdk/gobject-introspection.bst
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- libs/stylesheet.bst
- gnome-build-meta.bst:sdk/gtk+-3.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/appstream.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{bindir}/granite-demo"
        - "%{datadir}/applications/io.elementary.granite.demo.desktop"
        - "%{libdir}/libgranite.so"
