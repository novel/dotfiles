PORTNAME=	novelbsd
PORTVERSION=    1.0	
CATEGORIES=	misc
MASTER_SITES=	

MAINTAINER=	novel@FreeBSD.org
COMMENT=	Metaport for stuff I use

RUN_DEPENDS=	\
                ${KMODDIR}/nvidia.ko:${PORTSDIR}/x11/nvidia-driver \
                startx:${PORTSDIR}/x11/xinit \
		xset:${PORTSDIR}/x11/xset \
                X:${PORTSDIR}/x11-servers/xorg-server \
                zsh:${PORTSDIR}/shells/zsh \
                sudo:${PORTSDIR}/security/sudo \
                tmux:${PORTSDIR}/sysutils/tmux \
		urxvt:${PORTSDIR}/x11/rxvt-unicode \
                openbox:${PORTSDIR}/x11-wm/openbox \
                vim:${PORTSDIR}/editors/vim \
		mplayer:${PORTSDIR}/multimedia/mplayer \
		firefox:${PORTSDIR}/www/firefox \
		nspluginwrapper:${PORTSDIR}/www/nspluginwrapper \
		flash-player-properties:${PORTSDIR}/www/linux-c6-flashplugin11 \
                git:${PORTSDIR}/devel/git \
		pidgin:${PORTSDIR}/net-im/pidgin \
		rtorrent:${PORTSDIR}/net-p2p/rtorrent \
		mutt:${PORTSDIR}/mail/mutt \
		gpg:${PORTSDIR}/security/gnupg1 \
		deadbeaf:${PORTSDIR}/audio/deadbeaf \
		portlint:${PORTSDIR}/ports-mgmt/portlint \
		poudriere:${PORTSDIR}/ports-mgmt/poudriere

USES=		metaport

.include <bsd.port.mk>
