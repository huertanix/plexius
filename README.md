Plexius
=======

Plexius is an open hardware lifecam system for Flickr I'm building while waiting for Narrative to launch. It combines the familiar look of older forms of wearable technology (traditional cameras with neck straps) with a DIY open hardware aesthetic. It also takes a photo every minute and uploads it to Flickr via wifi.

Dependencies
------------

For the Plexius code, you'll want these things:
* Ruby 1.9
* flickraw gem

For the Plexius case, you'll want these:
* Access to a 3D printer
* Access to a laser cutter
* Patience

A full BOM for open hardware used is included (BOM.md)

Install
-------

If you don't yet have Raspbian installed on an SD card for your Raspi, instructions for doing that (in Linux) are here: 

http://n00blab.com/how-to-create-raspberry-pi-sd-card/

To install/configure the raspberry pi camera with your pi, follow the instructions here: 

http://www.raspberrypi.org/camera

The camera install steps assume Raspbian, but other Linux distros like Arch might work too, try them out!

You'll want some form of wifi to use to upload photos to The Cloud. You can configure your raspi to use a specific wifi AP like so:

Change your /etc/network/interfaces on the raspi to look like this:

    auto lo

    iface lo inet loopback
    iface eth0 inet dhcp

    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface default inet dhcp
    wpa-ssid "accesspointname"
    wpa-psk "accesspointpassphrase"

License
-------

Unless where otherwise noted, this application's software is distributed under the Chicken Dance License (CDL). Please see the included copy of the license (CDL-LICENSE.txt) for deets and the included example instructions for the chicken dance (DANCE.txt). Video delivery may be conducted via electronic mail by sending a link to the video file directly or through an HTML5-based online viewer, encoded in *Ogg Theora* format to huertanix at ieee dot org. Physical video delivery will only be accepted in *HD-DVD* format and must be delivered to the following address:

> David Huerta  
> P.O. Box 2182  
> Tempe, Arizona 85280-2182  