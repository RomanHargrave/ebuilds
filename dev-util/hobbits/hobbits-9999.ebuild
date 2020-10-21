# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit git-r3 qmake-utils xdg-utils python-single-r1

DESCRIPTION="Graphical tool and libraries for exploring binary data"
HOMEPAGE="https://github.com/Mahlet-Inc/hobbits"
SRC_URI="https://github.com/Mahlet-Inc/hobbits"
EGIT_REPO_URI="https://github.com/Mahlet-Inc/hobbits.git"
EGIT_CHECKOUT_URI="${WORKDIR}/${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
	dev-util/patchelf
	sys-apps/sed
	sys-apps/findutils
"

DEPEND="
	${PYTHON_DEPS}
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/correct-plugin-search-path.patch"
)

src_prepare() {
	default

	# hobbits doesn't have the best qmake project and needs to be reasoned with for clean installation
	find "${S}" -type f -name '*.pro' -print0 | xargs -0 sed -i "s#\$\$(HOME)/.local#${ED}/usr#g"
}

src_configure() {
	eqmake5 "${S}/src"
}

src_install() {
	# the install script will place libhobbits-core in lib/hobbits/; however, this is not on LD_PATH (and should not be...)
	patchelf --set-rpath "/usr/lib/hobbits" "${S}/hobbits-gui/hobbits"

	emake DESTDIR="${ED}" install
	dobin "${S}/hobbits-gui/hobbits"
}
