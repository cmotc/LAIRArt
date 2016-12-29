#! /bin/sh
START_FOLDER=$(pwd)
PNG_FOLDERS=$(find share/lair -type d)
for f in $PNG_FOLDERS; do
        cd $f
        OUTFILE=$(echo $f | tr "/" "_").md
        echo $OUTFILE
        PNG_FILES=$(find . -name "*.png" | sed 's|./||')
        for g in $PNG_FILES; do
                ALT_TAG=$(echo $g | sed 's|.png||' | tr "_" " ")
                echo -n "![$ALT_TAG]"
                echo "($g)"
        done

        cd $START_FOLDER
done
