echo "it's time..."
ln -sf /usr/share/zoneinfo/America/Bahia /etc/localtime && hwclock --systohc && echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen && echo LANG=en_US.UTF-8 >> locale.conf && echo KEYMAP=br-abnt2 >> /etc/vconsole.conf || exit

echo 'networking...'
echo book550 >> /etc/hostname && systemctl enable NetworkManager && vim /etc/hosts && echo 'doing well...' || exit

vim /etc/fstab

echo 'type your root pass'
passwd

pacman -S grub efibootmgr && grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --removable && grub-mkconfig -o /boot/grub/grub.cfg && echo 'ok...' || exit

echo "you can reboot now"

