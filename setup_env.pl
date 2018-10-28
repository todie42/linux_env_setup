#!/bin/bash

<<<<<<< HEAD
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

myhome='/home/myerds'
myuser='myerds'
cp ./google.repo /etc/yum.repos.d/
yum install -y epel-release gvim ansible python-pip
=======
if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Please choose server or ws"
    exit 1
fi

#myuser=`whoami`
myuser='dsmyers'
myhome="/home/$myuser"
yum install -y curl wget perl epel-release vim ansible python-pip unzip
>>>>>>> e677c144859b833520000a9c66aafd876f53144f
yum -y update

cp ./.vimrc $myhome
cp ./.bashrc $myhome
cp ./.inputrc $myhome
cp ./.bc $myhome
chown -R $myuser: $myhome

./get-vim-perl.pl

cp ./comments.templates $myhome/.vim/perl-support/templates/comments.templates
cp ./idioms.templates $myhome/.vim/perl-support/templates/idioms.templates


if [ $1 = 'ws' ]; then
    cp ./google.repo /etc/yum.repos.d/
    cp ./gtk.css $myhome/.config/gtk-3.0
fi


