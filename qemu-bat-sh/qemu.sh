#!/bin/bash

# qemu-img create -f qcow2 hard.qcow 30G
# -o subformat=fixed
# -o subformat=dynamic
#
# qemu-img resize disk.qcow2 +10G
# Please resize into disk.qcow2 and before command:
# qemu-img resize --shrink disk.qcow2 -10G
#
# qemu-system-x86_64 -device help > device.txt
# qemu-system-x86_64 -cpu help > cpu.txt
#

qemu-system-x86_64 \
-enable-kvm \
-cpu host \
-smp cores=1 \
-m 2048 \
-machine q35 \
-device intel-iommu \
-vga virtio \
-device e1000,netdev=wan \
-netdev user,id=wan \
-boot menu=on \
-hda hard.qcow
#-cdrom ./Disk-Image.iso \
#-drive format=raw,file=raw.img
# -snapshot \

#-L . \
#-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
# -cpu host \
# или
#-drive file=OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on

#
#-hda hard.qcow
#
#-fda file
#-fdb file
# or
# -drive file=file,index=0,if=floppy
# -drive file=file,index=1,if=floppy
#
#-hda file
#-hdb file
#-hdc file
#-hdd file
#
# or
# qemu -drive file=file,index=0,media=disk
# qemu -drive file=file,index=1,media=disk
# qemu -drive file=file,index=2,media=disk
# qemu -drive file=file,index=3,media=disk
#



#-hda /dev/sdX
#-hda ubuntu.qcow
#-drive format=raw,file=raw.img
#-drive format=vmdk,file=disk.vmdk
#-drive format=vhdx,file=disk.vhdx
#-drive format=vpc,file=image_vhd.vhd
#-drive format=vdi,file=image_vdi.vdi

#
# -cdrom
# or
# -drive file=file,index=2,media=cdrom
#
# CDROM slave ide0
# -drive file=file,if=ide,index=1,media=cdrom
#
# Empty CDROM
# -drive if=ide,index=1,media=cdrom
#
# SCSI ID 6 buss 0
# -drive file=file,if=scsi,bus=0,unit=6
#
# Windows 
# -hda \\.\PhysicalDrive1
#



#
# -usb --device usb-host,vendorid=0x125f,productid=0xdb8a
#

#
# -smb dir
# 10.0.2.4 smbserver
# add to C:\WINDOWS\LMHOSTS on Windows 9x/Me or C:\WINNT\SYSTEM32\DRIVERS\ETC\LMHOSTS on Windows NT/2000.
# \\smbserver\qemu
#
# HOST
# /usr/sbin/smbd
# 


# -device e1000,netdev=wan \
# -netdev user,id=wan,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80,hostfwd=tcp::4443-:443 \

#-device e1000,netdev=wan \
#-netdev user,id=wan \

# Bridge
#-netdev bridge,br=br0,id=wan \
#-device virtio-net-pci,netdev=wan \

# $ sudo sysctl net.ipv4.ip_forward=1
# $ sudo ip link add name br0 type bridge
# $ sudo ip link set br0 up
# $ sudo ip link set enp3s0 master br0
# $ sudo bridge link
# $ sudo ip addr add 192.168.0.120/24 dev br0
# $ sudo ifconfig br0 broadcast 192.168.0.255
# $ sudo ifconfig br0 mtu 1000
# $ sudo ip route add 192.168.0.120 via 192.168.0.1
# $ sudo route add default gw 192.168.0.1 br0
# $ sudo mkdir -p /etc/qemu/
# $ sudo nano /etc/qemu/bridge.conf
# allow br0
#
# $ sudo rm -rf /etc/qemu/bridge.conf
# $ sudo ip link set enp3s0 nomaster
# $ sudo ip link set br0 down
# $ sudo route del default gw 192.168.0.1 br0
# $ sudo ip route del 192.168.0.120 via 192.168.0.1
# $ sudo ip link delete br0 type bridge


# dd if=/dev/zero of=raw.img bs=1M count=1024
# mkfs -t ext4 raw.img
# mkdir -p ./disk
# sudo mount -t auto -o loop raw.img ./disk
# sudo chown -R mikl:users ./disk
# sudo chmod -R 777 ./disk
# sudo chown root:root ./disk/lost+found
# sudo chmod 0700 ./disk/lost+found
# sudo umount -l ./disk



# mkdir -p script && 7z x image.iso -o./script/ && rm -rf && ./script/[SYS] ./script/lost+found && tar -czf archive.tar.gz script/ && rm -rf ./script
# mkdir -p temp && mv image.iso ./temp/ && cd ./temp && 7z x image.iso && 7z a '-x!image.iso' '-x![SYS]' '-x!lost+found' -t7z -mx7 ../archive.7z && mv image.iso ../ && cd ../ && rm -rf ./temp/
# 7z a '-x!disk/[SYS]' '-x!disk/lost+found' -t7z -mx7 archive.7z ./disk
#  cd ./disk && 7z a '-x![SYS]' '-x!lost+found' -t7z -mx7 ../archive.7z && cd ../




#
# dd if=/dev/zero of=raw.img bs=4096k count=640
# parted -s raw.img print
#
# parted -s raw.img mklabel msdos
# or
# parted -s raw.img mklabel gpt
#
# parted -s raw.img mkpart primary ntfs 1MiB 100% 
#
# EFI Part:
# parted -s DEVICE mkpart ESP fat32 1MiB 513MiB
# parted -s DEVICE set 1 boot on
# parted -s raw.img print
#



#
# sudo pacman -S nbd ntfs-3g dosfstools --noconfirm
# sudo modprobe nbd
#
# sudo qemu-nbd -c /dev/nbd0 ./raw.img
#
# VDI, VHD, VMDK, VHDX, RAW
# cfdisk, cgdisk, gparted, parted
#
# lsblk -o NAME,MODEL,TYPE,FSTYPE,SIZE,MOUNTPOINT /dev/nbd0
# mkfs -t ntfs /dev/nbd0p1
#
# sudo qemu-nbd -d /dev/nbd0
#
# parted -s raw.img print
#
# raw(img) vpc(vhd) vdi(vdi) vhdx(vhdx) qcow2(qcow)
# qemu-img convert -p -f raw -O vdi raw.img raw_vdi.vdi
#
# qemu-img convert -p -f raw -O vpc raw.img raw_vhd.vhd
#
# Example:
# qemu-img create -f vpc -o size=4G ./image_vhd.vhd
# sudo qemu-nbd -c /dev/nbd0 ./image_vhd.vhd
# parted -s /dev/nbd0 mklabel msdos
# parted -s /dev/nbd0 mkpart primary ntfs 1MB 2561MB
# parted -s /dev/nbd0 mpart primary ext4 2562MB 100%
# sudo qemu-nbd -d /dev/nbd0
# sudo qemu-nbd -c /dev/nbd0 ./image_vhd.vhd
# mkfs -t ntfs /dev/nbd0p1
# mkfs -t ext4 /dev/nbd0p2
# sudo qemu-nbd -d /dev/nbd0
# sudo qemu-nbd -c /dev/nbd0 ./image_vhd.vhd
# lsblk -o NAME,MODEL,TYPE,FSTYPE,SIZE,MOUNTPOINT /dev/nbd0
# parted -s /dev/nbd0 print
# id -g `$whoami`
# id -u `$whoami`
# sudo mount -t auto -o,rw,gid=985,uid=1000 /dev/nbd0p1 ./disk
# sudo umount -l ./disk
# sudo qemu-nbd -d /dev/nbd0
#





# Create Snapshot
# qemu-img snapshot -c snapshotName vmpath/disk.qcow2

# List Snapshot
# qemu-img snapshot -l vmpath/disk.qcow2

# Restore Snapshot
# qemu-img snapshot -a snapshotName vmpath/disk.qcow2

# Delete Snapshot
# qemu-img snapshot -d snapshotName vmpath/disk.qcow2

# Variant 2.
# qemu-img create -f qcow2 -F qcow2 -b vmpath/disk.qcow2 diffDisk.qcow2
# qemu-system-x86_64 -m 1G -drive file=vmpath/diffDisk.qcow2,media=disk
# qemu-system-x86_64 -m 1G -drive file=vmpath/disk.qcow2 ,media=disk
# rm vmpath/diffDisk.qcow2







# -netdev user,id=lan,restrict=off: создает виртуальный сетевой интерфейс с именем lan и типом user, который позволяет виртуальной машине общаться с внешним миром через сетевой стек хоста. Опция restrict=off означает, что нет ограничений на подключения входящих и исходящих соединений;
# -netdev socket,id=sock,connect=<IP>:443: создает сетевой интерфейс типа socket с именем sock, который позволяет подключиться к удаленному серверу по указанному IP-адресу и порту 443;
# -netdev hubport,id=port-lan,hubid=0,netdev=lan: добавляет порт к виртуальному хабу (с hubid=0), который связан с виртуальным сетевым интерфейсом lan;
# -netdev hubport,id=port-sock,hubid=0,netdev=sock: аналогично предыдущему добавляет еще один порт к тому же виртуальному хабу, связанный с виртуальным сетевым интерфейсом sock;
# -nographic: запускает QEMU без графического интерфейса, используя консоль для вывода.











