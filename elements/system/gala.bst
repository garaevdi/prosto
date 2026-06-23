kind: meson

sources:
- kind: git_repo
  url: elementary_github:gala.git
  track: '*.*.*'
  exclude:
  - '*-debian'
  # Use latest commit, so patches would apply cleanly
  ref: e65c91fd2507c7b0ae5359e369636277c3cc35b4
- kind: patch
  path: patches/gala/implement-greeter.patch

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
