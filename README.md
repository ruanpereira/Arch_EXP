# Arch_EXP
A repo for configurations, ideas, apps, scripts and the experience of using a Arch system

# What is Arch Linux?

Arch Linux is a linux operational system, x86_84 based, where the idea of the system is to make your owm system. 
<!---  Espaço para futura foto do Arch         -->
The system only come with the bare minimum installation, and you construct the system as it pleases you. Since the partition table, to the desktop enviroment(or windows manager) of your choice. 

Actually, i use KDE DE (how to install in the install file), with linux standard newer kernel available. I don't use zsh, or other bash things. For installing, i use pacman and yay, pretty good ones, i recommend. To the pacman, some tips: 

- Update your mirrors from time to time (monthy or somethig like this) There are many ways to do so, the most common are [reflector](https://ostechnix.com/retrieve-latest-mirror-list-using-reflector-arch-linux/), or with the full mirrorlist (to get, go to [this site](https://archlinux.org/mirrorlist/), you put that in the /etc/pacman.d/mirrorlist file, and the package rankmirrors will rank by speed (to know how to [use](https://www.reddit.com/r/linuxbrasil/comments/9esc3s/usando_reflector_e_rankmirrors_no_arch_linux/))
- If you want colors, just edit in the /etc/pacman.conf file, and unmark the colors option
- If you want more cool stuff, digit under colors "ILoveCandy"
- If you have good internet, in the same pacman.conf file as above, uncomment ParallelDownloads
- With downgrade package, you can actually manage the version of them. 
- From time to time, clear your cache from pacman. 
