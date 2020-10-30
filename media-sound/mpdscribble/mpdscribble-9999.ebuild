# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit git-r3 meson

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="https://www.musicpd.org/clients/mpdscribble/"
EGIT_REPO_URI="https://github.com/MusicPlayerDaemon/mpdscribble.git"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

RDEPEND="
   >=media-libs/libmpdclient-2.2
   >=dev-libs/boost-1.62
   || (
	  >=net-libs/libsoup-2.2
	  net-libs/libcurl
   )
   dev-libs/libgcrypt
"

DEPEND="${RDEPEND}"

BDEPEND="
   virtual/pkgconfig
"

src_install() {
	# not using default b/c it does stuff outside destdir
	dodoc doc/mpdscribble.conf
	newman doc/mpdscribble.1 mpdscribble.1
	dobin "${BUILD_DIR}/mpdscribble"
}
