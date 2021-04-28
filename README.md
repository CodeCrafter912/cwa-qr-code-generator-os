# cwa-qr-code-generator-os
[![Build Release](https://github.com/CodeCrafter912/cwa-qr-code-generator-os/actions/workflows/release.yml/badge.svg)](https://github.com/CodeCrafter912/cwa-qr-code-generator-os/actions/workflows/release.yml)  
A tiny OS for raspberry pis which run the [cwa-qr-code-generator](https://github.com/CodeCrafter912/cwa-qr-code-generator)

# Installation
For installing, please follow these steps:
1. Download the [latest release](https://github.com/CodeCrafter912/cwa-qr-code-generator-os/releases/latest)
2. Flash the image to an SD card
3. Look into the partition `cwa-qr-boot` and edit the files `cwa-qr.conf` adn `cwa-wifi.conf` according to your needs, see [configuration](#Configuration)
4. Put the SD card into a raspberry pi
5. Boot it up :)

# Configuration
The configuration is done via the files `cwa-qr.conf` adn `cwa-wifi.conf` on the `cwa-qr-boot` partition of the sd card.
### `cwa-qr.conf`
This file contains the details about your location. By default, the file is fully set-up with an example configuration.

### `cwa-wifi.conf`
This file contains you wifi configuration. You only need to edit it if you want to have your pi pull the current date and time from an ntp server.
It has the format of a `wpa_supplicant.conf`. For basic wifis with Wpa2 PSK, the provided example shloud work, for more advanced configuration, there are examples available [over here](https://www.systutorials.com/docs/linux/man/5-wpa_supplicant.conf/).

# Building
To build, clone the repo and run these commands: (tested on Ubuntu 20.04)
```
git clone https://github.com/CodeCrafter912/cwa-qr-code-generator-os.git
cd cwa-qr-code-generator-os
git submodule update --init
make raspberrypi0w_defconfig
make raspberrypi0w_all
```
Plase note: depending on your CPU this may take several hours. It will consume about 10G of storge.
