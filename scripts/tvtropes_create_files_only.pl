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
if ($num_args != 1) {
    print "Usage: tvtropes_create_files_only.pl <json_file>\n";
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

open my $fh_films, ">", "$output_dir/all_films.txt";

foreach $key (keys %{$data}) { # foreach film name
  $film_data = $data->{$key};
  my $num_tropes = scalar @{$film_data};
  
  if ($num_tropes > $max_tropes) { $max_tropes = $num_tropes; }
  if ($num_tropes < $min_tropes) { $min_tropes = $num_tropes; }

  print $fh_films "$key num_tropes $num_tropes\n"; # create all films file

  foreach my $value (@{$film_data}) { # creating tropes set
        $tropes{$value}= "";
  }
}
close $fh_films;

open my $fh, ">", "$output_dir/all_tropes.txt";
foreach $key (keys %tropes)
{
   print $fh "$key\n";
}
close $fh;

print "min_tropes = $min_tropes\n";
print "max_tropes = $max_tropes\n";
