Plexius
=======

Plexius is an open hardware lifecam system I'm building while waiting for Narrative to ship. It combines the familiar look of older forms of wearable technology (traditional cameras with neck straps) with a DIY open hardware aesthetic. It also takes a photo every minute and uploads it to the server of your choice via wifi and rsync.

Dependencies
------------

For the Plexius raspi code, you'll want these things:
* Ruby 1.9
* ruby-dev
* OpenSSH
* PiPiper gem

For the Plexius case, you'll want these:
* Access to a 3D printer
* Access to a laser cutter
* Patience

For the server, you'll want:
* Imagemagick
* OpenSSH
* Some kind of web server if you want to have pics online

A full BOM for open hardware used is included (BOM.md)

Server Installation
-------------------

For the server, if you want to store photos, you'll want to make a "pix" directory in the home directory of the user you want to connect as. In this case, "pi" is the default raspberry pi user and assumes the same user name is being used on the server.

Assuming Raspbian is already installed on your raspi, log into the raspi (*not from the server*) as the user you want to upload photos as (default is pi) and generate a key pair:

    ssh-keygen -t rsa -b 2048

Hit enter when asked for the file location and enter for no passphrase. Once the key pair is saved, upload the public key to your server:

    scp /home/pi/.ssh/id_rsa.pub pi@yourserverdomainoripaddress:/home/pi/.

This is the first time you are connecting to this server, presumably, so type in "yes" to continue connecting.

Next, log into your server and create a .ssh folder in /home/pi (if it's not already there):

    mkdir .ssh

...and add your raspi's public key to the server's authorized keys file and make sure the permissions are correct:

    cat id_rsa.pub >> ~/.ssh/authorized_keys
    chmod 700 /home/pi/.ssh
    chmod 600 /home/pi/.ssh/authorized_keys

More detailed instructions on certificate-based authentication can be found here: http://www.jveweb.net/en/archives/2010/08/passwordless-ssh-using-digital-signatures.html

Raspi Installation
------------------

If you don't yet have Raspbian installed on an SD card for your Raspi, instructions for doing that (in Linux) are here: 

http://n00blab.com/how-to-create-raspberry-pi-sd-card/

To install/configure the raspberry pi camera with your pi, follow the instructions here: 

http://www.raspberrypi.org/camera

The camera install steps assume Raspbian, but other Linux distros like Arch might work too, try them out!

You'll want some form of wifi to use to upload photos to The Cloud. You can configure your raspi to use a specific wifi AP like so:

Change your /etc/wpa_supplicant/wpa_supplicant.conf on the raspi to look like this, but with your wifi connections's ssids and passphrases:

    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1

    network={
        ssid="NYCR24"
        psk="clubmate"
        key_mgmt=WPA-PSK
    }

    network={
        ssid="heatsynclabs"
        psk="hacktheplanet"
        key_mgmt=WPA-PSK
    }

Older parts of the internet will tell you to edit /etc/network/interfaces, but the internet is full of lies and you should leave that file untouched. Just in case you edited your interfaces file anyway, this is what the default looks like:

    auto lo

    iface lo inet loopback
    iface eth0 inet dhcp

    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface default inet dhcp

After wifi is set up you can use a bunch of uber leet haxor commands to reload the wifi config, or you can reboot the pi, thus reloading the wifi config with:

    sudo reboot

You can verify whether wifi works or not by pinging your favorite website:

    ping www.flyingsexsnak.es

Once wifi is working, you'll want to git clone this repository. To keep this simple we'll do this from /home/pi :

    git clone https://github.com/huertanix/plexius.git

In the raspi directory of the cloned repository, configure up the plexiupload.sh script to use the IP address of the place you server you plan to upload to instead of mine.

Next, plexicore.rb script to run on startup, plexicheese.rb to run every minute and plexiupload.sh to run every hour by adding it to the raspi pi user crontab:

    crontab -e

In your crontab, add these lines at the end:

    @reboot ruby /home/pi/plexius/raspi/plexicore.rb
    */1 * * * * ruby /home/pi/plexius/raspi/plexicheese.rb
    @hourly /home/pi/plexius/raspi/plexiupload.sh

Documentation exists for how to connect to the raspi to the camera and the LiPo Rider Pro to the Lipo battery in various pitstops of the Information Superhighway, so I won't dive into that here.

Once everything is connected, you can wear the camera around and show the internet how cool your daily life is.

License
-------

Unless where otherwise noted, this application's software is distributed under the Chicken Dance License (CDL). Please see the included copy of the license (CDL-LICENSE.txt) for deets and the included example instructions for the chicken dance (DANCE.txt). Video delivery may be conducted via electronic mail by sending a link to the video file directly or through an HTML5-based online viewer, encoded in *Ogg Theora* format to huertanix at ieee dot org. Physical video delivery will only be accepted in *HD-DVD* format and must be delivered to the following address:

> David Huerta  
> P.O. Box 2182  
> Tempe, Arizona 85280-2182  
