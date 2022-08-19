#!/bin/bash
echo 'This script converts an image to a specified file format'
read -p 'Enter filename to convert: ' file
read -p 'Enter desired file formats: ' format

filename="${file%.*}"
extension="${file##*.}"

for i in ${format[@]}; do
    if [ "${format[$i]}" = "base64" ]; then
        cat $file | base64 -w 0 > $filename_$i"."txt
        echo "Conversion complete" $filename_$i"."txt
    else
        newFile=$filename"."$i
        magick $file $newFile
        echo "Conversion complete" $newFile
    fi
done