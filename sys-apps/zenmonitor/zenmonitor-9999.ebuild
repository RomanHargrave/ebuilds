# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3
#
# Eclasses tend to list descriptions of how to use their functions properly.
# Take a look at the eclass/ directory for more examples.

# Short one-line description of this package.
DESCRIPTION="Tool for monitoring AMD Zen CPU sensors"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="https://github.com/ocerman/zenmonitor"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="X"

RDEPEND="x11-libs/gtk+:3"

DEPEND="${RDEPEND}"

BDEPEND="sys-apps/sed"

src_install() {
	dobin zenmonitor
}
