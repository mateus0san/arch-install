#connect to network
echo 'connect to network' || exit
iwctl

#part disk
echo 'part disk' || exit
cfdisk

#format disks
echo 'format disks' && sleep 2
mkfs.ext4 /dev/sda3 && mkswap /dev/sda2 && mkfs.fat -F 32 /dev/sda1 && echo "Ok(format disks)" || exit

#mount disks
echo 'mount' && sleep 2
mount /dev/sda3 /mnt && mout --mkdir /dev/sda1 /mnt/boot && swapon /dev/sda2 && echo "Ok(mount)" || exit

#Installing packages
echo 'installing packages' && sleep 2
pacstrap -K /mnt base linux linux-firmware vim intel-ucode sof-firmware networkmanager man-db man-pages texinfo && echo 'Ok(installing packages)' || exit

genfstab -U /mnt >> /mnt/etc/fstab && arch-chroot /mnt && echo 'everything is okay...' || exit
