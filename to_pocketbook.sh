#!/bin/bash

# a bash script (need imagemagick >6.8.3-10) who will convert pictures for pocketbook with an inteligent minimal weight

echo '/!\ Warning !'
echo 'This program will crawl your current folder'
echo 'Convert to PocketBook format your pictures (758x1024) grayscale jpeg'
echo 'will replace (if same filename) or erase (different filename) the original file'
echo 'including not pictures files'
echo 'so if you are not sure of what you do :'
echo 'cancel the process (ctrl+c), else press enter'

read

size_x=758
size_y=1024
output_format=jpg

for file in $(find ./ -type f ); do
  # replace old extention by output_format
  new_file="${file%.*}.${output_format}"

  convert -strip -interlace Plane -grayscale Rec709Luma -resize "${size_x}x${size_y}"^ "$file" "$new_file"

  # ephemeral: is blocked since 6.9.4-7
  # http://www.imagemagick.org/discourse-server/viewtopic.php?t=29588
  if [ "$file" != "$new_file" ]; then
    rm "$file"
  fi
done
