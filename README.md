# Arch_EXP
A repo for configurations, ideas, apps, scripts and the experience of using a Arch system

# What is Arch Linux?

Arch Linux is a linux operational system, x86_84 based, where the idea of the system is to make your owm system. 
https://wiki.installgentoo.com/images/f/f9/Arch-linux-logo.png
The system only come with the bare minimum installation, and you construct the system as it pleases you. Since the partition table, to the desktop enviroment(or windows manager) of your choice. 

# Installation script forked here.
After installing a few times, i figured what are the important things, so i needed a rapid way to install it. So, i searched for a pre-made recipe for 
the script, and i founded it here: https://github.com/tom5760/arch-install . After that, i just edited with my things, listed on another archive here. 
# The Experience (2023)
Actually, i use KDE DE (how to install in the install file), with linux standard newer kernel available. I don't use zsh, or other bash things. For installing, i use pacman and yay, pretty good ones, i recommend. To the pacman, some tips: 

- Update your mirrors from time to time (monthy or somethig like this) There are many ways to do so, the most common are [reflector](https://ostechnix.com/retrieve-latest-mirror-list-using-reflector-arch-linux/), or with the full mirrorlist (to get, go to [this site](https://archlinux.org/mirrorlist/), you put that in the /etc/pacman.d/mirrorlist file, and the package rankmirrors will rank by speed (to know how to [use](https://www.reddit.com/r/linuxbrasil/comments/9esc3s/usando_reflector_e_rankmirrors_no_arch_linux/))
- If you want colors, just edit in the /etc/pacman.conf file, and unmark the colors option
- If you want more cool stuff, digit under colors "ILoveCandy"
- If you have good internet, in the same pacman.conf file as above, uncomment ParallelDownloads
- With downgrade package, you can actually manage the version of them. 
- From time to time, clear your cache from pacman. 

For programs usability, my experience is: If you want and have the time, you can do whatever you want. For undergraduates and Linux TI entusiasts, it's a good mid point. Becauuse you can do muuch things, but some details can fall from your grasp. By exameple, programs like MatLab, AutoCad and others alike are hard to find here, and in the end, Windows will do the ob. I'm a dual booter (don't even know if this term exists lol), and it's necessary for my usage. Games, the type of programs i mencioned before, and some other tricky things is just better in Windows. At least for now. Most are licensed programs, the ones that give you that big headache. 

If you don't use this type of thing, IT'S AMAZING!!!! Being capable of doing a lot of things (install the programs, debug them, personalizing your system) is really cool. Windows don't has this type of experience. The fact that you can choose how you system looks is cool enough for me, but as a newbie dev, itt's awesome that i have a system that is so light that i can heavy loads of code(like MachineLearning) and a I7-7500U can handle it. THe liberty to have many options of develop environments, the smoothness of propramming here, the control of libs, code, how it works, etc, everything is fascinating. 

You have like (i use two monitors):

1. The normal work with some personality: ![image](https://user-images.githubusercontent.com/77154574/218199152-c7e93d3c-f61f-4710-becf-e59d0873d26e.png)
2. The full work env (based on I use arch btw): ![image](https://user-images.githubusercontent.com/77154574/218198308-de14b915-3569-49d1-96a6-65632620b8dc.png)
or ![image](https://user-images.githubusercontent.com/77154574/218199739-51393029-a74e-4230-bee8-997f4eaba9d5.png)
3. The BALDIADO(don't try to translate this, just feel it): ![image](https://user-images.githubusercontent.com/77154574/218201241-0c9e02c8-8204-4e16-8277-750ee9a522ee.png)

All this in 30 minutes searching ideas from my not-creative mind. More examples are in [unix reddit](https://www.reddit.com/r/unixporn/)

This is what i like about it.

## Trying a windows manager again

From Manjaro, i used i3 for a while, and i liked it. But, trying to use pure i3 and configure it, it takes too much time. So, i have some alternatives. 

Searching, one of them was awesome: https://awesomewm.org/

You can see some possible examples of inspirations here: https://github.com/awesomeWM/awesome/issues/1395

It is a dynamic window manager, so i don't necessally need to be only on the keyboard, but i can. Also, it seems pretty af. 

