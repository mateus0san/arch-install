#3° to run
echo 'user'
pacman -S sudo fish && useradd -m -G wheel -s /bin/fish mateus && passwd mateus || exit
echo 'video, reflector and contrib'
pacman -S pacman-contrib reflector mesa vulkan-intel intel-media-driver || exit
echo 'sway'
pacman -S sway swayidle swaylock swaybg fuzzel alacritty zellij helix xdg-user-dirs thermald gammastep brightnessctl slurp grim || exit
echo 'sound'
pacman -S pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack || exit
echo 'firewall'
pacman -S nftables || exit
echo 'nerd-fonts'
pacman -S nerd-fonts || exit
echo 'ending...'
