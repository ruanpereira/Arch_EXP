To install printers, if your distro does not have a printer manager, do these steps:

First install the service that allows printing:

$ sudo pacman -S cups
$ sudo systemctl start cups.service
$ sudo systemctl enable cups.service

Second, install the driver and use to install it. Search for the driver here: https://wiki.archlinux.org/title/CUPS/Printer-specific_problems.

On some HP printers, the driver is hplip, that can be installed as:

$ sudo pacman -S hplip

And, to add a printer:

$ hp-setup

And follow the steps.
