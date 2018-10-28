#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Must supply either server or ws as first argument"
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
    
fi


