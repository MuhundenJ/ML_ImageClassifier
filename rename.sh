#! /bin/bash

for file in *.tif; do
	
	base=`echo ${file} | sed -e "s/DefaultText_/Territory_/g"`

	mv "$file" "$base"
done

