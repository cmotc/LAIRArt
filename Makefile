PREFIX = /
MANPREFIX = $(PREFIX)/share/man
VERSION = '9.1'
COMMIT_MESSAGE = `date +'%y-%m-%d-%H-%M-%S'`

build_index:
	./build_index.sh

install:
	mkdir -p $(DESTDIR)$(PREFIX)/usr/share/lair
	cp -rv share/lair/*/ $(DESTDIR)$(PREFIX)/usr/share/lair
	cp -v share/lair/images.list $(DESTDIR)$(PREFIX)/usr/share/lair
	cp -v share/lair/sounds.list $(DESTDIR)$(PREFIX)/usr/share/lair
	cp -v share/lair/fonts.list $(DESTDIR)$(PREFIX)/usr/share/lair
	chmod -Rv a+r $(DESTDIR)$(PREFIX)/usr/share/lair/

tarchive:
	tar --exclude=.git -czvf ../lairart_$(VERSION).orig.tar.gz ./

deb-pkg:
	make
	make tarchive
	#echo "LAIR! Roguelike Game(Artistic Assets), version 0.9" > description-pak
	#echo "" >> description-pak
	#echo "This package contains artistic assets for LAIR!." >> description-pak
	#echo "LAIR is a Procedurally Generated Mutliplayer Rogue-Like Game." >> description-pak
	#echo "It uses a library of content and a set of Lua scripts to" >> description-pak
	#echo "generate a random map according to a more-or-less detailed and" >> description-pak
	#echo "flexible environment to play in." >> description-pak
	#echo "" >> description-pak
	#mkdir -p doc-pak
	#cp *.md doc-pak
	#checkinstall --deldoc=yes \
	#	-Dy \
	#	--install=no \
	#	--pkgname="lairart" \
	#	--pakdir=../ \
	#	--require="libpng-tools" \
	#	--maintainer='problemsolver@openmailbox.org' \
	#	--pkglicense='LICENSE' \
	#	--pkgrelease="1" \
	#	--pkggroup="games" \
	#	--pkgversion='0.9' \
	#	--pkgsource='./'
	debuild

windows:
	cp -Rv ${HOME}/Projects/lair-manifest/lairart/share/lair/* ${HOME}/Projects/lair-manifest/lair-msi/bin/lair/
