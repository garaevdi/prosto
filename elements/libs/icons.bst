kind: meson

sources:
- kind: tar
  url: elementary_github:icons/archive/8.2.0/icons-8.2.0.tar.gz
  ref: 22b235d796d374b22cade7183f9acb8584a551fecd865927a9f0e6562ed67392

build-depends:
- libs/xcursorgen.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
depends:
- gnome-build-meta.bst:sdk/librsvg.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
