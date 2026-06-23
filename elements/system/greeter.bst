kind: meson
sources:
- kind: git_repo
  url: elementary_github:greeter.git
  track: '*.*.*'
  exclude:
  - '*-debian'
  # Use latest commit, which includes mutter 50 support until new release
  ref: 08235bfbb5cd15c6835e56bcca2e6aa7de1ae23e

build-depends:
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/desktop-file-utils.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
runtime-depends:
- libs/stylesheet.bst
- libs/icons.bst
- system/session-settings.bst
- system/wingpanel.bst
depends:
- libs/granite.bst
- system/deps/lightdm.bst
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:sdk/libhandy.bst
- gnome-build-meta.bst:core/gnome-desktop.bst
- gnome-build-meta.bst:core/mutter.bst
- gnome-build-meta.bst:core-deps/accountsservice.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/wayland.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/xorg-lib-x11.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/appstream.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
