#!/bin/sh
server_ip="93.95.227.123"
server_path="/var/www/plexius/web/gallery/"
echo 'Uploading to server...'
rsync --progress -ab --recursive --remove-source-files ~/pix/ pi@$server_ip:$server_path
echo 'Upload complete.'
