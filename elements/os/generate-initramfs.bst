kind: manual

sources:
- kind: local
  path: files/generate-initramfs

depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

runtime-depends:
- gnome-build-meta.bst:gnomeos-deps/python3-zstd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/python3-pyelftools.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/gcc.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/lvm2.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - install -Dm755 generate-initramfs.sh "%{install-root}%{bindir}/generate-initramfs"
  - install -Dm755 -t "%{install-root}%{libexecdir}/generate-initramfs" copy-initramfs.py
  - install -Dm755 -t "%{install-root}%{libexecdir}/generate-initramfs" run-module.sh

  - |
    install -Dm755 -d "%{install-root}%{datadir}/generate-initramfs/modules"
    cp -rT modules "%{install-root}%{datadir}/generate-initramfs/modules"
