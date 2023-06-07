# How to install Matlab in Arch Linux

First things first: download MATLAB zip in ```https://www.mathworks.com```, take sure you're in your MathWorks account and have a valid license.
After this, go to the local that you was downloaded. IN the local that you choose (e.g. ~/MATLAB), extract with

```unzip -K matlab....zip```

Go to folder that you extracted MATLAB and

```sh install```

Then, after all MATLAB installation stuff, go to the directory you choosed to install MATLAB, at this point you already descovered that you can install MATLAB in another directory you don't extracted this, so, if you want (obvously you want), you can delete all files you unziped, just make sure that you are not deleting what you have just installed (it happens, that's ok).

After install and delete files, go to where you installed MATLAB and search for a folder named ```bin```, and run ```sh activate_matlab.sh```, this script will create all MATLAB licenses using your account, without this script, it is impossible to use MATLAB (legally) on your machine.

> The dependence you open MATLAB become automatically a PATH.

Memorize the directory path or be nerd, you choose.
