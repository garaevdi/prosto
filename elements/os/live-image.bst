kind: script

build-depends:
- gnome-build-meta.bst:freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/jq.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/systemd.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/dosfstools.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/mtools.bst
- gnome-build-meta.bst:freedesktop-sdk.bst:components/util-linux.bst
- gnome-build-meta.bst:gnomeos-deps/libisoburn.bst
- gnome-build-meta.bst:gnomeos/repart-config-iso.bst
- filename: os/usr/image.bst
  config:
    location: '/usr-image'
- filename: os/signed-boot.bst
  config:
    location: '/sysroot'
- filename: os/signed-boot-common.bst
  config:
    location: '/sysroot'
- filename: os/os-release.bst
  config:
    location: '/sysroot'

variables:
  repart-seed: affd51e3-7a3b-4078-9a80-0baf91fb7756

config:
  commands:
  - mkdir -p definitions
  - |
    cp /usr/lib/repart.iso.d/*.conf definitions/

  - |
    # Let's make a removable media ESP. We need to remove the
    # fallback. See
    # https://github.com/rhboot/shim/blob/main/README.fallback

    # BOOT/BOOTX64.EFI will boot instead
    rm -rf /sysroot/efi/EFI/io.github.garaevdi.prosto
    # remove the fallback so we do not register boot entries
    rm /sysroot/efi/EFI/BOOT/fb*.efi
    # remove MOK manager so we do not write MOKs
    rm /sysroot/efi/EFI/BOOT/mm*.efi

    # The iso should never enroll secure boot keys
    rm -rf /sysroot/efi/loader/keys

  - |
    mkdir -p /var/tmp

  - |
    mkdir -p /build

  - |
    mv /usr-image/mini.usr.raw /sysroot/
    mv /usr-image/mini.usr-verity.raw /sysroot/

  - |
    usr_uuid=$(jq -r '.[0].uuid' /usr-image/mini.repart.json)
    usr_verity_uuid=$(jq -r '.[1].uuid' /usr-image/mini.repart.json)
    cat <<EOF >>definitions/21-usr.conf
    UUID=${usr_uuid}
    EOF
    cat <<EOF >>definitions/20-usr-verity.conf
    UUID=${usr_verity_uuid}
    EOF
    cat definitions/20-usr-verity.conf
    cat definitions/21-usr.conf

  - |
    SYSTEMD_LOG_LEVEL=debug \
      systemd-repart \
        --sector-size=512 \
        --definitions=definitions \
        --empty=create \
        --dry-run=no \
        --size=auto \
        --discard=no \
        --offline=true \
        --no-pager \
        --seed=%{repart-seed} \
        --root=/sysroot \
        --split=true \
        /build/disk.raw \
        --json=pretty \
        >'/build/disk.repart.json'
    cat /build/disk.repart.json

  - |
    mkdir -p /build/iso-root

  - |
    mv /build/disk.esp.raw /build/iso-root/esp.img

  - |
    xorrisofs -o "/build/image.iso" /build/iso-root -partition_offset 480 -e /esp.img -no-emul-boot -boot-load-size 4 -efi-boot-part --efi-boot-image -sysid LINUX -publisher GARAEVDI -volid "PROSTO"

  - |
    dd if=/build/image.iso of=/build/disk.raw bs=2048 skip=16 count=496 seek=16 conv=notrunc

  - |
    esp_raw_size=$(jq -r '.[]|select(.type=="esp").raw_size' /build/disk.repart.json)
    esp_offset=$(jq -r '.[]|select(.type=="esp").offset' /build/disk.repart.json)
    skip=$(((${esp_offset}+${esp_raw_size})/512))
    # FIXME: not sure what this is and why it is 608*512 in size
    dd if=/build/image.iso of=/build/disk.raw bs=512 skip="${skip}" seek="${skip}" count=608 conv=notrunc

  - |
    mv /build/disk.raw "%{install-root}/disk.iso"
