#!/usr/bin/env bash


#
# Repository for an early-21st-century version of gradle:
add-apt-repository ppa:cwchien/gradle
apt-get update


#########################################################
### Install packages required for HC MID editing ###########
#########################################################

# Clean up any catastrophic reformatting that
# 'git clone' could introduce on a Windows box:
apt-get install -y dos2unix
/usr/bin/dos2unix /vagrant/system/*sh
/usr/bin/dos2unix /vagrant/system/dotprofile
/usr/bin/dos2unix /vagrant/scripts/*sh

# and add bomstrip utils in case XML Copy Editor
# or evil Windows software tries to insert a BOM
# in your editorial work:
apt-get install -y bomstrip

# version control
apt-get install -y git

# an easy editor
apt-get install -y nano


# JDK bundle
apt-get install -y openjdk-7-jdk
apt-get -y install groovy
apt-get -y install gradle

# XML editor
apt-get install -y xmlcopyeditor


#########################################################
### Markdown bundle
#########################################################

apt-get -y install mdpress
apt-get -y install retext
apt-get -y install pandoc



#########################################################
### Latin parsing
#########################################################

apt-get -y install sfst

cd /vagrant
/usr/bin/git clone https://github.com/goldibex/parsley-core.git



#########################################################
### Configure system and user settings        ###########
#########################################################

# System settings: default to US Eastern time for HC MID:
timedatectl set-timezone America/New_York

# Set up vagrant user account:
cp /vagrant/system/dotprofile /home/vagrant/.profile
chown vagrant:vagrant /home/vagrant/.profile
if [ ! -e "/home/vagrant/Desktop/shared" ]; then
    ln -s /vagrant /home/vagrant/Desktop/shared
fi

# Remove unneeded apps from base machine:
apt-get -y remove transmission
apt-get -y remove sylpheed
apt-get -y remove mtpaint
apt-get -y remove simple-scan
apt-get -y remove audacious
apt-get -y remove guvcview
apt-get -y remove gnome-mplayer
apt-get -y remove xfburn
apt-get -y remove abiword
apt-get -y remove gnumeric
apt-get -y remove pidgin
apt-get -y remove transmission-gtk


# Add Atom:
echo "Downloading .deb file for Atom"
/usr/bin/wget https://github.com/atom/atom/releases/download/v1.0.11/atom-amd64.deb 2> /tmp/atom-log.txt
echo "Download complete, installing Atom"
/usr/bin/dpkg --install atom-amd64.deb
# Pretty sure you need this:
apt-get -f install
echo "Atom installed. "
#echo "You can safely ignore any error messages about 'dependency problems - leaving unconfigured'."
#echo "This is only because we're running a newer version of Ubuntu than Atom expects."
echo "You should find an icon for Atom in the 'Programming' section of your start menu."
