kind: meson

sources:
- kind: git_repo
  url: elementary_github:wingpanel.git
  track: '*.*.*'
  exclude:
  - '*-debian'
  # Use latest gtk3 commit for now
  ref: cd4852e3a28fa5b14dc2ea88810a4754d7e1d226
- kind: patch
  path: patches/wingpanel/mutter50-support.patch

build-depends:
- gnome-build-meta.bst:sdk/vala.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
runtime-depends:
- libs/stylesheet.bst
- libs/icons.bst
depends:
- libs/granite.bst
- system/gala.bst
- gnome-build-meta.bst:core/mutter.bst
- gnome-build-meta.bst:sdk/libgee.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/hicolor-icon-theme.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
