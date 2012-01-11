#!/bin/sh

# install necessary stuff
apt-get install -y \
	docker \
	geeqie \
	git-core \
	gmrun \
	gnupg \
	mutt-patched \
	openbox \
	openssh-server \
	openvpn \
	pidgin \
	python-pip \
	rxvt-unicode \
	screen \
	vim-gtk \
	w3m \
	xtrlock

pip install yaslov

mkdir /usr/local/bin > /dev/null 2>&1

# for compatibility with gpg scripts
ln -s /usr/bin/gpg /usr/local/bin/gpg
