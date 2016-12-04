#! /bin/sh
FOLDERS=$(find share/lair/* -type d)
rm share/lair/images.list
rm share/lair/sounds.list
rm share/lair/fonts.list
for FOLDER in $FOLDERS; do
	CATEGORY=$(echo $FOLDER | sed 's|share/lair/||')
	for FILE in $(find $FOLDER -name *.png); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/images
	done
	for FILE in $(find $FOLDER -name *.wav); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/sounds
	done
	for FILE in $(find $FOLDER -name *.ttf); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/fonts
	done
done
sort share/lair/images >> share/lair/images.list
rm share/lair/images
sort share/lair/sounds >> share/lair/sounds.list
rm share/lair/sounds
sort share/lair/fonts >> share/lair/fonts.list
rm share/lair/fonts