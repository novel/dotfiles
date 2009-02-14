freebsd_stuff() {
	export CLICOLOR="yes"
	export LSCOLORS="Hxfxcxdxbxegedabagacad"
	export PATH="$PATH:/usr/local/libexec/git-core/"

	alias acvs1="cvs -d anoncvs@anoncvs1.FreeBSD.org:/home/ncvs"
	alias acvs="cvs -d freebsdanoncvs@anoncvs.FreeBSD.org:/home/ncvs"
	alias dcvs="cvs -d novel@dcvs.FreeBSD.org:/home/dcvs"
	alias pcvs="cvs -d novel@pcvs.FreeBSD.org:/home/pcvs"
	alias scvs="cvs -d novel@ncvs.FreeBSD.org:/home/ncvs"
	alias getpr="/usr/ports/Tools/scripts/getpr"
}

linux_stuff() {
LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
	export LS_COLORS
	alias ls='ls --color=auto'
}

solaris_stuff() {
	export PATH="/opt/local/bin:/opt/local/sbin:/usr/sfw/bin:/usr/sfw/sbin:$PATH"
	export MANPATH="/usr/share/man:/opt/local/man:$MANPATH"
	alias ls='gls --color=auto'
	alias grep='ggrep'
}

uname=`uname`

case $uname in
	FreeBSD*)
		freebsd_stuff
		;;
	Linux*)
		linux_stuff
		;;
	SunOS*)
		solaris_stuff
		;;
esac

git_prompt_info() {
	ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
	echo "[${ref#refs/heads/}]"
}

autoload colors zsh/terminfo

#fpath=(~/.zsh/functions $fpath)

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

#autoload -U ~/.zsh/functions/*(:t)
autoload -U colors
colors


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#export LC_MESSAGES="C"
unsetopt beep
bindkey -v
setopt prompt_subst
#PROMPT="(%D{%H:%M}) %n@%m:%~ $(git_prompt_info)% %#> "
#PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%} %% %{$reset_color%}'
PROMPT='(%D{%H:%M}) %n@%m:%~%{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%} %#> ' #%% ' # %{$reset_color%}'

#PS1="(%D{%H:%M}) %n@$terminfo[bold]$fg[white]%m$terminfo[sgr0]:%~ %#> "
#print "$terminfo[bold]$fg[white]Welcome$terminfo[sgr0] to man zsh-lovers"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/novel/.zshrc'

export LC_MESSAGES=C

#export JAVA_HOME="/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0" 
#export JAVA_HOME="/usr/java/jdk1.6.0_07/"
#export JAVA_HOME="/home/rbogorodsky/jdk1.5.0_11"
export JAVA_HOME="/usr/lib/jvm/java-1.5.0-sun"
#xport AXIS2_HOME="/home/rbogorodsky/opt/axis2-1.4"
export PATH="${JAVA_HOME}/bin:/home/novel/opt/apache-maven-2.0.9/bin:$PATH"
autoload -Uz compinit
compinit
# End of lines added by compinstall

# ls
#export CLICOLOR="yes"
#alias ls='ls --color=auto'

# XXX leave the defaults while display is broken
#export LSCOLORS="Hxfxcxdxbxegedabagacad"

# grep
export GREP_COLOR="auto"

# editor
export EDITOR="vim"
export PAGER="less"

# cdrecord
#export CDR_DEVICE="1,0,0"

### aliases
# system
#alias reboot="sudo reboot"
#alias halt="sudo halt"
#alias shutdown="sudo shutdown"
#alias eject="sudo cdcontrol eject"
#alias insert="sudo cdcontrol close"

# freebsd
#alias acvs1="cvs -d anoncvs@anoncvs1.FreeBSD.org:/home/ncvs"
#alias acvs="cvs -d freebsdanoncvs@anoncvs.FreeBSD.org:/home/ncvs"
#alias dcvs="cvs -d novel@dcvs.FreeBSD.org:/home/dcvs"
#alias pcvs="cvs -d novel@pcvs.FreeBSD.org:/home/pcvs"
#alias scvs="cvs -d novel@ncvs.FreeBSD.org:/home/ncvs"
#alias getpr="/usr/ports/Tools/scripts/getpr"
#alias fbsdmail="fetchmail -f ~/.freebsdfetchmailrc"

# qt
#QMAKESPEC=freebsd-g++ ; export QMAKESPEC
#QTDIR=/usr/X11R6 ; export QTDIR

# fix keys
bindkey -e
case "$TERM" in
	screen*)
                bindkey '\e[1~' beginning-of-line       # Home
                bindkey '\e[4~' end-of-line		# End
                bindkey '\e[3~'	delete-char		# Del
		bindkey '\e[2~' overwrite-mode          # Insert
	;;
esac

preexec () {
	if [[ "$TERM" == "screen" ]]; then
		local CMD=${1}
		echo -ne "\ek$CMD\e\\"
	fi
}

