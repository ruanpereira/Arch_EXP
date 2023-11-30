To add a printer, first install and enable the cups service.

$ sudo pacman -S cups

$ systemctl start cups.service
$ systemctl enable cups.service

After that, select the driver for the model that you have. For some HPs, you have: 

$ sudo pacman -S hplip

$ hp-setup

Add the printer, done.
