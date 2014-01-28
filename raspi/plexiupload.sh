#!/bin/sh
echo 'Uploading to THE PLUME'
rsync --progress -ab --recursive ~/pix/ pi@93.95.227.123:/home/pi/pix/
echo 'Completed upload to THE PLUME'
