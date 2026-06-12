kind: make

sources:
- kind: git_repo
  url: github:rhboot/shim.git
  track: '*.*'
  exclude:
  - '*-rc'
  - '16.0'
  ref: 617aed5d2538ac3d00fb4125ae36ba3fe2deb2f9
- kind: git_module
  path: gnu-efi
  url: github:rhboot/gnu-efi.git
  ref: dc7fd96f23d6b582416f672844362d776d175cf4
- kind: patch
  path: patches/shim/binutils_2_46.patch
- kind: local
  path: files/boot-keys/VENDOR.crt
  directory: boot-keys

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/git-minimal.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/openssl.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sbsigntools.bst

variables:
  os-keys-uuid: ac228a33-8c6b-42a2-98d5-706d33c47e9a
  notparallel: true

  make-args: >-
    DEFAULT_LOADER='\\EFI\\systemd\\systemd-bootx64.efi'
    EFIDIR=io.github.garaevdi.prosto
    ESPROOTDIR=efi/
    VENDOR_DB_FILE=boot-keys/VENDOR.esl

config:
  configure-commands:
  - openssl x509 -inform PEM -in boot-keys/VENDOR.crt -outform DER -out boot-keys/VENDOR.der
  - sbsiglist --owner '%{os-keys-uuid}' --type x509 boot-keys/VENDOR.der --output boot-keys/VENDOR.esl
