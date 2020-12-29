# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake flag-o-matic git-r3

DESCRIPTION="WebRTC build for Telegram"
HOMEPAGE="https://github.com/desktop-app/tg_owt"
EGIT_REPO_URI="https://github.com/desktop-app/tg_owt.git"
EGIT_COMMIT="ffc317415d5c8e732005414125099a6a6b52dc3e"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"
IUSE="pulseaudio"

# some things from this list are bundled
# work on unbundling in progress
DEPEND="
	dev-libs/openssl:=
	dev-libs/protobuf:=
	media-libs/alsa-lib
	media-libs/libjpeg-turbo:=
	media-libs/libvpx:=
	media-libs/openh264:=
	media-libs/opus
	media-video/ffmpeg:=
	!pulseaudio? ( media-sound/apulse[sdk] )
	pulseaudio? ( media-sound/pulseaudio )
"

RDEPEND="${DEPEND}"

BDEPEND="
	virtual/pkgconfig
	amd64? ( dev-lang/yasm )
"

src_configure() {
	# lacks nop, can't restore toc
	append-flags '-fPIC'
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=TRUE
		-DTG_OWT_PACKAGED_BUILD=TRUE
		-DTG_OWT_USE_PROTOBUF=TRUE
	)
	cmake_src_configure
}
