kind: script

build-depends:
- os/generate-initramfs.bst
- os/initramfs/deps.bst
- os/initramfs/initial-scripts.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/fakecap.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:vm/prepare-image.bst

variables:
  sysroot-seed: 631ad25a-9dec-4cfb-abd4-865f979ff4ae

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap
  ZSTDFLAGS: -T%{max-jobs}
  DLOPEN_NOTE_IGNORE: archive:fido2:qrencode:ip4tc

environment-nocache:
- ZSTDFLAGS

config:
  commands:
  - mkdir -p /fakecap
  - |
    prepare-image.sh \
      --seed "%{sysroot-seed}" \
      --noroot --noboot >/dev/null

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    generate-initramfs /initramfs-root "${version}" "%{libdir}" "%{libdir}/systemd"

  - |
    (
      cd /initramfs-root
      find . -print0 | sort -z | cpio --reproducible --null -H newc -o --quiet | zstd ${ZSTDFLAGS} >/initramfs.img
    )

  - |
    mkdir -p /microcode/kernel/x86/microcode
    cat /usr/lib/firmware/amd-ucode/microcode_amd*.bin >/microcode/kernel/x86/microcode/AuthenticAMD.bin
    cp /usr/lib/firmware/intel-ucode/GenuineIntel.bin /microcode/kernel/x86/microcode/GenuineIntel.bin
    (
      cd /microcode
      find . -print0 | sort -z | cpio --reproducible --null -H newc -o --quiet >/microcode.img
    )

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    mkdir -p "%{install-root}/usr/lib/modules/${version}"
    cp /microcode.img "%{install-root}/usr/lib/modules/${version}/microcode.img"
    cp /initramfs.img "%{install-root}/usr/lib/modules/${version}/initramfs.img"
