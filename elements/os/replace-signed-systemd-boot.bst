kind: manual

sources:
- kind: local
  path: files/boot-keys/VENDOR.key
- kind: local
  path: files/boot-keys/VENDOR.crt

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sbsigntools.bst
depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - sbsign --key VENDOR.key --cert VENDOR.crt --output "systemd-bootx64.efi" "%{indep-libdir}/systemd/boot/efi/systemd-bootx64.efi"
  install-commands:
  - install -Dm644 -t "%{install-root}%{indep-libdir}/systemd/boot/efi" "systemd-bootx64.efi"

public:
  bst:
    overlap-whitelist:
    - "%{indep-libdir}/systemd/boot/efi/systemd-bootx64.efi"
