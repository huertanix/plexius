#!/bin/sh
echo 'Uploading to ICE KINGDOM'
rsync -ab --recursive ~/pix/ pi@93.95.227.123:/home/pi/pix/
echo 'Completed upload to ICE KINGDOM'
