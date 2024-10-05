#!/bin/bash

SRC=src
INSTALL=$(ls $SRC)

for NAME in $INSTALL; do
    for ROOT_NAME in /*; do
        NAME1=/$NAME
        NAME2=$ROOT_NAME
        if [ "$NAME1" = "$NAME2" ]; then
            LS1=$(ls -A $SRC/"$NAME")
            LS2=$(ls -A "$NAME2")
            for L1 in $LS1; do
                for L2 in $LS2; do
                    FN1=/$NAME/$L1
                    FN2=$NAME2/$L2
                    if [ "$FN1" = "$FN2" ]; then
                        FILESRC="$SRC$FN1"
                        FILEINSTALL="$FN2"
                        echo "uninstall from : $FILESRC"
                        echo "$FILEINSTALL --> $FILEINSTALL"
                        cat "$FILEINSTALL.save" > "$FILEINSTALL"
                    fi
                done
            done
        fi
    done
done