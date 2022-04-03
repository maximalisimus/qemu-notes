#!/bin/bash

# qemu-img create -f qcow2 arch.qcow 30G
#
# cp arch.qcow arch-snapshot.qcow

qemu-system-x86_64 \
-enable-kvm \
-cpu host \
-smp cores=1 \
-m 1024 \
-machine q35 \
-device intel-iommu \
-vga virtio \
-device e1000,netdev=wan \
-netdev user,id=wan \
-boot menu=on \
-cdrom archlinux-2021.11.01-x86_64.iso \
-hda arch.qcow \
-drive format=raw,file=hard.img
# -snapshot \
#-L . \
#-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
# -cpu host \
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
