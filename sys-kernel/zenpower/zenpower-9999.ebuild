# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 linux-mod

DESCRIPTION="The Zenpower kernel module"

HOMEPAGE="https://github.com/ocerman/zenpower"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2"
SLOT="0"

KEYWORDS="~amd64"
IUSE=""

RESTRICT="strip"

RDEPEND=""
DEPEND="virtual/linux-sources"
BDEPEND=""

MODULE_NAMES="zenpower(hwmon)"

BUILD_TARGETS="clean modules"
