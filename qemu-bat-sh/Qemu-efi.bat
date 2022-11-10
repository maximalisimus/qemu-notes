@cd/d "%~dp0"
@echo off
SET PATH=C:\Program Files\qemu\;%PATH%
qemu-system-x86_64 ^
-smp cores=1 ^
-m 1024 ^
-machine q35 ^
-device intel-iommu ^
-vga virtio ^
-device e1000,netdev=wan ^
-netdev user,id=wan ^
-boot menu=on ^
-L . ^
-drive file=OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on ^
-hda \\.\PhysicalDrive1
