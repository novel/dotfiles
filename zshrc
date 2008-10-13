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
PROMPT='(%D{%H:%M}) %n@%m:%~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} %#> ' #%% ' # %{$reset_color%}'

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
alias ls='ls --color=auto'

# XXX leave the defaults while display is broken
export LSCOLORS="Hxfxcxdxbxegedabagacad"

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

## xfce
#export TERMCMD="Terminal"

preexec () {
	if [[ "$TERM" == "screen" ]]; then
		local CMD=${1}
		echo -ne "\ek$CMD\e\\"
	fi
}
