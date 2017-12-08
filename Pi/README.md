# Connect to network

First order of business, was to connect to my WiFi, which had to be done via the KVM Interface.  Click on the Network Interface Icon, which is two Xs and just to the left of the speaker icon, to show the available WiFi Routers.
<br>

![alt text][WiFi]

[WiFi]: https://github.com/DonBower/rocket/blob/master/Pi/SelectWiFi.png "Select WiFi"

<br>

Enter the Password...
<br>

![alt text][Password]

[Password]: https://github.com/DonBower/rocket/blob/master/Pi/EnterWiFiPassword.png "Enter WiFi Password"

<br>

After a few moments, your RaspberryPi should be connected to the network.  Hover the mouse over the WiFi Icon to show the status and address:

<br>

![alt text][Connected]

[Connected]: https://github.com/DonBower/rocket/blob/master/Pi/WiFiConnected.png "Your WiFi is connected"

<br>


# Firmware/OS Updates

Next we update/upgrade the OS to the latest version, as well as the RaspberryPi Firmware.  <br />

```
sudo apt-get -y update
sudo rpi-update
```

At this point, your system may have actually performed a firmware update.  And a brave man may continue on and reboot later.  I am not that brave. `sudo shutdown -r now` if you are so inclined.


```
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo shutdown -r now
```

# SSH Interface

Next order of business is get a ssh key. (Take all defaults)

```
ssh-keygen
```

Copy the public SSH key to GitHub per the instructions documented in https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/<br>

Now is a perfect oppertunity to enable SSH, so that you can access your Pi via terminal from other devices.

`sudo raspi-config`
Interfacing Options > P2 Enable SSH > Enable SSH.
<br>

![alt text][Main]

[Main]: https://github.com/DonBower/rocket/blob/master/Pi/Interfacing%20Options.png "raspi-config Main Screen"

<br>

![alt text][P2SSH]

[P2SSH]: https://github.com/DonBower/rocket/blob/master/Pi/P2%20Enable%20SSH.png "raspi-config P2 Enable SSH"

<br>

![alt text][SSH]

[SSH]: https://github.com/DonBower/rocket/blob/master/Pi/Enable%20SSH.png "raspi-config Enable SSH"

<br>

Reboot with `sudo shutdown -r now`


# Git/GitHub

Then it's time to get git, and configure the git Global Variables <br />

```
sudo apt-get -y install git
git config --global user.name "Don Bower"
git config --global user.email "Don.Bower@outlook.com"
```

Next Create a *developer* directory, and clone this repository from there.  The *developer* directory is standard practice for modern developers. Some use lowercase for the name, but since on the RaspberryPi, and my Mac, all the other preloaded directories are capitalized, (i.e. Documents, Pictures, etc...) I'll follow form. <br />

```
mkdir ~/developer
cd ~/developer
git clone git@github.com:DonBower/rocket.git
```

If you need updates from github, use git pull:

```
cd ~/developer/rocket
git pull origin master
```

# External Storage (USB Stick)

Due to the limited number of sensors, no exteranl storage is used for this project.
We will simply use the /mnt/usbstick directory in the root fs.


# Autostart
To start the four programs automatically on boot (useful for use when you have no access to the pi in the field), edit the crontab (`sudo crontab -e -u pi`) and add the following line:

```
@reboot /home/pi/developer/rocket/startup.sh
```
