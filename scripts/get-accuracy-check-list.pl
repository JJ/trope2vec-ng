#!/usr/bin/env perl
#

# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 
# 
# Create checking list with following format:
#  <film1> <top_trope_film1> <film2> <top_trope_film2>
#  <film1> <top_trope_film1> <film3> <top_trope_film3>
#  <film1> <top_trope_film1> <film4> <top_trope_film4>
#  <film2> <top_trope_film2> <film1> <top_trope_film1>
#  <film2> <top_trope_film2> <film3> <top_trope_film3>
#  <film2> <top_trope_film4> <film1> <top_trope_film4>
#  <film3> <top_trope_film3> <film1> <top_trope_film1>
# .... 

use strict;
use warnings;

use List::Util qw/shuffle/;
use Algorithm::Combinatorics qw(combinations);


binmode STDOUT, ":utf8";
use utf8;
 
my $num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "Usage: get-accuracy-check-list.pl <top-rank-films-with-tropes>\n";
    exit;
}

my $DEBUG = 1;
my $file_films_with_tropes = $ARGV[0];
my $output_dir = ".";


open my $fh_films_tropes, '<', "$file_films_with_tropes" or die "can't open file: $!";
chomp(my @lines_films_tropes = <$fh_films_tropes>);
close $fh_films_tropes;


# FilmName;TropeName;TropeRank
# Inception;BigBad;3430

my $film_name="";
my $trope_name="";
my $trope_frequency="";

my $film_name2="";
my $trope_name2="";
my $trope_frequency2="";

foreach my $element (@lines_films_tropes) {
($film_name, $trope_name, $trope_frequency) = split(" ", $element);

   foreach my $element2 (@lines_films_tropes) {
      ($film_name2, $trope_name2, $trope_frequency2) = split(" ", $element2); 
      my $string1 = lc "$film_name $trope_name";
      my $string2 = lc "$film_name2 $trope_name2";
      if ($string1 eq $string2) {

      } else {
         print "$string1 $string2\n";
      } 
   }
}

close $fh_films_tropes;
