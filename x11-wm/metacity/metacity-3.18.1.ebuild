# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base eutils gnome2 versionator

DESCRIPTION="Legacy GNOME window manager"
HOMEPAGE="https://git.gnome.org/browse/metacity"
SRC_URI="http://ftp.gnome.org/pub/gnome/sources/${PN}/$(get_version_component_range 1-2)/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test xinerama"
RESTRICT="mirror"

# XXX: libgtop is automagic, hard-enabled instead
RDEPEND="x11-libs/gtk+:3
	x11-libs/pango[X]
	dev-libs/glib:2
	gnome-base/gsettings-desktop-schemas
	x11-libs/startup-notification
	x11-libs/libXcomposite
	x11-libs/libXfixes
	x11-libs/libXrender
	x11-libs/libXdamage
	x11-libs/libXcursor
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXrandr
	x11-libs/libSM
	x11-libs/libICE
	media-libs/libcanberra[gtk]
	gnome-base/libgtop
	gnome-extra/zenity
	xinerama? ( x11-libs/libXinerama )
	!x11-misc/expocity"
DEPEND="${RDEPEND}
	>=app-text/gnome-doc-utils-0.8
	gnome-base/gconf
	sys-devel/gettext
	dev-util/itstool
	>=dev-util/intltool-0.35
	virtual/pkgconfig
	test? ( app-text/docbook-xml-dtd:4.5 )
	xinerama? ( x11-proto/xineramaproto )
	x11-proto/xextproto
	x11-proto/xproto"

src_prepare() {
	
	base_src_prepare
	gnome2_src_prepare
}

src_configure() {

	gnome2_src_configure \
		--disable-static	\
		--enable-canberra	\
		--enable-compositor	\
		--enable-render	\
		--enable-sm	\
		--enable-startup-notification	\
		--disable-themes-documentation	\
		$(use_enable xinerama)
}

