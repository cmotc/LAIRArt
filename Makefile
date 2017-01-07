build_index:
	./build_index.sh

install:
	sudo rm -rf /usr/share/lair/*/ && sudo cp -Rv share/lair/* /usr/share/lair
	sudo cp -v share/lair/*.list /usr/share/lair
	sudo chmod -Rv a+r /usr/share/lair/
