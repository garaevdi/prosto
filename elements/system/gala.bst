kind: meson

sources:
- kind: tar
  url: elementary_github:gala/archive/8.5.1/gala-8.5.1.tar.gz
  ref: 901e785df2f1d38e81b7fe10762e277b835d69757e106c497096842dcc06534c

build-depends:
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/desktop-file-utils.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
runtime-depends:
- libs/icons.bst
- gnome-build-meta.bst:core/gnome-session.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/dbus.bst
depends:
- libs/granite.bst
- libs/granite-7.bst
- gnome-build-meta.bst:core/gnome-desktop.bst
- gnome-build-meta.bst:core/mutter.bst
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:sdk/libhandy.bst
- gnome-build-meta.bst:sdk/gsettings-desktop-schemas.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sqlite.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/appstream.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
