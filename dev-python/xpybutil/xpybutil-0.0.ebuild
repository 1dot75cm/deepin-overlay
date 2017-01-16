# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit fdo-mime versionator eutils python

# MY_VER="$(get_version_component_range 1-3)+$(get_version_component_range 4)~8aaf2a6f00"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/main/x/${PN}/${PN}_${PV}.tar.gz"

DESCRIPTION="xcb-util for xpyb"
HOMEPAGE="http://www.linuxdeepin.com"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.7.5:2.7
		x11-libs/xpyb"
		
DEPEND="${RDEPEND}
		dev-python/setuptools"
# S="${WORKDIR}/${PN}-${PV}"

pkg_setup() {
	python_set_active_version 2.7
}

src_install() {

	python setup.py install --root=${D} || die "Install failed"
}
