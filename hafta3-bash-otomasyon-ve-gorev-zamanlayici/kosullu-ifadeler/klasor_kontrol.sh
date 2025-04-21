#!/bin/bash

read -p "Klasor adi girin: " KLASOR

if [ "$KLASOR" = "~" ]; then
    KLASOR=$HOME
fi

if [ -d "$KLASOR" ]; then
    DOSYA_SAYISI=$(ls -1 "$KLASOR" | wc -l)
    echo "$KLASOR klasorunden $DOSYA_SAYISI  dosya var."
else
    echo "$KLASOR klasoru bulunamadi."
fi

