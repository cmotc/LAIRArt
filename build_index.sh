#! /bin/sh
FOLDERS=$(find share/lair/* -type d)
rm share/lair/images.list
rm share/lair/sounds.list
for FOLDER in $FOLDERS; do
	CATEGORY=$(echo $FOLDER | sed 's|share/lair/||')
	for FILE in $(find $FOLDER -name *.png); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/images.list
	done
	for FILE in $(find $FOLDER -name *.wav); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/sounds.list
	done
	for FILE in $(find $FOLDER -name *.ttf); do
		FPATH=$(echo $FILE | sed 's|share/lair|/usr/share/lair|')
		echo $FPATH $CATEGORY default >> share/lair/fonts.list
	done
done