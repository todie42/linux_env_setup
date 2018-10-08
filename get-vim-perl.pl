#!/usr/bin/env perl

use strict;
use warnings;
use utf8;


my $home = $ENV{HOME};
chomp(my $date = `date +%s`);
my $wget_out = 'vim_perl.html';
my $ide_url = "https://www.vim.org/scripts/script.php?script_id=556";

my $vim_dir = "$home/.vim_$date";
if (-d "$home/.vim") {
  system("mv $home/.vim $home/.vim_orig_$date");
}
mkdir $vim_dir;
system("cd $home && ln -s .vim_$date .vim");

if (not -f "./$wget_out") {
  system("wget -O $wget_out $ide_url") if not -f "./$wget_out";
}

my $index;
open my $fh, '<', $wget_out or die "Could not open file '$wget_out' $!";
while (<$fh>) {
  if ($_ =~ /href=\"download_script\.php\?src_id=(\d+)\">perl-support.zip/) {
    $index = $1;
    print "$index\n";
    last;
  }  
}

unlink "./$wget_out";

system("wget -O perl-support.zip https://www.vim.org/scripts/download_script.php?src_id=$index") if not -f "./perl-support.zip";
system("mv ./perl-support.zip $vim_dir");
chdir $vim_dir;
system("unzip ./perl-support.zip");
unlink "./perl-support.zip";


