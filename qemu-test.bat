@echo off
SET PATH=C:\Program Files\qemu\;%PATH%
SET PATH=C:\WSL-Win-7\ls-utils\;%PATH%
qemu-system-x86_64 ^
-smp cores=1 ^
-m 1024 ^
-machine q35 ^
-device intel-iommu ^
-vga virtio ^
-device e1000,netdev=wan ^
-netdev user,id=wan ^
-boot menu=on ^
-hda \\.\PhysicalDrive1

