#!/bin/sh

files_map="zshrc $HOME/.zshrc
vimrc $HOME/.vimrc
gitconfig $HOME/.gitconfig
Xdefaults $HOME/.Xdefaults
screenrc $HOME/.screenrc
vimperatorrc $HOME/.vimperatorrc
openbox $HOME/.config/openbox"

# backup old files
echo "Performing backup of old files..."
for i in `echo "${files_map}"|awk '{print $2}'|xargs`; do
	mv "${i}" "${i}.orig"
done

echo "Copying new stuff in..."
echo "${files_map}"|while read line; do
	#echo "line: ${line}"
	src=`echo ${line}|awk '{print $1}'`
	dst=`echo ${line}|awk '{print $2}'`
	cp_args=""
	if test -d ${src}; then
		cp_args="-r"
	fi
	
#	echo "${src} --> ${src}"
	cp ${cp_args} ${src} ${dst}
done


