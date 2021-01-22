# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson desktop xdg git-r3

DESCRIPTION="Music audio files viewer and analiser"
HOMEPAGE="https://www.sonicvisualiser.org/"
EGIT_REPO_URI="https://github.com/sonic-visualiser/sonic-visualiser.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="id3tag jack mad ogg opus osc +portaudio pulseaudio test"

BDEPEND="
	dev-qt/qttest:5
	virtual/pkgconfig
	dev-vcs/git
	dev-vcs/mercurial
	|| ( dev-lang/smlnj dev-lang/mlton dev-lang/polyml )
"

RDEPEND="
	app-arch/bzip2
	>=dev-libs/capnproto-0.6:=
	dev-libs/serd
	dev-libs/sord
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	media-libs/alsa-lib
	media-libs/dssi
	media-libs/ladspa-sdk
	media-libs/liblrdf
	media-libs/libsamplerate
	media-libs/libsndfile
	media-libs/rubberband
	media-libs/speex
	media-libs/vamp-plugin-sdk
	sci-libs/fftw:3.0=
	id3tag? ( media-libs/libid3tag )
	jack? ( virtual/jack )
	mad? ( media-libs/libmad )
	ogg? (
		media-libs/libfishsound
		media-libs/liboggz
	)
	opus? ( media-libs/opusfile )
	osc? ( media-libs/liblo )
	portaudio? ( >=media-libs/portaudio-19 )
	pulseaudio? ( media-sound/pulseaudio )
"
DEPEND="${RDEPEND}"

# tests fail without mp3 support
RESTRICT="!test? ( test )"
REQUIRED_USE="
	|| ( jack pulseaudio portaudio )
	test? ( id3tag mad )
"

src_unpack() {
	default
	git-r3_src_unpack
	cd "${S}" || die
	./repoint install || die
}

src_prepare() {
	default
}

src_configure() {
	default
	meson_src_configure
}

src_install() {
	default
	meson_src_install

	#install samples
	insinto /usr/share/${PN}/samples
	doins samples/*

	# mime types
	insinto /usr/share/mime/packages
	doins "${FILESDIR}/${PN}.xml"
}
