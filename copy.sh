#! /bin/sh
sudo rm -rf /usr/share/lair && sudo cp -Rv share/lair /usr/share/lair
sudo chmod -Rv a+r /usr/share/lair/
#sudo chmod -Rv a+r /usr/share/lair/*/