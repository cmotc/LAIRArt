#! /usr/bin/env /bin/sh

for file in $(find /usr/share/digitalandy/skel/ -name *.txt); do
        if [ $file != "/usr/share/digitalandy/skel/colors.txt" ]; then
                FOLDER=$(echo $file | sed 's|/usr/share/digitalandy/skel/||' | sed 's|.txt||')
                echo share/lair/$FOLDER
                VAR=0
                rm share/lair/$FOLDER/*
                mkdir -p "share/lair/$FOLDER"
                while [ $VAR != 10 ]; do
                        dandy -incl=/usr/share/digitalandy/skel/colors.txt \
                           -desc="$file" \
                           -dir=share/lair/$FOLDER \
                           -name=$FOLDER-$VAR.png \
                           1> /dev/null
                        VAR=$((VAR + 1))
                        echo share/lair/$FOLDER/$FOLDER-$VAR.png
                done
        fi
done
