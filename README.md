Plexius
=======

Plexius is an open hardware lifecam system I'm building while waiting for Narrative to launch. It combines the familiar look of older forms of wearable technology (traditional cameras with neck straps) with a DIY open hardware aesthetic. It also takes a photo every minute and uploads it to the server of your choice via wifi and rsync.

Dependencies
------------

For the Plexius code, you'll want these things:
* Ruby 1.9

For the Plexius case, you'll want these:
* Access to a 3D printer
* Access to a laser cutter
* Patience

A full BOM for open hardware used is included (BOM.md)

Install
-------

For the server, if you want to store photos, you'll want to make a "pix" directory in the home directory of the user you want to connect as ("pi" is the default raspberry pi user and the existing scripts default to it).

If you don't yet have Raspbian installed on an SD card for your Raspi, instructions for doing that (in Linux) are here: 

http://n00blab.com/how-to-create-raspberry-pi-sd-card/

To install/configure the raspberry pi camera with your pi, follow the instructions here: 

http://www.raspberrypi.org/camera

The camera install steps assume Raspbian, but other Linux distros like Arch might work too, try them out!

You'll want some form of wifi to use to upload photos to The Cloud. You can configure your raspi to use a specific wifi AP like so:

Change your /etc/wpa_supplicant/wpa_supplicant.conf on the raspi to look like this, but with your wifi connection's ssid and passphrase:

    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1

    network={
        ssid="NYCR24"
        psk="clubmate"
        key_mgmt=WPA-PSK
    }

After wifi is set up you can use a bunch of uber leet haxor commands to reload the wifi config, or you can reboot the pi, thus reloading the wifi config with:

    sudo reboot

You can verify whether wifi works or not by pinging your favorite website:

    ping www.flyingsexsnak.es

Once wifi is working, you'll want to git clone this repository. To keep this simple we'll do this from /home/pi :

    git clone https://github.com/huertanix/plexius.git

In the raspi directory of the cloned repository, configure up the plexiupload script to use the IP address of the place you server you plan to upload to instead of mine. Instructions on how to set up certificate-based authentication can be found here:

    http://www.jveweb.net/en/archives/2010/08/passwordless-ssh-using-digital-signatures.html

Next, plexicheese.rb script to run on startup and plexiupload to run every hour by adding it to the pi user's crontab:

    crontab -e

In your crontab, add these lines at the end:

    @reboot ruby /home/pi/plexius/raspi/plexicheese.rb
    @hourly /home/pi/plexius/raspi/plexiupload.sh

Documentation exists for how to connect to the raspi to the camer and the LiPo Rider Pro to the Lipo battery in various pitstops of the Information Superhighway, so I won't dive into that here.

Once everything is connected, you can wear the camera around and show the internet how cool your daily life is.

License
-------

Unless where otherwise noted, this application's software is distributed under the Chicken Dance License (CDL). Please see the included copy of the license (CDL-LICENSE.txt) for deets and the included example instructions for the chicken dance (DANCE.txt). Video delivery may be conducted via electronic mail by sending a link to the video file directly or through an HTML5-based online viewer, encoded in *Ogg Theora* format to huertanix at ieee dot org. Physical video delivery will only be accepted in *HD-DVD* format and must be delivered to the following address:

> David Huerta  
> P.O. Box 2182  
> Tempe, Arizona 85280-2182  
