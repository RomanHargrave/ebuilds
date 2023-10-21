# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop cmake xdg-utils git-r3

DESCRIPTION="Powerful yet simple to use screenshot software"
HOMEPAGE="https://flameshot.js.org"
EGIT_REPO_URI="https://github.com/flameshot-org/flameshot.git"

LICENSE="FreeArt GPL-3 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="wayland"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtsingleapplication[qt5(+),X]
	dev-qt/qtwidgets:5
	dev-qt/qtsvg:5
	dev-qt/qtnetwork:5
	dev-qt/qtdbus:5
	sys-apps/dbus
	kde-frameworks/kguiaddons:5
"
BDEPEND="
	dev-qt/linguist-tools:5
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(usev wayland -DUSE_WAYLAND_CLIPBOARD=ON)
		$(usev wayland -DUSE_WAYLAND_GRIM=ON)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
