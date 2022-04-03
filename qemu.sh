#!/bin/bash

# qemu-img create -f qcow2 arch.qcow 30G

qemu-system-x86_64 \
-enable-kvm \
-cpu host \
-smp cores=1 \
-m 1024 \
-machine q35 \
-device intel-iommu \
-vga virtio \
-hda arch.qcow \
-device e1000,netdev=wan \
-netdev user,id=wan,hostfwd=tcp::2222-:22 \
-L . \
-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on
# -cdrom archlinux-2021.08.01-x86_64.iso
# -boot d

# -bios /usr/share/edk2-ovmf/x64/OVMF_CODE.fd

# -drive format=raw,file=hard.img

# dd if=/dev/zero of=hard.img bs=1M count=1024
# mkfs -t ext4 hard.img
# mkdir -p ./raw
# sudo mount -t auto -o loop hard.img ./raw
# sudo chown mikl:users ./raw
# sudo chmod 777 ./raw
# sudo umount -l ./raw
# sudo rm -rf ./raw
# sudo mkdir -p ./disk
# sudo mount -t auto -o loop hard.img ./disk

# sudo umount -l ./disk
