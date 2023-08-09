# INSTALLATION MANUAL, FOR LEARN AND GUIDE PURPOSES

## First test the connection:

``` ping archlinux.org -c 5 ``` (testing internet) 

If you are using wireless conection, use  ```iwd``` **before testing the connection.**

## Load the keyboard:

```loadkeys br-abnt2``` (for example)

## Create the partitions on the disk:

*******If dual booting, do not need to create the boot partition.*******

```cfdisk```

In the program, create the 3 partitions: 

```
/boot(if needed, 512MB),
/mnt(root), 
/mnt/home(separated or not) and swap(5GB or less). 
```

If you do not want to separate the home partition, you can mount the home partition inside the root partition. It is possible by creating a folder called ```/mnt/home``` with  ```mkdir``` after mounting the root partition.

We format the partitions with the filesystems for each:

```mkfs.ext4 /dev/sdx``` (for home partition, with the number of  the partition that you created before for home)
```mkfs.ext4 /dev/sdy``` (for root partitions, with the number of the partition that you created before for root)
```mkfs.fat -F 32 /dev/sdx``` (**only if you created an EFI partition**)

## Creating and activating swap:

```
mkswap /dev/sdx(create swap)
swapon /dev/sdx (activate swap)
```
Now, we ```mount``` the partitions: 

```mount /dev/sdx(root partition) /mnt```

if home, ```mount /dev/sdx``` (home partition) ```/mnt/home``` (you should have this created by now, with ```mkdir```)

```mount /dev/sdx```(Efi partition) (if created) ```/mnt/efi```

## Now we perform the installation of the main packages: 

```
pacstrap
 -i /mnt base base-devel linux linux-headers linux-firmware 
intel-ucode(or amd-ucode) sudo nano vim git neofetch (to show off) 
networkmanager(internet manager) dhcpcd (dhcp client) 
pulseaudio(audio) bluez(for bluetooth) man-db man-pages texinfo emacs
neovim
```
## Generating the filesystem table:
```genfstab -U /mnt >> /mnt/etc/fstab ```

## Logging into the root partition as root

```arch-chroot /mnt```

## Set the superuser password: 
```passwd ```

Create ordinary users: 

```useradd -m *username*```

Set the user's password: 

```passwd *username*```

Set the permissions of the ordinary user: 

```usermod -aG wheel```(group to run everything and have privileges of root users),```storage```(access to external memory, such as hds, usbs, etc),```power *username*``` 

Editing the sudoers file to allow the sudo command for members of the wheel group, so that all wheel users can use sudo: 

```EDITOR=nano visudo ```

Inside, uncomment the line ```%wheel ALL=(ALL) ALL``` and, if you wish, add the line just below the one you uncommented. This is to prompt the user again for the password after a certain period of time:

```Defaults timestamp_timeout=0```

Save the changes and exit. 

## Generating the system language: 

```nano /etc/locale.gen ```

uncomment the system language to be used (```en_US.UTF-8``` for US English, and ```pt_BR-UTF-8``` for Brazilian Portuguese) 

Generating the locale:

```locale-gen```

We create a locale configuration file with the command 

```echo LANG=*insert the language to be utilized, for example pt_BR.UTF-8* > /etc/locale.conf```

At the end, export the language:

```export LANG=en_BR.UTF-8 (same thing as above)```

Now we create the hostname for the computer: 

```echo *insert your hostname here* > /etc/hostname```

Now we edit the hosts file to receive the default ips: 

```nano /etc/hosts```

And add the following lines: 

```
127.0.0.1 localhost
::1 localhost
127.0.1.1 *hostname*.localdomain localhost
```

To set the **region/timezone** and **link the information to localtime**: 

```
ln -sf /usr/share/zoneinfo/*tab*(to see the list of zones and see which one is yours 
zone, in this case mine is America)/*tab*(Insert the local, in my case 
Fortaleza) /etc/localtime
```

Syncing the internal clock: 

```hwclock --systohc```

## **Installing the bootloader (extremely important)**:

See which partition the boot is on (in this case, as we have dual boot with Windows, the partition is the Windows boot partition). You can do this with ```cfdisk``` or ```fdisk```

Create an ```efi``` directory:

```mkdir /boot/efi ```

Mount the partition in this created directory: 

```mount /dev/sdx /boot/efi```

*(If you are dual booting, here on /dev/sdx you put the EFI partition that already exists with your other system).*

Install the packages needed for the bootloader: 

```pacman -S grub efibootmgr dosfstools mtools```

Edit the grub file so grub can search for windows: 

```nano /etc/default/grub```

Inside the file, edit the final line, uncommenting it, which contains: 

```#GRUB_DISABLE_OS_PROBER=false``` 

**Why?**
Well, os-prober is a package whose function is to perform a search for other operating systems to add a UEFI entry. 
It needs to be installed. By default, os-prober is disabled in grub, because the intention is usually to install arch without dualboot, and also for security reasons, as explained in the file. 

Install it now:

```
pacman -S os-prober
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
```
Now we generate the grub configuration file: 

```grub-mkconfig -o /boot/grub/grub.cfg ```

*(At this point, os-prober will probably fails to find your other system. Or not. Mine fails. Why? Because when you run it on this instance, it does not recognize the other partitioning tables on the HD/SSD. When you reboot, the partition tables will be read again and now you can install it. **DO NOT RESET IT YET**.)*

So, after finishing installing, more down on the file, you are going to have the explanation for the rest. For now, follow without thinking about.

Finally, we will start the 

## internet services. 

First, dhcp: 

```systemctl enable dhcpcd.service```

And now the internet connection: 

```systemctl enable NetworkManager.service``` 

Now we can exit the arch-chroot environment: 

```exit (or CTRL+D)```

We unmount all partitions:

```umount -l(that's a lowercase L)R /mnt ```

Now, go for the hug: 

```reboot```

Take out the USB stick, *bless yourself*, and go. 

After rebooting, you log into Arch again, and type:

```
mkdir /mnt2
mount /dev/sda1 /mnt2
```

os-prober (this time it will recognize that Windows exists, and a warning message will appear. If not, just reboot again and try again, until it works.)

```grub mkconfig again```

And now dual boot is configured.

From this point on, the Arch is already installed on your computer. However, for didactic purposes, let's install a graphical user interface, KDE. 
You can install whatever you like, from there you have to look up environments and window managers and choose one and install it on your system. 

# For KDE

```sudo pacman -S xorg xorg-xinit xterm tmux plasma plasma-desktop kde-applications kdeplasma-addons sddm ```

Now, let's activate: 

```sudo nano ~/.xinitrc```

And inside, write ```exec startkde```, so that the environment is set to always start. 

Then we start the service: 

```sudo systemctl enable sddm.service ```

And reboot.

**Thats it!!!! You installed Arch Linux with KDE DE. Have fun!**:laughing:


# To i3

If you want, you can change the login screen to a more old one, ```lightdm```. *Choose yourself*. ```SDDM``` is more cool and beauty, and ```lightdm``` is more simple and archaic. 

```
sudo pacman -S xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator
sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service
https://itsfoss.com/i3-customization/ font. 
```

Use polybar.

**Finish this part properly later.**
