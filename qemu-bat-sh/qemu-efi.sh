#!/bin/bash

qemu-system-x86_64 \
-enable-kvm \
-cpu host \
-smp cores=1 \
-m 1048 \
-machine q35 \
-device intel-iommu \
-vga virtio \
-device e1000,netdev=wan \
-netdev user,id=wan \
-boot menu=on \
-L . \
-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
-hda /dev/sdc
