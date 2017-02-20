build_index:
	./build_index.sh

install:
	cp -rv share/lair/*/ /usr/share/lair
	cp -v share/lair/images.list /usr/share/lair
	cp -v share/lair/sounds.list /usr/share/lair
	cp -v share/lair/fonts.list /usr/share/lair
	chmod -Rv a+r /usr/share/lair/

deb-pkg:
	make
	echo "LAIR! Roguelike Game(Artistic Assets), version 0.9" > description-pak
	echo "" >> description-pak
	echo "This package contains artistic assets for LAIR!." >> description-pak
	echo "LAIR is a Procedurally Generated Mutliplayer Rogue-Like Game." >> description-pak
	echo "It uses a library of content and a set of Lua scripts to" >> description-pak
	echo "generate a random map according to a more-or-less detailed and" >> description-pak
	echo "flexible environment to play in." >> description-pak
	echo "" >> description-pak
	checkinstall --deldoc=yes \
		-Dy \
		--install=no \
		--review-control \
		--pkgname="lairart" \
		--pakdir=../ \
		--require="libpng-tools" \
		--maintainer='problemsolver@openmailbox.org' \
		--pkglicense='LICENSE.md' \
		--pkgrelease="1" \
		--pkggroup="games" \
		--pkgversion='0.9' \
		--pkgsource='./'

windows:
	cp -Rv ${HOME}/Projects/lairart/share/lair/* ${HOME}/Projects/lair-msi/bin/lair/
