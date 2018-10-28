#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

myuser='dsmyers'
myhome="/home/$myuser"
cp ./google.repo /etc/yum.repos.d/
yum install -y unzip curl wget perl vim epel-release gvim ansible python-pip
yum -y update

cp ./.vimrc $myhome
cp ./.bashrc $myhome
cp ./.inputrc $myhome
cp ./.bc $myhome
chown -R $myuser: $myhome

./get-vim-perl.pl

cp ./comments.templates $myhome/.vim/perl-support/templates/comments.templates
cp ./idioms.templates $myhome/.vim/perl-support/templates/idioms.templates




