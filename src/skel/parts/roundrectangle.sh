#/bin/bash
roundrectangle(){
        for POINT_X in `seq 1 $RECT_W`; do
                for POINT_Y in `seq 1 $RECT_H`; do
                        PPOINT_X=`expr $STARTX + $POINT_X - 2`
                        PPOINT_Y=`expr $STARTY + $POINT_Y - 2`
                        echo "point;X $POINT_X;Y $POINT_Y; $POINT_COLORS"
                done
        done
        for RPOINT_X in `expr $RECT_W - 1`; do
                for RPOINT_Y in `expr $RECT_Y - 1`; do
                        PPOINT_X=`expr $STARTX + $POINT_X`
                        PPOINT_Y=`expr $STARTY + $POINT_Y`
                        echo "point;X $POINT_X;Y $POINT_Y; $POINT_COLORS"
                        #None of this is going to work. Revise tomorrow.
                done
        done
}
