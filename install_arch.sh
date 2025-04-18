#connect to network
echo 'connect to network' && sleep 2
iwctl

#part disk
echo 'part disk' && sleep 2
cfdisk

#format disks
echo 'format disks' && sleep 2
mkfs.ext4 /dev/sda3 && mkswap /dev/sda2 && mkfs.fat -F 32 /dev/sda1 && echo "Ok(format disks)" && sleep 2

#mount disks
echo 'mount' && sleep 2
mount /dev/sda3 /mnt && mout --mkdir /dev/sda1 /mnt/boot && swapon /dev/sda2 && echo "Ok(mount)" && sleep 2

#Installing packages
echo 'installing packages' && sleep 2
pacstrap -K /mnt base linux linux-firmware vim intel-ucode sof-firmware networkmanager man-db man-pages texinfo && echo 'Ok(installing packages)' && sleep 2

genfstab -U /mnt >> /mnt/etc/fstab && arch-chroot /mnt && echo 'everything is okay...' && echo sleep 2

echo book550 >> /etc/hostname && systemctl enable NetworkManager && vim /etc/hosts && echo 'doing well...' && sleep 2

echo 'type your root pass'
passwd

pacman -S grub efibootmgr && grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --removable && grub-mkconfig -o /boot/grub/grub.cfg && echo 'ok...' && sleep 2

exit && umount -R /mnt && reboot
