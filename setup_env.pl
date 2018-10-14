#!/bin/bash

myhome='/home/myerds'
myuser='myerds'
cp ./google.repo /etc/yum.repos.d/
yum install -y wget perl epel-release vim ansible python-pip
yum -y update

cp ./.vimrc $myhome
cp ./.bashrc $myhome
cp ./.inputrc $myhome
cp ./.bc $myhome
chown -R $myuser: $myhome

./get-vim-perl.pl

cp ./comments.templates $myhome/.vim/perl-support/templates/comments.templates
cp ./idioms.templates $myhome/.vim/perl-support/templates/idioms.templates
cp ./gtk.css $myhome/.config/gtk-3.0



