# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="The X JAck viDEo mOnitor"

HOMEPAGE="https://github.com/x42/xjadeo"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-2"

SLOT="0"

KEYWORDS="~amd64"

IUSE="+glu +freetype +osc +xv +imlib sdl"

# Run-time dependencies. Must be defined to whatever this depends on to run.
# Example:
#    ssl? ( >=dev-libs/openssl-1.0.2q:0= )
#    >=dev-lang/perl-5.24.3-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.
RDEPEND="
media-video/ffmpeg
media-sound/jack2
x11-libs/libX11
glu? ( media-libs/glu )
freetype? ( media-libs/freetype )
osc? ( media-libs/liblo )
xv? ( x11-libs/libXv )
imlib? ( media-libs/imlib2 )
sdl? ( media-libs/libsdl2 )
"

DEPEND="${RDEPEND}"

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
