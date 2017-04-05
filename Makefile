PREFIX = /
MANPREFIX = $(PREFIX)/share/man
VERSION = '9.1'
COMMIT_MESSAGE = `date +'%y-%m-%d-%H-%M-%S'`

dummy:
	echo "dummy"

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
	make build_index
	make tarchive
	debuild

clean:
	rm -f *tgz

windows:
	cp -Rv ${HOME}/Projects/lair-manifest/lairart/share/lair/* ${HOME}/Projects/lair-manifest/lair-msi/bin/lair/
