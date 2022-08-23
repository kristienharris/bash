#!/bin/bash
echo 'This script converts an image to a specified file format'
read -p 'Enter filename to convert: ' file
read -p 'Enter desired file formats: ' format

filepath="$PWD/$file"
filename="${file%.*}"
extension="${file##*.}"

for i in ${format[@]}; do
    if [ "${format[$i]}" = "base64" ]; then
        cat "$filepath" | base64 -w 0 > $filename"_"$i"."txt
        echo "Conversion complete" $filename"_"$i"."txt
    else
        newFile=$filename"."$i
        magick "$filepath" $newFile
        echo "Conversion complete" $newFile
    fi
done