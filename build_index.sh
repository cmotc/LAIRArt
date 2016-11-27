#! /bin/sh
FOLDERS=$(find share/lair/* -type d)
rm share/lair/images.list
for FOLDER in $FOLDERS; do
	CATEGORY=$(echo $FOLDER | sed 's|share/lair/||')
	for FILE in $(find $FOLDER -name *.png ); do
		echo $FILE $CATEGORY default >> share/lair/images.list
	done
done