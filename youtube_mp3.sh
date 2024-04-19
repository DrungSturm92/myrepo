#!/bin/bash

echo "Pegá la URL de la playlist que deseas convertir a mp3"
read URL
mkdir playlist_audio tmp
cd tmp

yt-dlp -f "251" --force-ipv4 $URL

for i in *.webm; do 
	mv -- "$i" "${i/% '['*/.webm}"; 
done

for f in *.webm; do 
	ffmpeg -i "$f" "../playlist_audio/${f/%.*/.mp3}"; 
done

cd ..
rm -r tmp

