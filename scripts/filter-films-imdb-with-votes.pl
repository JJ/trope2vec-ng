#!/usr/bin/perl

use strict;

my $url = "https://tvtropes.org/pmwiki/pmwiki.php/Film/";




require LWP::UserAgent;
 
 my $ua = LWP::UserAgent->new;
 $ua->timeout(20);
 
# 1. The Dark Knight (2008)
my $line = "";
while (<>) {
  my $temp = $_;
  chomp($temp);
  $line = $line . " $temp ";
  if (/\d+\. (.*) \(\d+\)/) {
    my $film_title = $1;
    $film_title =~ s/\s//g;
    print $film_title;
    $film_title = "";
 
    if ($line =~ /Votes: (\S+) /) {
       print ";$1\n";
       $line = "";
    }
  }
}
