kind: manual

sources:
- kind: local
  path: files/boot-keys/VENDOR.key
- kind: local
  path: files/boot-keys/VENDOR.crt
- kind: local
  path: files/boot-keys/tpm2-pcr-public.pem
- kind: local
  path: files/boot-keys/tpm2-pcr-private.pem
- kind: local
  path: files/boot-keys/fstab-tpm2-pcr-public.pem
- kind: local
  path: files/boot-keys/fstab-tpm2-pcr-private.pem

build-depends:
- os/os-release.bst
- filename: gnome-build-meta.bst:freedesktop-sdk.bst:components/linux.bst
  strict: true
- filename: os/initramfs.bst
  strict: true
- filename: os/usr/image.bst
  strict: true
  config:
    location: /usr-image
- gnome-build-meta.bst:freedesktop-sdk.bst:components/jq.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd-ukify.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/sbsigntools.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/tpm2-tss.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/util-linux.bst

variables:
  strip-binaries: ''
  kcmdline: >-
    rw
    mount.usrflags=ro
    mount.usrfstype=erofs
    lockdown=confidentiality
    systemd.firstboot=no

config:
  install-commands:
  - |
    set -x

    roothash=$(jq -r '(.[] | select(.type | match("^usr-.*-verity$"))).roothash' /usr-image/mini.repart.json)

    version="$(ls -1 /usr/lib/modules | head -n1)"
    mkdir -p "%{install-root}/efi/EFI/Linux/prosto_%{image-version}.efi.extra.d"

    cat <<EOF >sbat.txt
    sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
    uki,1,UKI,uki,1,https://www.freedesktop.org/software/systemd/man/systemd-stub.html
    EOF

    ukify build \
      --secureboot-private-key=VENDOR.key \
      --secureboot-certificate=VENDOR.crt \
      --cmdline="root=live:prosto" \
      --sbat=@sbat.txt \
      --output="%{install-root}/efi/EFI/Linux/prosto_%{image-version}.efi.extra.d/live.addon.efi"

    ukify build \
      --output "%{install-root}/efi/EFI/Linux/prosto_%{image-version}.efi" \
      --os-release=@/etc/os-release \
      --cmdline="%{kcmdline} usrhash=${roothash}" \
      --uname="${version}" \
      --pcr-private-key=tpm2-pcr-private.pem \
      --pcr-public-key=tpm2-pcr-public.pem \
      --phases="enter-initrd" \
      --pcrpkey=tpm2-pcr-public.pem \
      --pcr-private-key=fstab-tpm2-pcr-private.pem \
      --pcr-public-key=fstab-tpm2-pcr-public.pem \
      --phases="enter-initrd:leave-initrd" \
      --secureboot-private-key=VENDOR.key \
      --secureboot-certificate=VENDOR.crt \
      --linux="/boot/vmlinuz" \
      --initrd="/usr/lib/modules/${version}/initramfs.img" \
      --microcode=/usr/lib/modules/${version}/microcode.img
