#! /usr/bin/env bash

for file in ./images/image-?.jpg; do
    filename="${file%.*}"
    echo "Checking ${filename}..."

    width=$(identify -format '%w' "${file}")
    height=$(identify -format '%h' "${file}")
    
    if [[ width -le 100 || height -le 100 ]]; then
        continue
    fi

    if [[ ! -e "${filename}-thumbnail.jpg" ]]; then
        echo "Creating ${filename}-thumbnail.jpg..."
        convert "${file}" -resize 100x100 "${filename}"-thumbnail.jpg
    fi

echo 'Thumbnails ready!'

done

