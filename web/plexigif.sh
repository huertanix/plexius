#!/bin/sh
PIX_DIR=/home/pi/pix/
TMP_DIR=/home/pi/tmp/

echo 'making a HARD G gif'

cp $PIX_DIR* $TMP_DIR

for file in $TMP_DIR*; do
  echo "processing $file"
  convert $file -resize 400 -rotate '90' -quality 75 $file;
done

rm life.gif
echo 'Removed old gif. A new day begins.'
# 10 seconds between each frame, loop forevers
convert -delay 10 -loop 0 $TMP_DIR*.jpg life.gif

rm $TMP_DIR*
echo 'New gif! Yay!'
