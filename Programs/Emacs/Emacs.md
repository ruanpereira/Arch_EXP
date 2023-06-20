Emacs, essentially, is a text editor. But, not only that. Emacs is extremely configurable, and also plastic, 
with matchs perfectly with the system idea. I have experience using nano, but as a inicial programmer and 
also a system "tester", i like to experiment new things. The ideia of using a text editor as, of course, a 
text editor, but also using as a compiler for languages, latex, while configuring the layout, really catch me.
So with the help of two friends, and some chifre, wy not ?

Every time that you need to install a package, please, do M-x package-refresh-contents RET

PAUSED FOR DEVELOPMENT

SPACEMACS INFO SHOULD BE HERE.

For reasons of, its cool, and to save miliseconds of your time, you can set emacs to run as a systemctl unit (a daemon), so it is runningn in the background and it doesnt need to recompile the configurations all the time, just add a new frame. 

To do this, with any process of emacs closed, go to a terminal and type

$ systemctl --user enable emacs

To start on demand

$systemctl --user start emacs

Now, you can open normally, typing Emacs, or use the emacs-client, that will search for the daemon running and open a new frame, with no time of loading. Also, you can run emacs from terminal, like you do with vim. 

To run emacs from terminal

$ emacs (or emacs-client)

You can use two prefixes to the above comamnd. -t for opening emacs or spacemacs inside the terminal (does not work good with spacemacs, the effects and colors are not completely repassed) or -c to open a frame normally. 

Add env
