# Install DWM on Debian
Here it is assumed that you already have a working install of debian GNU/Linux, and make sure your user can use `sudo`. The instructions mentioned here have been tested on a minimal debian install with no GUI (only tty).

### Disclaimer
These instructions should work on a Debian or Ubuntu system with a preinstalled GUI, but you might face some conflicts depending on your specific setup.

## Install Dependencies
You can install DWM by using
```
sudo apt install dwm
```
and this will automatically install all the dependencies, but suckless utilities are meant to be built from source, because you customize them by modifying the source code. So here, we will compile DWM ourselves, so we must install all the dependencies ourselves.

| Dependency | Its function |
| ---------- | ------------ |
| xorg | Display server (DWM does not work with wayland) |
| xterm | This can be any terminal emulator you prefer, keep in mind that we will install st (The Suckless Terminal) later on, this is just a backup terminal emulator in case something goes wrong during compilation of st |
| suckless-tools | recommended for DWM |
| build-essential | This will allow us to use `make` to build DWM |
| libx11-dev | DWM dependency |
| libxinerama-dev | DWM dependency |
| libxft-dev | DWM dependency |
| libwebkit2gtk-4.0-dev | DWM dependency |
| git | Will be used to get DWM source code |
| vim | This can be nano or any terminal text editor you are comfortable with using, because we will need to edit some files |

First make sure that your system is updated
```bash
sudo apt update && sudo apt upgrade
```
Then install all the dependencies
```bash
sudo apt install xorg xterm suckless-tools build-essential libx11-dev libxinerama-dev libxft-dev libwebkit2gtk-4.0-dev git vim
```
Once everything is installed, reboot your machine
```bash
sudo reboot
```

## Get DWM Source Code
Now you need to clone the source code for dwm
```bash
git clone https://git.suckless.org/dwm
```
## Build DWM
Go to the directory that contains the DWM source code
```bash
cd dwm
```
Now build and install dwm
```bash
sudo make clean install
```
If the previous command executes with no errors, ***CONGRATULATIONS*** you now have dwm installed on your system, and to make sure that it is visible system-wide, use the following command
```
which dwm
```
if this command returns the path to a binary, then you're all set.

## Autostart DWM
We want dwm to start once our display server starts. Our display server is xorg and when it starts it executes the file `~/.xinitrc` so if we add `exec dwm` to the file it will get executed on the startup of xorg. Note that you might need to create this file.

Now we want to make xorg start once we log in, this can be done by adding `startx` to the file `~/.bash_profile`. And you might need to crete this file as well.

Now reboot, and dwm should start automatically.
```
sudo reboot
```
## Install ST and Dmenu
DWM is a very minimal program so to make it usable you need a terminal emulator to interact with your system and a run launcher to run programs. For a terminal emulator, we are going to use st, and our run launcher will be dmenu. To install them we need to go back to the tty, you can quit dwm by using the quit keybinding
```
Alt + Shift + q
```

The way to install the is identical to dwm:
clone the repository that contains the source code
```bash
git clone https://git.suckless.org/st
git clone https://git.suckless.org/dmenu
```
Go to where you cloned each repository and build
```
sudo make clean install
```
The previous command will be executed once inside the st directory, and once inside the dmenu directory.

To get back in dwm you can reboot, and dwm will autostart just as we configured it, or you can just run the command `startx` manually in your terminal and this will start xorg and dwm.