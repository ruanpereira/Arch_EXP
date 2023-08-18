# Arch_EXP
A repo for configurations, ideas, apps, scripts and the experience of using a Arch Linux system and is built by a collaboration of two (~unoccupied~) telecom engineering undergraduates:
<p align="center"><a href="https://github.com/ruanpereira/Arch_EXP/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=ruanpereira/Arch_EXP">
</a></p>

# Table of Contents
1. [What is Arch Linux](#what-is-arch-linux?)
2. [Installation Discussions](#Installation-Discussions)
3. [The Experience using Arch](#The-Experience-(2023))
4. [Mid 2023](#Mid-2023)
5. [Programs and functionality](#Programs-and-funnctionality)
6. [WM vs DE](#Trying-a-Windows-Manager-Again)


## What is Arch Linux? 

Arch Linux is a linux operational system, x86_84 based, where the idea of the system is to make your owm system. 
![Arch-linux-logo](https://user-images.githubusercontent.com/77154574/230751122-7527170c-f03a-48e9-9e37-9f54fec8bb99.png)

The system only come with the bare minimum installation, and you construct the system as it pleases you. Since the partition table, to the desktop enviroment(or windows manager) of your choice. 

## Installation Discussions. (On construction)
After installing a few times, i figured what are the important things, so i needed a rapid way to install it. So, i searched for a pre-made recipe for 
the script, and i founded it here: https://github.com/tom5760/arch-install . After that, i just edited with my things, based on another archive here. You can find the edited script on a forked project here. 

## The Experience (2023)
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

## Mid 2023
After 6 months of using Arch Linux, i figured out some important tasks(important for new meat using, and for oldest users that don't organize themselfs [i don't blame, i am also confused at some point.]):
1 - The basics of Arch Linux is being capable of completing a installation WITHOUT desktop environtments. Having the disks partitioned, the language set, the hclock working, wifi working, and other basics that matter to then primitive use of a computer these days. That is the basic of Arch Linux.
2 - After the base, comes the second important thing you will need: a desktop environtment or window management. These will set how your computer will look, but also how deep you are going to learn. In this part, you are not just pondering about the aesthetics, but how much functionality you system is going to have from the go, and how much you are going to configure. Clipboard (the ctrl + C ctrl + V history), Screenshots, bar on the screen, file manager, internet manager screen, sound manager screen. All of this is choosed in the moment you choose this part.
Even the login screen, is also set here (after the hardware initialization).

Desktop environtments will be the first sign of a beaultiful computer, but also will be the most simple and plug and play way to get your computer working for your needs. If you don't have the time, the pacience, ou just don't care about it, Desktop Environtment is your way.

## Desktop Environtment vs Window Manager

From Manjaro, i used i3 for a while, and i liked it. But, trying to use pure i3 and configure it, it takes too much time. After using and trying to improve my i3 config files for at least 1.5 years, my experience with it says that, it is good if you use i3 in a PC, but it is not good for notebooks. Many limitations in automation and simple tasks (like using wifi, or using a output monitor).

A smart and good way to solve a problem in i3, the display resolution and external HDMI recognition problem, is to install arandr and open it, configure, and save the configuration. Inside the file saved, it will have the configuration of the xrandr you want! So, ignore the /bin/sh part, and paste that command in your i3 config.  

Another WM that i will be testing is Hyprland. Need a basic configuration.
All im learning is from : https://wiki.hyprland.org/Getting-Started/Master-Tutorial/

From this, my gratuation took some of my soul for a while. Consider this the end of this sprint os experience, since i no longer remember what i was writing. I decided to make a new start point. More organized, more explained, more detailed. But experiences are experiences, and this is an experience.


