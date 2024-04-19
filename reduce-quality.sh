#!/bin/bash

for f in *; do 
	if [ "$f" != "reduce-quality.sh" ]; then
		echo "Processing $f"
		convert "$f" -quality 10% "conv$f";
	fi
done
echo "All done :)"	
