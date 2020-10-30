# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="https://oguzhaninan.github.io/Stacer-Web/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

EGIT_REPO_URI="https://github.com/oguzhaninan/Stacer.git"

IUSE=""

RDEPEND="
sys-apps/systemd
net-misc/curl
dev-qt/qtcore:5
dev-qt/qtgui:5
dev-qt/qtwidgets:5
dev-qt/qtcharts:5
dev-qt/qtsvg:5
dev-qt/qtconcurrent:5
"

DEPEND="${RDEPEND}"

BDEPEND="dev-util/cmake"

src_install() {
	default

	dolib.a "${BUILD_DIR}/output/lib/libstacer-core.a"
	dobin   "${BUILD_DIR}/output/stacer"
}
