#!/bin/sh
echo 'Uploading to server...'
rsync --progress -ab --recursive ~/pix/ pi@93.95.227.123:/home/pi/pix/
echo 'Upload complete.'
