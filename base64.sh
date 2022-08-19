#!/bin/bash
echo 'This script converts and image to a base64 text file and saves it in the same directory'
read -p 'Enter filename without extension: ' filename
read -p 'Enter filetype without period: ' filetype
cat $filename.$filetype | base64 -w 0 > $filename_$filetype.txt
echo 'Conversion complete text file created' $filename.txt