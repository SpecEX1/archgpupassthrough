pacman -Sy nano
nano /etc/default/grub
nano /etc/mkinitcpio.conf
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P
reboot
