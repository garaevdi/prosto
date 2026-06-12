kind: import

sources:
- kind: local
  path: files/boot-keys/import-pubring.pgp

runtime-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst

config:
  target: /usr/lib/systemd

public:
  bst:
    overlap-whitelist:
    - /usr/lib/systemd/import-pubring.pgp
