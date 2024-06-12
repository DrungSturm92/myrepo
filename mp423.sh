#!/bin/bash

for f in *; do 
	if [ "$f" != "mp423.sh" ]; then
		echo "Processing $f"
		ffmpeg -i "$f" "${f/%.mp4/.mp3}"
	fi
done
