
Debian
====================
This directory contains files used to package proofofgamingd/proofofgaming-qt
for Debian-based Linux systems. If you compile proofofgamingd/proofofgaming-qt yourself, there are some useful files here.

## proofofgaming: URI support ##


proofofgaming-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install proofofgaming-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your proofofgaming-qt binary to `/usr/bin`
and the `../../share/pixmaps/proofofgaming128.png` to `/usr/share/pixmaps`

proofofgaming-qt.protocol (KDE)

