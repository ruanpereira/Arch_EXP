## Setting my personal terminal profile. 

First, have or install a terminal of choice (kitty or alacritty)

´´´sudo pacman -S kitty´´´

After that, install zsh

´´´sudo pacman -S zsh´´´

Enable default shell to be zsh:

´´´chsh -s $(which zsh)´´´

Exit and enter on a new session to enable the changes.

Now, install oh my zsh as from the website: 

´´´
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

´´´

After that, install the plugins that you want, using oh-my-zsh install. Mine are zsh-syntax-highlightning and zsh-autosuggestions. 
By example, the autosuggestions install.md file says: 

Clone the repository on the plugin repository: 
´´´git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions´´´
Enable it at the .zshrc config file. I like to clone all repositories of all plugins before enabling it. 

Install the font recommended by the powerlevel 10k (MesloLGS NF) and configure it to your terminal to use(in kitty, open the kitty.conf file and add font_family MesloLGS NF). 
Or, if you are like me and has a font that you like, you can just set the font that you use, and install the font that the powerlevel1-k uses. 

´´´sudo pacman -S ttf-font-awesome ttf-hack(the font that i personally use)´´´
And download the TTF from the powerlevel10k github and install it.

In the end, install the powerlevel10k theme, in the same way as the plugins.

After that, i like to use another version of the ´´´ls´´´ command, also courtesy of my friend Ezequias. 
To do that, just install this package: 

´´´sudo pacman -S eza´´´

And add the alias that change the ls command, i have them on this repo, under the dotfiles section, on the .zshrc file.





