for d in share/lair/*; do
    if [ -d $d ]; then
        for e in $d/*; do
            if [ -d $e ]; then
                for f in $e/*; do
		    if [ -d $f ]; then
		        for g in $f/*; do
                            echo $g 
                        done
		    else
                        echo $f 
		    fi
                done
            else
                echo $e 
            fi
        done
    else
        echo $d 
    fi
done