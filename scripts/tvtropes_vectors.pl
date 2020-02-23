#!/usr/bin/env perl 
#
# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

use strict;
use warnings;

use List::Util qw/shuffle/;
use Algorithm::Combinatorics qw(combinations);


binmode STDOUT, ":utf8";
use utf8;
 
use JSON;

my $num_args = $#ARGV + 1;
if ($num_args != 4) {
    print "Usage: tvtropes.pl <json_file> <max_tropes> <ngram_size> <add_film_name>\n";
    exit;
}

my $DEBUG = 0;
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

open my $fh, ">", "$output_dir/films_$max_tropes" . "_taken_$ngram_size.txt";

foreach $key (keys %{$data}) { # foreach film name
  $film_data = $data->{$key};
  my $num_tropes = scalar @{$film_data};

  if ($DEBUG) { print "$key num_tropes: $num_tropes\n"; } # if DEBUG print all films

  if ($num_tropes <= $max_tropes && $num_tropes >= $min_tropes) {
     print $fh "$key num_tropes: $num_tropes\n";
     foreach my $value (@{$film_data}) { # creating tropes set
        $tropes{$value}= "";
     }
  } else {
     delete $data->{$key}; # remove film
  }
}
close $fh;

open $fh, ">", "$output_dir/tropes_set_$max_tropes". "_taken_$ngram_size.txt";
foreach $key (keys %tropes)
{
   print $fh "$key\n";
}
close $fh;
