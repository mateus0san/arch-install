# 4° to run
echo 'reflector'
systemctl enable reflector.timer && vim /etc/xdg/reflector/reflector.conf || exit
echo 'thermald'
systemctl enable thermald || exit
echo 'nftables'
systemctl enable nftables || exit
echo 'trim'
systemctl enable fstrim.timer || exit
echo 'paccache'
systemctl enable paccache.timer || exit
echo 'ending...'

