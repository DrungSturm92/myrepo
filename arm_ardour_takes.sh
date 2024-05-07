#!/bin/bash

ANS=y
echo $ANS

while [ $ANS = y  ]; do
	echo $ANS
	echo "Escribí el número de la toma que deseas renombrar"
	read NUM_VIEJO

	echo "Escribí el nuevo nombre que deseas"
	read NOMBRE_NUEVO

	mkdir $NOMBRE_NUEVO

	for i in Take$NUM_VIEJO'_'*; do 
		mv "$i" ./$NOMBRE_NUEVO/"${i/Take"$NUM_VIEJO"/"$NOMBRE_NUEVO"}";
	done

	read -p "Deseas continuar? (y/n)" ANS
	echo $ANS
done
