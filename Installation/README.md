# INSTALLATION GUIDE FOR ARCH, FOR LEARN AND USE PURPOSES, KDE and i3 version, from SCRATCH and WITH SCRIPT!

# First, installing with KDE, from scratch (With bootloader for dual booting, if you don't want skip the bootloader part).

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

if home partition was created, ```mount /dev/sdx``` (home partition) ```/mnt/home``` (you should have this created by now, with ```mkdir```). If not, just create the partition with ```mkdir /mnt/home```

```mount /dev/sdx```(Efi partition) (if created) ```/mnt/efi```

## Now we perform the installation of the main packages: 

```
pacstrap
 -K /mnt base base-devel linux linux-headers linux-firmware 
intel-ucode(or amd-ucode) sudo git man-db man-pages neovim
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

uncomment the system language to be used (```en_US.UTF-8``` for US English, and ```pt_BR-UTF-8``` for Brazilian Portuguese).

Generating the locale:

```locale-gen```

We create a locale configuration file with the command 

```echo LANG=*insert the language to be utilized, for example pt_BR.UTF-8* > /etc/locale.conf```

For the keyboard persistent change:

```echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf```

Since i am brazilian and have different keyboard and units, got from a friend (credits below on this README, ezequias júnior) a set of locales that mix english with portuguese. 

```
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
```

```
locale-gen
```

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
LC_TIME=en_GB.UTF-8" > /etc/locale.conf

```


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

From this point on, the Arch is already installed on your computer. However, for didactic purposes, let's install a graphical user interface, KDE. 
You can install whatever you like, from there you have to look up environments and window managers and choose one and install it on your system. Also you can just install some minor packages (such as networkmanager and dhcpcd, enable it, and you can use Arch linux without GUI).

Finally, we will start the installation of KDE and 

## internet services. 

Install them:
```pacman -S networkmanager firewalld dhcpcd```

First, dhcp: 

```systemctl enable dhcpcd.service```

And now the internet connection: 

```systemctl enable NetworkManager.service``` 

For firewall: 

```systemctl enable firewalld.service``` 


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



# For KDE

```sudo pacman -S xorg xorg-xinit xterm tmux plasma plasma-desktop kde-applications kdeplasma-addons sddm ```

Now, let's activate(just if you don't use sddm): 

```sudo nano ~/.xinitrc```

And inside, write ```exec startkde```, so that the environment is set to always start. 

Then we start the service: 

```sudo systemctl enable sddm.service ```

And reboot.

**Thats it!!!! You installed Arch Linux with KDE DE. Have fun!**:laughing:

# Script install for KDE

Using ethernet connection (or having a connection enabled with iwd when booted the arch iso), you can automotize some of the steps above, to be more fast. Based on https://gitlab.com/ezequiasjunior/ezos. 

First, after booting the iso, make sure that you are connected to a network: 

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

## Upgrading the speed of the installation

```nano /etc/pacman.conf```

Enable by uncommenting ParallelDownloads, and set to 20.

For colors, type ILoveCandy

## Now we perform the installation of the main packages: 

```
pacstrap
 -K /mnt base base-devel linux linux-headers linux-firmware 
intel-ucode(or amd-ucode) sudo git man-db man-pages neovim nano
```

## Generating the filesystem table:
```genfstab -U /mnt >> /mnt/etc/fstab ```

## Logging into the root partition as root

```arch-chroot /mnt```

## Using the script to install a KDE working environtment

Go to a temporary directory and clone the repository: 

```
cd /tmp
git clone tararara
cd Installation
```

Make the script executable:

```chmod +x script_kde.sh```

Before executing, have in mind that the timezone is America/Fortaleza. Make sure to use your zone.

Execute it:

```sh script_kde.sh USERNAME HOSTNAME```

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
