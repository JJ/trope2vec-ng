#!/usr/bin/env perl
#

# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

# Create a list of trope and rankig value from a subset of tropes

use strict;
use warnings;

use List::Util qw/shuffle/;
use Algorithm::Combinatorics qw(combinations);


binmode STDOUT, ":utf8";
use utf8;
 
use JSON;

my $trope_name = "";
my $trope_frequency = "";

my $num_args = $#ARGV + 1;
if ($num_args != 2) {
    print "Usage: create-subset-15-ranking.pl <all-films-ranking> <15-subset-sort>\n";
    exit;
}

my $DEBUG = 1;
my $file_15_subset = $ARGV[1];
my $file_all_films = $ARGV[0];


open my $fh_all_films, '<', "$file_all_films" or die "can't open file: $!";
chomp(my @lines_all_films = <$fh_all_films>);
close $fh_all_films;

open my $fh_15_subset, '<', "$file_15_subset" or die "can't open file: $!";
chomp(my @lines_15_subset = <$fh_15_subset>);
close $fh_15_subset;

my $i = 0;

foreach my $element (@lines_all_films) {
  ($trope_name, $trope_frequency) = split(";", $element);
  my $trope_name_15 = $lines_15_subset[$i];
  if ($trope_name_15 eq $trope_name) {
    print "$trope_name " . "$trope_frequency\n";
    $i++;
  } else {

  }
  last if ($i > $#lines_15_subset);
}
