# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools git-r3

DESCRIPTION="Monitor database for ddccontrol"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://github.com/ddccontrol/ddccontrol-db"
EGIT_REPO_URI="${HOMEPAGE}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
DEPEND="${RDEPEND} dev-lang/perl"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	default
	econf
}

src_install() {
	default
}
