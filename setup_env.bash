#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Must supply either server or ws as first argument"
    exit 1
fi



myuser='dsmyers'
myhome="/home/$myuser"
yum install -y unzip curl wget perl vim epel-release ansible python-pip
yum -y update

cp ./.vimrc $myhome
cp ./.bashrc $myhome
cp ./.inputrc $myhome
cp ./.bc $myhome
chown -R $myuser: $myhome

./get-vim-perl.pl

cp ./comments.templates $myhome/.vim/perl-support/templates/comments.templates
cp ./idioms.templates $myhome/.vim/perl-support/templates/idioms.templates

if [ $1 = 'ws' ];
  then
    cp ./google.repo /etc/yum.repos.d/
    yum install -y gvim
    yum install -y google-chrome-stable
    unzip ./nohotcorner-master.zip
    mv ./nohotcorner-master /home/$myuser/.local/share/gnome-shell/extensions/nohotcorner@azuri.free.fr
    chown -R $myuser: /home/$myuser/.local/share/gnome-shell/extensions/nohotcorner@azuri.free.fr
    cp ./gtk.css /home/$myuser/.config/gtk-3.0/
    chown $myuser: /home/$myuser/.config/gtk-3.0/gtk.css
fi


