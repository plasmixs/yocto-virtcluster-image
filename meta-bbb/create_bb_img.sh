#!/bin/sh

IMAGE_FILE=bb.img
BUILD_DIR=/Work/Contents/BuildArea/Yocto/Build/bb/tmp/deploy/images/a/

#Create an empty img file of size 500*1 MiB
dd if=/dev/zero of=$IMAGE_FILE bs=1M count=500

#Partition the image.
sfdisk --in-order --Linux --unit M $IMAGE_FILE << EOF
1,48,0xE,*
,,,-
EOF

#Command to display the two loop devices name under dev mapper.
kpartx -av $IMAGE_FILE

#Commands to format and create necessart partitions.
mkfs.vfat -F 16 /dev/mapper/loop0p1 -n boot
mkfs.ext4 /dev/mapper/loop0p2 -L rootfs
mkdir -p tmpmnt/boot
mkdir -p tmpmnt/rootfs
mount /dev/mapper/loop0p1 tmpmnt/boot/
mount /dev/mapper/loop0p2 tmpmnt/rootfs/

#Commands to copy files under boot
cp $BUILD_DIR/MLO tmpmnt/boot/
cp $BUILD_DIR/u-boot.img tmpmnt/boot/

#copy rootfs and modules.
tar xvfj $BUILD_DIR/virtcluster-sdk-bb.tar.bz2 -C tmpmnt/rootfs/
tar xvfz $BUILD_DIR/modules-bb.tgz -C tmpmnt/rootfs/

#cp $BUILD_DIR/zImage tmpmnt/rootfs/boot/
cp $BUILD_DIR/uImage tmpmnt/rootfs/boot/
mkdir -p tmpmnt/rootfs/boot/dtbs
cp $BUILD_DIR/zImage-omap3-beagle*.dtb tmpmnt/rootfs/boot/dtbs/
#cp $BUILD_DIR/zImage-omap3-beagle*.dtb tmpmnt/rootfs/boot/

#Done with all transfers. unmount fs.
sync
ls tmpmnt/boot

umount tmpmnt/rootfs 
umount tmpmnt/boot 
#This will delete the loop mounts dev mappers.
kpartx -dv bb.img 
