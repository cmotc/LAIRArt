build_index:
	./build_index.sh

install:
	cp -rv share/lair/*/ /usr/share/lair
	cp -v share/lair/images.list /usr/share/lair
	cp -v share/lair/sounds.list /usr/share/lair
	cp -v share/lair/fonts.list /usr/share/lair
	chmod -Rv a+r /usr/share/lair/
