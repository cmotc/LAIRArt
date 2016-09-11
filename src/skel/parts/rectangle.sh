
roundrectangle(){
        for POINT_X in `seq 1 $RECT_W`; do
                for POINT_Y in `seq 1 $RECT_H`; do
                        echo "point;X $POINT_X;Y $POINT_Y; $POINT_COLORS"
                done
        done
}
