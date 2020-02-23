#!/usr/bin/env perl
#
# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

use strict;
use warnings;


binmode STDOUT, ":utf8";
use utf8;
 
use JSON;

my $num_args = $#ARGV + 1;
if ($num_args != 2) {
    print "Usage: tvtropes_num_tropes.pl <json_file> <max_tropes>\n";
    exit;
}

my $DEBUG = 1;
my $max_tropes = $ARGV[1];
my $min_tropes = $ARGV[2];
my $ngram_size = $ARGV[2];
my $add_film_name = $ARGV[3];
my $output_dir = "output";
my $shuffle = 1;

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

foreach $key (keys %{$data}) { # foreach film name
  $film_data = $data->{$key};
  my $num_tropes = scalar @{$film_data};

  if ($num_tropes <= $max_tropes) {
     foreach my $value (@{$film_data}) { # creating tropes set
        $tropes{$value}= "";
     }
  } else {
     delete $data->{$key}; # remove film
  }
}

my $size = keys %tropes;

print "$max_tropes $size\n"; 
