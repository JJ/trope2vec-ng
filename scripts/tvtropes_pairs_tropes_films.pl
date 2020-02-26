#!/usr/bin/env perl
#
# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

# This script create a file with all pairs <film_name> <trope_name> included in input file tvtropes.json

use strict;
use warnings;

use List::Util qw/shuffle/;
use Algorithm::Combinatorics qw(combinations);


binmode STDOUT, ":utf8";
use utf8;
 
use JSON;

my $num_args = $#ARGV + 1;
if ($num_args != 1) {
    print "Usage: tvtropes_pairs_tropes_films.pl <json_file>\n";
    exit;
}

my $DEBUG = 1;
my $output_dir = "output";
my $shuffle = 1;
my $max_tropes = 0;
my $min_tropes = 99999999999;

my $json;

my $file_name = $ARGV[0] // "tvtropes.json";
{
  local $/; #Enable 'slurp' mode
  open my $fh,'<', "$file_name" or die "can't open file: $!";
  $json = <$fh>;
  close $fh;
}

my $key;
my $data = decode_json($json);
my %tropes;
my $film_data;
my $film_name = "";

open my $fh_films, ">", "$pairs_tropes_films.txt";

foreach $key (keys %{$data}) { # foreach film name
  $film_name = $key;
  $film_data = $data->{$key};
  my $num_tropes = scalar @{$film_data};
  
  foreach my $value (@{$film_data}) { # creating tropes set
        print $fh_films "$film_name $value\n";
  }
}
close $fh_films;
