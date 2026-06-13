kind: manual

sources:
- kind: local
  path: files/boot-keys/DB.key
- kind: local
  path: files/boot-keys/DB.crt

build-depends:
- filename:
  - os/efi-keys.bst
  - os/replace-signed-systemd-boot.bst
  - os/deps/shim.bst
  strict: true
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sbsigntools.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  # UEFI secure boot keys
  - |
    mkdir -p '%{install-root}/efi/loader/keys/auto'
    for key in PK KEK DB; do
      cp "%{datadir}/efi-keys/${key}-mic.auth" "%{install-root}/efi/loader/keys/auto/${key}.auth"
    done

  - |
    mkdir -p '%{install-root}/efi/loader/keys/private'
    for key in PK KEK DB; do
      cp "%{datadir}/efi-keys/${key}.auth" "%{install-root}/efi/loader/keys/private/${key}.auth"
    done

  - mkdir -p %{install-root}/efi/EFI/
  - cp -rT /efi/EFI %{install-root}/efi/EFI

  # systemd-boot config file
  - mkdir -p %{install-root}/efi/loader
  - |
    cat <<EOF >%{install-root}/efi/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    EOF

  - |
    install -Dm644 "%{indep-libdir}/systemd/boot/efi/systemd-bootx64.efi" "%{install-root}/efi/EFI/systemd/systemd-bootx64.efi"

  # Sign and install shim as default bootloader
  - |
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/efi/EFI/io.github.garaevdi.prosto/shimx64.efi" "/efi/EFI/io.github.garaevdi.prosto/shimx64.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/efi/EFI/io.github.garaevdi.prosto/mmx64.efi" "/efi/EFI/io.github.garaevdi.prosto/mmx64.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/efi/EFI/BOOT/fbx64.efi" "/efi/EFI/BOOT/fbx64.efi"
    cp "%{install-root}/efi/EFI/io.github.garaevdi.prosto/mmx64.efi" "%{install-root}/efi/EFI/BOOT/mmx64.efi"
    cp "%{install-root}/efi/EFI/io.github.garaevdi.prosto/shimx64.efi" "%{install-root}/efi/EFI/BOOT/BOOTX64.EFI"
