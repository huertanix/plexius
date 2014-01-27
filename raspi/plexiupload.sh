#!/bin/sh
echo 'Uploading to ICE KINGDOM'
rsync -ab --recursive ~/plexius/ pi@93.95.227.123:/home/pi/plexius/
echo 'Completed upload to ICE KINGDOM'