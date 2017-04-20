#! /usr/bin/env /bin/sh
for file in $(find /usr/share/digitalandy/skel/ -name *.txt); do
        if [ $file != "/usr/share/digitalandy/skel/colors.txt" ]; then
                echo $file | sed 's|/usr/share/digitalandy/skel/||g'
                # dandy -incl=/usr/share/digitalandy/skel/colors.txt \
                #   -desc="$file" \
                #   -dir=
                #   -
        fi
done
