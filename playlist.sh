#!/bin/bash

echo "Pegá la URL de la playlist"
read URL
mkdir tmp
cd tmp

yt-dlp -f "251+247" --force-ipv4 $URL

count=0

for i in *; do
	if [ $count == 0 ]; then
		name="Unido-$i";
		((count++));
	fi
done
# printf "$name\n"

ffmpeg -f concat -safe 0 -i <(printf "file '$PWD/%s'\n" ./*.webm) -c copy output.webm

mv -- output.webm ../"$name"
cd ..
rm -r tmp
