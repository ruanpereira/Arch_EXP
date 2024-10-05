# Summary 
1. [How_to_explore_this_directory](#How_to_explore_this_directory)
2. [Programs](#Programs)
3. [Themes_and_custom](#Themes_and_custom)
4. [Terminal](#Terminal)
5. [FULL INSTALLATION GUIDE FOR ARCH, FOR LEARN AND USE PURPOSES, KDE and i3 version, from SCRATCH and WITH SCRIPT!](#FULL INSTALLATION GUIDE FOR ARCH, FOR LEARN AND USE PURPOSES, KDE and i3 version, from SCRATCH and WITH SCRIPT!)

## How_to_explore_this_directory <a name="How_to_explore_this_directory"></a>

Here, we have directories for the programs that i use on arch linux install with: 
- i3wm
- Bspwm
- kde

Also, we have wallpaper dirs, for, well, wallpapers that i personally like. 

Programs is a dir to save install steps for certain programs that can be buggy at times (such as MATLAB). 

dotfiles is a dir for configuration files for specific programs. 

commands&scripts is for personal scripts or magic line commands that i could forget so i saved there. 

## Programs <a name="Programs"></a>

## Themes_and_custom <a name="Themes_and_custom"></a>

## Terminal <a name="Terminal"></a>








## FULL INSTALLATION GUIDE FOR ARCH, FOR LEARN AND USE PURPOSES, KDE and i3 version, from SCRATCH and WITH SCRIPT! <a name="FULL INSTALLATION GUIDE FOR ARCH, FOR LEARN AND USE PURPOSES, KDE and i3 version, from SCRATCH and WITH SCRIPT!"></a>

# First, installing with KDE, from scratch (With bootloader for dual booting, if you don't want skip the bootloader part).

## First test the connection:

``` ping archlinux.org -c 5 ``` (testing internet) 

If you are using wireless conection, use  ```iwd``` **before testing the connection.**

## FOR WIFI USERS from (this)[https://wiki.archlinux.org/title/iwd]

´´´ iwctl  ´´´

´´´ device list  ´´´

´´´ station 'device' scan  ´´´

´´´ station 'device' get-networks  ´´´

´´´ station 'device' connect SSID  ´´´

## Load the keyboard:

```loadkeys br-abnt2 ``` (for pt-br)

## Update system clock 

```timedatectl set-ntp true```

## Enable parallel downloads so the download of the system is more fast

´´´ nano /etc/pacman.conf ´´´

## Create the partitions on the disk:

*******If dual booting, do not need to create the boot partition.*******

```cfdisk```

In the program, create the 3 partitions(ext4 mount): 

```
/boot(if needed, 512MB),
/mnt(root), 
/mnt/home(separated or not, optional)
/swap(4GB). 
```

In the program, create the 2 partitions(btrfs mount):

```
/boot(if needed, 512MB),
/(root) 

´´´

If you do not want to separate the home partition, you can mount the home partition inside the root partition. 
It is possible by creating a folder called ```/mnt/home``` with  ```mkdir``` after mounting the root partition.

## We format the partitions with the filesystems for each(ext4 mount):

``` mkfs.ext4 /dev/sdx ``` (for home partition, with the number of  the partition that you created before for home, if you created a home partition)
``` mkfs.ext4 /dev/sdy ``` (for root partitions, with the number of the partition that you created before for root)
``` mkfs.fat -F 32 /dev/sdz ``` (**only if you created an EFI partition**)

## We format the partitions with the filesystems for each(btrfs mount):

``` mkfs.btfrs -f /dev/sdy ``` (for root partitions, with the number of the partition that you created before for root)
``` mkfs.fat -F 32 /dev/sdz ``` (**only if you created an EFI partition**)


**Only if you used btrfs!!!**

## If using btfrs, first mount the partition:

mount /dev/sdx /

## Then create the subvolumes(btrfs): 

´´´
@ ( / ) ( already created when mounting the partition )

@home ( /home ) ( btrfs subvolume create /home ) 

@log ( /var/log ) ( btrfs subvolume create /var/log) 

@pkg (/var/cache/pacman/pkg) ( btrfs subvolume create /var/cache/pacman/pkg ) 

@.snapshots (  /.snapshots ) ( btrfs subolume create /.snapshots ) 

´´´

## Creating and activating swap(ext4):

```
mkswap /dev/sdx(create swap)
swapon /dev/sdx (activate swap)

```

## Creating and activating swap(btrfs):

```
btrfs subvolume create /swap
btrfs filesystem mkswapfile --size 4g --uuid clear /swap/swapfile
swapon /swap/swapfile

```

And:

´´´ nano /etc/fstab ´´´
 
´´´ /swap/swapfile none swap defaults 0 0 ´´´

##Now, we ```mount``` the partitions(ext4): 

``` mount /dev/sdx(root partition) /mnt ```

if home partition was created: 

``` mount --mkdir /dev/sdx(home partition) /mnt/home ```
 
If not, just create the partition with:

``` mkdir /mnt/home ```

``` mount /dev/sdx (Efi partition) /mnt/boot ```

## Now we perform the installation of the main packages: 

```
pacstrap -K /mnt base base-devel linux linux-headers linux-firmware sof-firmware( for laptops after 2019 ) intel-ucode(or amd-ucode) 
sudo git man-db man-pages neovim nano networkmanager texinfo doxygen iwd dhcpcd

```
## Generating the filesystem table:
``` 
genfstab -U /mnt >> /mnt/etc/fstab 

```

## Logging into the root partition as root

``` 
arch-chroot /mnt

```

##To set the **region/timezone** and **link the information to localtime**:

```
ln -sf /usr/share/zoneinfo/*tab*(to see the list of zones and see which one is yours 
zone, in this case mine is America)/*tab*(Insert the local, in my case 
Fortaleza) /etc/localtime

```

##Syncing the internal clock:

```hwclock --systohc```

## Generating the system language(simple LANG): 

```nano /etc/locale.gen ```

uncomment the system language to be used (```en_US.UTF-8``` for US English, and ```pt_BR-UTF-8``` for Brazilian Portuguese).

Generating the locale:

```locale-gen```

We create a locale configuration file with the command

´´´echo LANG=*insert the language to be utilized, for example pt_BR.UTF-8* > /etc/locale.conf```

For the keyboard persistent change:

```echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf```

## Generating the system language(multi LANG)

Since i am brazilian and have different keyboard and units, got from a friend (credits below on this README, ezequias júnior) a set of locales that mix english with portuguese.


Setting the language used:
```
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen

```

Creating locale:
```
locale-gen
```

Adding specific LC environtment variables:
```
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
LC_TIME=pt_BR.UTF-8" > /etc/locale.conf

```

Persistent keyboard configuration:
```
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf

```

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

## Enable the service for networking:

´´´
systemctl enable NetworkManager

´´´

## Set the superuser password: 

```
passwd 

```

## Create ordinary users: 

```
useradd -m *username*

```

Set the user's password:

``` 
passwd *username*

```

Set the permissions of the ordinary user:

``` 
usermod -aG wheel```(group to run everything and have privileges of root users),```storage```(access to external memory, such as hds, usbs, etc),```power *username*

``` 

Editing the sudoers file to allow the sudo command for members of the wheel group, so that all wheel users can use sudo: 

``` EDITOR=nano visudo ```

Inside, uncomment the line ``` %wheel ALL=(ALL) ALL``` 
and, if you wish, add the line just below the one you uncommented. This is to prompt the user again for the password after few seconds

```
Defaults timestamp_timeout=0
```

Save the changes and exit.

## **Installing the bootloader (extremely important)**:

See which partition the boot is on (in this case, as we have dual boot with Windows, the partition is the Windows boot partition). You can do this with ```cfdisk``` or ```fdisk```


Mount the partition in this created directory or ensure that the partition is mounted: 

``` mount /dev/sdx /boot ```


*(If you are dual booting, here on /dev/sdx you put the EFI partition that already exists with your other system).*

Install the packages needed for the bootloader and dualboot : 

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
pacman -S os-prober (only if dualbooting)

grub-install --target=x86_64-efi --efi-directory=/boot  --bootloader-id=archlinux --recheck

```
Now we generate the grub configuration file: 

```grub-mkconfig -o /boot/grub/grub.cfg ```

*(At this point, os-prober will probably fails to find your other system. Or not. Mine fails. Why? Because when you run it on this instance, it does not recognize the other partitioning tables on the HD/SSD. When you reboot, the partition tables will be read again and now you can install it. **DO NOT RESET IT YET**.)*

So, after finishing installing, more down on the file, you are going to have the explanation for the rest. For now, follow without thinking about.

From this point on, the Arch is already installed on your computer. However, for didactic purposes, let's install a graphical user interface, KDE. 
You can install whatever you like, from there you have to look up environments and window managers and choose one and install it on your system. 
Also you can just install some minor packages (such as networkmanager and dhcpcd, enable it, and you can use Arch linux without GUI).

to guarantee that you can reboot properly to continue this README:

´´´
systemctl enable NetworkManager

´´´

And reboot.

Finally, we will start the installation of KDE and internet services, along with a session manager (SDDM).

## For KDE, internet services and SDDM

```sudo pacman -S xorg xorg-xinit xterm plasma plasma-desktop kde-applications kdeplasma-addons sddm firewalld networkmanager dhcpcd ```

Now, let's activate(just if you don't use sddm): 

```sudo nano ~/.xinitrc```

And inside, write ```exec startkde```, so that the environment is set to always start. 

Then we start the services: 

For dhcpcd

´´´systemctl enable dhcpcd.service´´´


For firewall: 

```systemctl enable firewalld.service``` 

SDDM:

```sudo systemctl enable sddm.service ```

Now we can exit the arch-chroot environment: 

```exit (or CTRL+D)```

We unmount all partitions:

```umount -l(that's a lowercase L)R /mnt ```

Now, go for the hug: 

```reboot```

Take out the USB stick, *bless yourself*, and go. 

After rebooting, you log into Arch, and type on terminal:

```grub-mkconfig -o /boot/grub/grub.cfg```

And now dual boot is configured.

**Thats it!!!! You installed Arch Linux with KDE DE. Have fun!** :laughing:

##For bspwm install

Install the following(obligatory):

´´´
sudo pacman -S xorg-xinit xorg-xprop xdg-user-dirs bspwm sxhkd firefox chromium pcmanfm rxvt-unicode kitty firewalld pipewire wireplumber pipewire-alsa xclip
pipewire-jack pipewire-pulse pavucontrol network-manager-applet nm-connection-editor curl wget wpa_supplicant openssh git github-cli cups hplip print-manager
openresolv openvpn networkmanager-openvpn net-tools bluez bluez-utils blueman sddm partitionmanager polkit-kde-agent ntfs-3g polybar(can be another) udisks2 feh

´´´

After that, install a AUR manager such as pikaur, yay, paru, etc.

## Services and enabling bspwm

Enable sddm: 

´´´
systemctl enable sddm
´´´

Enable firewall

´´´
systemctl enable firewalld
´´´

Enable NetworkManager

´´´
systemctl enable NetworkManager
´´´

Enabling bluetooth (optional, if you don't want just unninstall bluez bluez-utils blueman): 

´´´
systemctl enable bluetooth
´´´

Enable cups (for printers)

´´´
systemctl enable cups
´´´


If you don't have a configuration file for bspwm and sxhkd:

First git clone the repo:

´´´
git clone https://github.com/baskerville/bspwm.git
´´´

Then copy the example config file for bspwm ( if you don't have the dir, create with mkdir ):

´´´
sudo cp ~/bspwm/examples/bspwmrc ~/.config/bspwm/

´´´

After that:

´´´
chmod +x ~/.config/bspwm/bspwmrc
´´´

The copy the example config file for sxkhd ( same observation as above ):

´´´
sudo cp ~/bspwm/examples/sxkhdrc ~/.config/sxkhd/

´´´

Add blueman-applet to the bspwmrc config file. 

Add a wallpaper using feh: 

feh --bg-fill ~/Workspace/Arch_EXP/red-wallpapers/wall-1.png

Should be enough.



# Script install for KDE

Using ethernet connection (or having a connection enabled with iwd when booted the arch iso), you can automotize some of the steps above, to be more fast. Based on https://gitlab.com/ezequiasjunior/ezos. 

First, after booting the iso, make sure that you are connected to a network: 

``` ping archlinux.org -c 5 ``` (testing internet) 

If you are using wireless conection, use  ```iwd``` **before testing the connection.**

## Load the keyboard:

```loadkeys br-abnt2``` (for example)

## Update system clock 

```timedatectl set-ntp true```

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

## Upgrading the speed of the installation

```nano /etc/pacman.conf```

Enable by uncommenting ParallelDownloads, and set to 20.

For colors, type ILoveCandy

## Now we perform the installation of the main packages: 

```
pacstrap
 -K /mnt base base-devel linux linux-headers linux-firmware 
intel-ucode(or amd-ucode) sudo git man-db man-pages neovim nano zsh ntfs-3g
```

## Generating the filesystem table:
```genfstab -U /mnt >> /mnt/etc/fstab ```

## Logging into the root partition as root

```arch-chroot /mnt```

## Using the script to install a KDE working environtment

Go to a temporary directory and clone the repository: 

```
cd /tmp
git clone https://github.com/ruanpereira/Arch_EXP.git
cd Installation
```

Make the script executable:

```chmod +x script_kde.sh```

Before executing, have in mind that the timezone is America/Fortaleza. Make sure to use your zone. Also the script has support for theming grub, but you need to search for one (grub themes on google, and find a way to install it). If it is in pacman, it is easy. Just put the name of the package in pacman in the pkgs_kde.txt, below the boot and processor packages, following the formatation. Also, there are some programs that i personally use, so check the pkgs list to put more ou remove some.

The package list is organized as: 

- Processor and boot packages
- Desktop Env/Windown Manager packages
- Connectivity packages
- Programs and programming packages
- Fonts packages
- Latex packages
- Restore packages

Also, you have some observations as: 

- For Virtual Machine complete usage
```
virtualbox
virtualbox-guest-iso
qemu
libvirt
iptables
dnsmasq
openbsd-netcat
bridge-utils
virt-manager
```

- Post install options (for my usage, think about yours, this is more a inspirational list), after installing the system and booting up.
```
ohmyzsh
iptables-nft (for vm, optional)
Clion (from source, cpp)
Spyder (from miniconda)

```
- For python support on Emacs (lsp-mode) (post install)
```
python-lsp-server
sudo pacman -S --asdeps python-mccabe python-pycodestyle python-pyflakes python-pylint yapf python-whatthepatch flake8 python-rope python-pydocstyle
```

Execute it:

```sh script_kde.sh USERNAME HOSTNAME```

When using the script, keep attention to select your KDE options. If you don't know or don't want to change anything, just press ENTER on all prompts of the pacman installation. I, by example, like pipewire more than jack, so i change this option when installing KDE.

After all, if dual booting, redo the steps to enable the dual boot. 


After rebooting, you log into Arch, and type on terminal:

```grub-mkconfig -o /boot/grub/grub.cfg```

And now dual boot is configured.

# To i3

If you want, you can change the login screen to a more old one, ```lightdm```. *Choose yourself*. ```SDDM``` is more cool and beauty, and ```lightdm``` is more simple and archaic. 

```
sudo pacman -S xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator
sudo systemctl enable lightdm.service
sudo systemctl start lightdm.service
https://itsfoss.com/i3-customization/ font. 
```

After installing the i3 and going onto, start to install the programs that you think you will need. A file manager (pcmanfm), by example. To use wifi, go to a terminal and type nmtui. 

**Finish this part properly later.**

# Polkit Agent

A polkit agent is a utilitary that permits the user to authenticate thenselfs (sudo using by example). On any system, a polkit exists. For DE(Desktop Environtments), this comes along the system. Since i3 does not have one, i use the kde agent. To use it, first you need to install it using pacman:

```

$ sudo pacman -S polkit-kde-agent

```

After that, enable the autostart in the config file of i3 by :


```

exec_always --no-startup-id "/usr/lib/polkit-kde-authentication-agent-1"

```

And thats it. Should now enable the authentication agent for uses like building a disk by a file manager, starting a systemd service, etc.

This was possible by: 

```
https://wiki.archlinux.org/title/Autostarting
https://wiki.archlinux.org/title/I3#Autostart
https://wiki.archlinux.org/title/Fingerprint_GUI (for undestanding how agents work with other apps)
https://wiki.archlinux.org/title/Polkit#Authentication_agents

```

# Set keyboard to br if you use english lang on installation of Arch (brazillians problem, ta entendeno?)

Do

```
$ localectl set-x11-keymap br

```
