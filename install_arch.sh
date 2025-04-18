#1° to run
#connect to network
echo 'connect to network'
iwctl

#part disk
echo 'part disk'
cfdisk

#format disks
echo 'format disks'
mkfs.ext4 /dev/sda3 && mkswap /dev/sda2 && mkfs.fat -F 32 /dev/sda1 && echo "Ok(format disks)" || exit

#mount disks
echo 'mount'
mount /dev/sda3 /mnt && mount --mkdir /dev/sda1 /mnt/boot && swapon /dev/sda2 && echo "Ok(mount)" || exit

#Installing packages
echo 'installing packages' 
pacstrap -K /mnt base linux linux-firmware vim intel-ucode sof-firmware networkmanager man-db man-pages texinfo git && echo 'Ok(installing packages)' || exit


cp charch_arch.sh sys_units.sh user_packages.sh /mnt/ && genfstab -U /mnt >> /mnt/etc/fstab && arch-chroot /mnt || exit 
