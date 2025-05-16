# Arch_EXP
A repo for configurations, ideas, apps, scripts and the experience of using a Arch Linux system and is built by a collaboration of two (~unoccupied~) telecom engineering undergraduates:
<p align="center"><a href="https://github.com/ruanpereira/Arch_EXP/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=ruanpereira/Arch_EXP">
</a></p>

# Table of Contents
1. [What is Arch Linux](#What-is-Arch-Linux?)
2. [Installation Discussions](#Installation-Discussions)
3. [The Experience using Arch](#The-Experience-(2023))
4. [Mid 2023](#Mid-2023)
5. [Programs and functionality](#Programs-and-Functionality)
6. [WM vs DE](#Desktop-Environtment-vs-Window-Manager)
7. [Conclusion](#Conclusion)
8. [After more than 2 years using, how it is holding?](#After-more-than-2-years-using,-how-it-is-holding?)
9. [Current workstation](#Current-workstation)


## What is Arch Linux? <a name="What-is-Arch-Linux?"></a>

Arch Linux is a linux operational system, x86_84 based, where the idea of the system is to make your owm system. 
![Arch-linux-logo](https://user-images.githubusercontent.com/77154574/230751122-7527170c-f03a-48e9-9e37-9f54fec8bb99.png)

The system only come with the bare minimum installation, and you construct the system as it pleases you. Since the partition table, to the desktop enviroment(or windows manager) of your choice. 

## Installation Discussions. (On construction) <a name="Installaion-Discussions"></a>

The installation can be found [here](https://wiki.archlinux.org/title/Installation_guide). This will be the MINIMUM to consider a operational system (on linux terms. System nowadays have much more than what is set here). I recommend searching for some guides for installations, [like this one](https://www.youtube.com/watch?v=PQgyW10xD8s), to have a more pleasent and straightforward install, while adding features that on other system are the pattern. In my opinion, the basic installation is cool to start using Linux with more responsability. If you want to understand the installation, it is a good idea to create a VM or just use a secondary machine to redo this installation at least  5 or 6 times. Repetition is key. Breaking the system is a step.

Just to be sure that you are understanding. Installing a operational system on arch linux docs terms doesn't mean that you will have a GUI (a graphical interface), or any navigator like firefox, or a file manager, or a print utilitary, etc. Just the basic of a linux system (terminal(or tty for the intimate), processes, and the kernel). So, for begginers, this can be a nightmare.

After installing a few times, i figured what are the important things, so i needed a rapid way to install it. So, i searched for a pre-made recipe for the script, and i founded it here: https://github.com/tom5760/arch-install . After that, i just edited with my things, based on another archive here. You can find the edited script on a forked project here. It is a bit of a workup, and after some changes, i do not find that much inportant to use a script, only if you reeeally need the time and you don't change options
ever. In my case, i like to try new things, aways trying to get new options, adding and removing programs, etc. Sure, in my opinion, when you use something constantly, you have that saved on your brain, so reinstalling is a must and you probably does not need to
write that down. But since the start of ![archinstall](https://wiki.archlinux.org/title/Archinstall) lib, to me creating a script is only necessary if you want the costumized and READY TO GO install. Archinstall, to me, really does the job on crunching the time
needed to install Arch. Just set your settings (you can also save that configuration for another install with archinstall), and after 30 min max, you are ready to install your programs, and the most part of it is already installed (things like drivers, how your system will be created, basic partitioning, language, and basically the fresh new and best suited for more simple usage of the system). On this note, archinstall is a bit harsh on the disc partition, primarially for dual boot. 

But, if you want the COMPLETE control of your installation, just get you step by step by the ![install_guide](https://wiki.archlinux.org/title/Installation_guide), and add your settings, and after that, get your proprietary install script. To me, fast-installing the basic and working my way up to a workspace is better that have a only step script. 

After installing, the post-installation is choose a GUI. There, it starts the discussion about the best DE, using or not a WM, etc. The best start is to use KDE or GNOME (search and choose the best to you, and how to install it on arch). When using the ![archinstall](https://wiki.archlinux.org/title/Archinstall) script, you can also choose the GUI that you gonna have on your system, and you will have that GUI already installed. Bonus points for that.  

For dual-boot, it is the best option.

If you do not want the installation process, or to automate it, use ![archinstall](https://wiki.archlinux.org/title/Archinstall), or search about arco-linux and how to install, or a way to have a calamares install on arch linux.

## The Experience (2023) <a name="The-Experience-(2023)"></a>
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

## Mid 2023 <a name="Mid-2023"></a>
After 6 months of using Arch Linux, i figured out some important tasks(important for new meat using, and for oldest users that don't organize themselfs [i don't blame, i am also confused at some point.]):
1 - The basics of Arch Linux is being capable of completing a installation WITHOUT desktop environtments. Having the disks partitioned, the language set, the hclock working, wifi working, and other basics that matter to then primitive use of a computer these days. That is the basic of Arch Linux.
2 - After the base, comes the second important thing you will need: a desktop environtment or window management. These will set how your computer will look, but also how deep you are going to learn. In this part, you are not just pondering about the aesthetics, but how much functionality you system is going to have from the go, and how much you are going to configure. Clipboard (the ctrl + C ctrl + V history), Screenshots, bar on the screen, file manager, internet manager screen, sound manager screen. All of this is choosed in the moment you choose this part.
Even the login screen, is also set here (after the hardware initialization).

Desktop environtments will be the first sign of a beaultiful computer, but also will be the most simple and plug and play way to get your computer working for your needs. If you don't have the time, the pacience, ou just don't care about it, Desktop Environtment is your way.

## Desktop Environtment vs Window Manager <a name="Desktop-Environtment-vs-Window-Manager"></a>

D.E. is short for desktop environtment. WM is for window manager. 

A Desktop Environtment is composed of a way to showing the programs, the basic funcions (such as wifi, bluetooth, disks, etc), basic programs (file manager, settings, music player, archives reading etc.), taskbar, and other features. It is the most common way of a system, since it is the core of the most used systems (Windows, Ubuntu, Fedora, Manjaro, and others). So, for the most part of people, that is what you want. On arch, this concept is a optional, that's one of the big choices of arch linux. Being able to choose if you want to have a simple install, or configuring your way, or maybe just use the simplest way possible, almost live a server, is a big choice for the common user, and normally this is not presented as a option, and that is a challenge as itself. Don't bite about it. If you want the most efective way, just choose one of the already existing ![ones](https://wiki.archlinux.org/title/Desktop_environment) when installing arch. Also, remenber that can be choosed by the ![archinstall](https://wiki.archlinux.org/title/Archinstall) script. But, when using other systems, that option is kind of masked with choosing your system. 

I used Debian, Ubuntu, Linux Mint, Arco Linux, Pop_OS, and others. These have their main shipping options of Desktop Environtments, and each with their own options and features. Some of them have the option given to choose others Desktop Environtments, or maybe even not use one, but use a window manager pre-configured (basically creating a desktop environtment based off a window manager). But, when i tried a real window manager, that is the first experience that i have with that. 

Common desktop environtments are GNOME, KDE, XFCE. That's the normal way to go about it. Each has their complete experience, choose and try what fits you the most. Gnome and KDE are awesome, and XFCE is a great way of having a lightweight option for weaker computers. 

I choose to try something new, and that is a window manager. But, with my limited knowledge at the time, a window manager pre-configured seemed like a good option (that is a good option, just not for me, because i like to customize things for me).

From Manjaro, i used i3 for a while, and i liked it. But, trying to use pure i3 and configure it, it takes too much time. After using and trying to improve my i3 config files for at least 1.5 years, my experience with it says that, it is good if you use i3 in a PC, but it is not good for notebooks. Many limitations in automation and simple tasks (like using wifi, or using a output monitor). So, when using notebooks, try and have a thought about it. 

After chooosing to maintain the window-manager based use, other options came, such as ![xmonad](https://xmonad.org/), ![bspwm](https://github.com/baskerville/bspwm), ![hyprland](https://hyprland.org/), and this goes a loooooong way. The basic idea is the same, but with different ways of configuring it. 


## Conclusion <a name="Conclusion"></a>
From this, my gratuation took some of my soul for a while. Consider this the end of this sprint os experience, since i no longer remember what i was writing. I decided to make a new start point. More organized, more explained, more detailed. But experiences are experiences, and this is an experience on my usage with Arch Linux. 

I love it. It is a system that have enable the options that to me is entertaining and also amusing. Also, as a rolling release, you have acess to the newest functionality releases on each program. This comes a a gift and a curse. 

![This](https://www.reddit.com/r/unixporn/comments/vngxl0/which_wm_is_better_bspwm_or_awesome/) post on reddit unix porn summerize how choosing a WM works, with lots of toughts about it, but one made it CLEAR AS WATER for me:
"
Sources: I've used i3wm (i3-gaps) extensively, just started trying out bspwm and have also dabbled in AwesomeWM a bit

What I've learned is that in the end it doesn't even matter. They all do pretty much the exact same thing with only a few small differences here and there. Their primary function is to draw application windows on your screen. The only question is how do you want to configure it. If you know Haskell and want to configure it in Haskell, then try Xmonad. If you know Python and want to configure it in Python, try QTile. If, for some strange reason, you know Lua and want to configure it in Lua, try AwesomeWM. If you know C and want to configure it in C by directly editing the source code and don't mind recompiling the whole thing every time you make even the smallest change, then try DWM. If you just want something easy to configure with human readable configs, i3wm, sway (for Wayland) and bspwm are great choices.

I love i3wm for being easy to configure. The config file isn't very hard to figure out as it uses a human readable syntax and is generally usable out of the box anyways. Not particularly pretty, but usable.

I'm loving bspwm because the configs (yes, plural) also use human readable syntax and is just as easy to figure out without having to know a programming language. I think I'm going to like it more than i3wm simply because it's more modular. It doesn't come with a bar, which is fine because I use polybar anyways, even on i3wm. It doesn't handle keybinds by itself, it requires a separate program like sxhkd which comes with it's own config. The advantage of separating out the configs like this is that each config remains fairly small which makes it easier to read and easier to find something you want to change.

But, as I stated earlier in the end they all pretty much do the same thing and the main difference is how they are configured."

It IS just this.

## After more than 2 years using, how it is holding? <a name="After-more-than-2-years-using,-how-it-is-holding?"></a>

After two years, Arch is still my system for me and Palhano. It is incredible that the pattern that Arch has, for installing and managing packages, rolling release, mounting your system, everything feels just right. On this time passed, me and Palhano had VERY diffe-
rent uses and necessities, and we got go work on our "own things", let's say that. Palhano had to use Windows/Ubuntu for a long time, because work/graduation problems, and i needed Ubuntu for work, and Windows only for gaming, but later on got to try other systems. 
In the spam of, like, 8 months, got to use Ubuntu again (did not like it), and after Ubuntu, Windows for 2 months (for development in c++ is terrible this shit only works with clion i swear & STILL YOU NEED TO INSTALL LIBRARIES AND THATS A PAIN IN THE ASS, 
python it is ok, conda + vscode and stay happy). Started Rust but dropped because time crunches, need to get that later on, love the language until now, also on Windows is a pain. For software development outside python and web dev on general, i can't see how 
it works on Windows. Today, i can use Arch again and even got to work with a window manager again, maybe it is really my thing. still like how it works. still like to configure, still tinker for more features. Right now i can also game on Linux, after i dumped
some multiplayer games that i dont like anymore (lol, vava). everything else just works, and if not, dual boot or qemu solves it. Using hyprland + arch today, and loving the waylang protocol! MUCH better than 1 year ago, when launched with KDE for the first time, 
and pure sway. ALSO, Igão came back to arch recently, KDE + arch, for him the DE workflow is better, and thats the magic of it. This repo is a way of guarding ideas of the general environtment of Arch and Linux systems on general. For him, having the programs 
just work and be printed on the screen, with the rolling release, it is the better thing. 

That said, i still want to distro hop a bit more, after trying the red hat base distros (opensuse and fedora), the next target is Gentoo. Hyped for it !!!! Have a friend that is trying NixOS, i didn't liked it from the first get go, relaying on her to get a second
chance lol. By the end of the year, hope to be doing a Gentoo repository maybe. Distros like these i feel the need to documentate my learning curve. Also, going for projects and another repos of configuration, precisely neovim configuration (finally learned enought for it), and the learning repos for the programming languagens that i need it. 

By far, the best desktop 

## Current workstation <a name="Current workstation"></a>
### For Bpalhano:
- KDE Plasma (wayland)
- Arch Linux
- yay
- Obsidian for notes
- need programming ides and shit here
- qemu for virtualization
- steam for games
- firefox i guess
### For ruanpereira:
- Hyprland (wayland)
- Arch Linux (maaaybe change later)
- yay
- neorg plugin neovim for notes
- neovim for python, c++
- qemu for virtualization
- steam, mame, pcsx2 (mainly steam, not need lutris now since add launcher games to steam)
- zen-browser
