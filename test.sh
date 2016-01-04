for d in share/lair/*; do
    if [ -d $d ]; then
        for e in $d/*; do
            if [ -d $e ]; then
                for f in $e/*; do
                    echo $f usr/$e #>> debian/install
                done
            else
                echo $e usr/$d #>> debian/install
            fi
        done
    else
        echo $d usr/ #>> debian/install
    fi
done