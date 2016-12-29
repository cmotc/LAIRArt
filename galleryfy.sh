#! /bin/sh
START_FOLDER=$(pwd)
PNG_FOLDERS=$(find share/lair -type d)
rm -rf site
mkdir -p site
for f in $PNG_FOLDERS; do
        cd $f
        OUTFILE=$START_FOLDER/site/$(echo $f | tr "/" "_").md
        OUTFILEHTML=$START_FOLDER/site/$(echo $f | tr "/" "_").html
        echo $OUTFILE
        PNG_FILES=$(find . -name "*.png" | sed 's|./||')
        for g in $PNG_FILES; do
                ALT_TAG=$(echo $g | sed 's|.png||' | tr "_" " ")
                echo -n "![$ALT_TAG]" >> $OUTFILE
                echo "(../$f/$g)" >> $OUTFILE
        done
        markdown $OUTFILE > $OUTFILEHTML
        cd $START_FOLDER
done

rm $START_FOLDER/index.md
for h in $(find site -name "*.html"); do
        LINKNAME=$(echo $h | sed 's|site/share_lair_||' | tr "_" " " | sed 's|.html||')
        echo "[$LINKNAME]($h)" >> $START_FOLDER/index.md
done
markdown "$START_FOLDER/index.md" > $START_FOLDER/index.html
