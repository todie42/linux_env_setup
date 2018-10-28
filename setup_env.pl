#!/bin/bash

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


