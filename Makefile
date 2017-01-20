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
	checkinstall

windows:
	cp -Rv ${HOME}/Projects/lairart/share/lair/* ${HOME}/Projects/lair-msi/bin/lair/
