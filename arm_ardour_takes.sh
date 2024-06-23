#!/bin/bash

ANS=y
# echo $ANS

mkdir "copias"
while [ $ANS = y  ]; do
	# echo $ANS
	echo "Escribí el número de la toma que deseas renombrar"
	read NUM_VIEJO

	echo "Escribí el nuevo nombre que deseas"
	read NOMBRE_NUEVO

	mkdir ./copias/$NOMBRE_NUEVO

	for i in Take$NUM_VIEJO'_'*; do 
		cp "$i" ./copias/$NOMBRE_NUEVO/"${i/Take"$NUM_VIEJO"/"$NOMBRE_NUEVO"}";
	done

	read -p "Deseas continuar? (y/n) -> " ANS
	# echo $ANS
done

read -p "Deseas renombrar canales? (y/n) -> " CAN

cd copias;
# echo "Estas aquí -> $(pwd)"\;

while [ $CAN = y  ]; do
        echo "Escribí el nombre del canal que deseas renombrar"
        read CAN_VIEJO

        echo "Escribí el nuevo nombre que deseas"
        read CAN_NUEVO

        for d in *; do
                cd "$d";
                echo "Estás aquí -> $(pwd)"\;
		counter=$(ls | grep "$CAN_VIEJO" | wc -l); 
               	if [ $counter -gt 0 ]; then
                       	for f in *${CAN_VIEJO}*; do
                               	echo "Renombrando -> $f"\;
                               	mv "$f" "${f/"$CAN_VIEJO"/"$CAN_NUEVO"}";
                       	done
               	fi
                cd ..;
        done
        read -p "Deseas continuar? (y/n) -> " CAN
done

