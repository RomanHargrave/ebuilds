# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Tools for managing soarer's converters"
HOMEPAGE="https://github.com/thentenaar/sctools"
EGIT_REPO_URI="${HOMEPAGE}.git"
EGIT_SUBMODULES=()
AT_NO_RECURSIVE=1

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND="dev-libs/hidapi"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	emake DESTDIR="${D}" udevdir="/lib/udev/rules.d" install
}
