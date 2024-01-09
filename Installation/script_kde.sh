#!/bin/sh

USERNAME=$1
HOSTNAME=$2

echo "
Welcome $USERNAME! To the installation helper. Relax, take a break and in a few minutes enjoy your new 
system! ;).
"

echo "Setting up $USERNAME at $HOSTNAME [Arch Linux installation]..."

echo "
###################################################
              TIME ZONE CONFIGURATION
###################################################
"
ln -sf /usr/share/zoneinfo/America/Fortaleza /etc/localtime

hwclock --systohc

echo "Done!"

echo "
###################################################
              LOCALE CONFIGURATION
###################################################
"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8
LC_ADDRESS=en_US.UTF-8
LC_COLLATE=C
LC_CTYPE=en_US.UTF-8
LC_IDENTIFICATION=en_US.UTF-8
LC_MEASUREMENT=pt_BR.UTF-8
LC_MESSAGES=en_US.UTF-8
LC_MONETARY=en_US.UTF-8
LC_NAME=en_US.UTF-8
LC_NUMERIC=en_US.UTF-8
LC_PAPER=en_US.UTF-8
LC_TELEPHONE=en_US.UTF-8
LC_TIME=en_GB.UTF-8" > /etc/locale.conf

# if needed keep changes persistent
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

echo "Done!"

echo "
###################################################
             HOSTNAME CONFIGURATION
###################################################
"
echo "$HOSTNAME" > /etc/hostname

echo "127.0.0.1 localhost
::1 localhost
127.0.1.1 $HOSTNAME.localdomain localhost" >> /etc/hosts

echo "Done!"

echo "
###################################################
        INSTALLING ADDITIONAL PACKAGES
###################################################
"

pacman -S --needed - < pkgs_kde.txt

echo "Done!"

echo "
###################################################
               CREATING YOUR USER
###################################################
"

useradd -m -g users -G wheel,storage,power -s /bin/zsh $USERNAME

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

echo "
###################################################
          ENTER YOUR ROOT PASSWORD
###################################################
"
# setup root passwd
passwd

echo "
###################################################
            ENTER THE USER'S PASSWORD
###################################################
"

passwd $USERNAME

echo "Done!
"

echo "
###################################################
        INSTALLING and SETUP GRUB
###################################################
"

# The test enviroment is a machine with 2 OS (windows 11, efi)
# mount windows EFI partition before os-prober exec.
# Remeber to do mkconfig again if the win boot opt does not show in grub menu
grub-install --target=x86_64-efi --bootloader-id=GRUB-Arch --recheck
echo "GRUB_DEFAULT=saved" >> /etc/default/grub
echo "GRUB_SAVEDEFAULT=true" >> /etc/default/grub
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub

# If you want themes, these are some examples, need to install it first
# echo "GRUB_THEME=\"/usr/share/grub/themes/breeze/theme.txt\"" >> /etc/default/grub
# echo "GRUB_THEME=\"/usr/share/grub/themes/Vimix/theme.txt\"" >> /etc/default/grub

grub-mkconfig -o /boot/grub/grub.cfg

echo "Done!
"

echo "
###################################################
        ENABLE SERVICES
###################################################
"

systemctl enable NetworkManager.service
systemctl enable sddm.service
systemctl enable firewalld.service
systemctl enable dhcpcd.service
# pacman -S iwd
# systemctl enable iwd.service # if wireless
echo "Done!
"

while true; do
    read -p "Do you want to exit chroot now to finish your EZ.OS installation? [Y/n] " yn
    case $yn in
        [Yy]* ) 
        echo "All done, bye!

  ██╗ 
██╗╚██╗
╚═╝ ██║
██╗ ██║
╚═╝██╔╝
   ╚═╝ 

Remember to reboot your machine!!"
        exit;; # clean up and reboot
        [Nn]* ) echo "All done, bye!

  ██╗ 
██╗╚██╗
╚═╝ ██║
██╗ ██║
╚═╝██╔╝
   ╚═╝ 

Remember to exit the chroot and reboot to complete the installation.
"
break;; # clean up 
        "" ) echo "All done, bye!

  ██╗ 
██╗╚██╗
╚═╝ ██║
██╗ ██║
╚═╝██╔╝
   ╚═╝ 

Remember to reboot your machine!!"
        exit;; # clean up and reboot
        * ) echo "Please answer yes or no.";;
    esac
done
