# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="https://oguzhaninan.github.io/Stacer-Web/"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

EGIT_REPO_URI="https://github.com/oguzhaninan/Stacer.git"

# Comprehensive list of any and all USE flags leveraged in the ebuild,
# with some exceptions, e.g., ARCH specific flags like "amd64" or "ppc".
# Not needed if the ebuild doesn't use any USE flags.
IUSE="X"

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

DEPEND="
   ${RDEPEND}
"

BDEPEND="
   dev-util/cmake
"

src_install() {
	default

	dolib.a "${BUILD_DIR}/output/lib/libstacer-core.a"
	dobin   "${BUILD_DIR}/output/stacer"
}

# The following src_install function is implemented as default by portage, so
# you only need to call it, if you need different behaviour.
#src_install() {
	# You must *personally verify* that this trick doesn't install
	# anything outside of DESTDIR; do this by reading and
	# understanding the install part of the Makefiles.
	# This is the preferred way to install.
	#emake DESTDIR="${D}" install

	# When you hit a failure with emake, do not just use make. It is
	# better to fix the Makefiles to allow proper parallelization.
	# If you fail with that, use "emake -j1", it's still better than make.

	# For Makefiles that don't make proper use of DESTDIR, setting
	# prefix is often an alternative.  However if you do this, then
	# you also need to specify mandir and infodir, since they were
	# passed to ./configure as absolute paths (overriding the prefix
	# setting).
	#emake \
	#	prefix="${D}"/usr \
	#	mandir="${D}"/usr/share/man \
	#	infodir="${D}"/usr/share/info \
	#	libdir="${D}"/usr/$(get_libdir) \
	#	install
	# Again, verify the Makefiles!  We don't want anything falling
	# outside of ${D}.
#}
