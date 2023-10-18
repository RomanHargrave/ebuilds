EAPI=8

DESCRIPTION="Wallpaper management daemon for Wayland compositors"
HOMEPAGE="https://github.com/danyspin97/wpaperd"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/danyspin97/wpaperd.git"

SLOT="0"

KEYWORDS="amd64"

RDEPEND=""
DEPEND=""
BDEPEND=""

inherit git-r3 cargo

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	dobin target/release/wpaperctl
	dobin target/release/wpaperd
}
