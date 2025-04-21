#!/bin/bash

read -p "Bir sayi girin: " SAYI

if [ "$SAYI" -gt 0 ]; then
    echo "Pozitif bir sayi girdiniz."
elif [ "$SAYI" -lt 0 ]; then
    echo "Negatif bir sayi girdiniz."
else
    echo "Sayi sifirdir."
fi

