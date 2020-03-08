#!/usr/bin/env perl
#

# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 
#  create a list with film name and its associated top trope from tvtropes.org

use strict;
use warnings;

use List::Util qw/shuffle/;
use Algorithm::Combinatorics qw(combinations);


binmode STDOUT, ":utf8";
use utf8;
 
use JSON;

my $num_args = $#ARGV + 1;
if ($num_args != 3) {
    print "Usage: get-list-most-popular-tropes-by-film.pl <json_file> <tropes_ranking_file> <top-rank-films>\n";
    exit;
}

my $DEBUG = 1;
my $file_all_tropes = $ARGV[1];
my $top_rank_films = $ARGV[2];
my $max_tropes = 15;
my $min_tropes = 2;
my $ngram_size = 9;
my $add_film_name = 0;
my $output_dir = ".";
my $shuffle = 1;
my $to_lowercase = 1;
my $json;

# create output directory if not exist
if (-e $output_dir and -d $output_dir) {
    # do nothing
} else {
    `mkdir $output_dir`;
}


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

open my $fh_all_tropes, '<', "$file_all_tropes" or die "can't open file: $!";
chomp(my @lines_all_tropes = <$fh_all_tropes>);
close $fh_all_tropes;

open my $fh_top_films, '<', "$top_rank_films" or die "can't open file: $!";
chomp(my @lines_top_films = <$fh_top_films>);
close $fh_top_films;

my %top_films;

# Rank;Title;Year;IMDb Rating
# 1;TheShawshankRedemption;1994;9,2

# new version:
# thoroughlymodernmillie 5706

foreach my $element (@lines_top_films) {
  # (my $film_rank, my $film_name, my $film_year, my $film_imdb_rank) = split(";", $element);
  (my $film_name, my $film_imdb_rank) = split(" ", $element);
  $top_films{$film_name} = $film_imdb_rank;
}

my %tropes_ranking;
my $trope_name = "";
my $trope_frequency = "";

foreach my $element (@lines_all_tropes) {
  ($trope_name, $trope_frequency) = split(";", $element);
  $trope_name = lc $trope_name;
  #if exist $tropes_ranking{$trope_name} then add new frequency
  if (exists($tropes_ranking{$trope_name})) {
     print "Repeated $trope_name previous rank: $tropes_ranking{$trope_name} new_rank: $tropes_ranking{$trope_name} + $trope_frequency\n";
     $tropes_ranking{$trope_name} = $tropes_ranking{$trope_name} + $trope_frequency;
  } else {
     $tropes_ranking{$trope_name} = $trope_frequency; 
  }
}



open my $fh_films, ">", "$output_dir/films.txt";
open my $fh, ">", "$output_dir/films_$max_tropes" . "_taken_$ngram_size.txt";

foreach $key (keys %{$data}) { # foreach film name
  $film_data = $data->{$key};
  my $num_tropes = scalar @{$film_data};

  # print $fh_films "$key $num_tropes\n"; # create all films file

  my $max_frequency = 0;
  my $top_rank_trope = "";

  # include all tropes less or equal than $max_tropes and great or equal than 2
  if ($num_tropes <= $max_tropes && $num_tropes >= 1) {
     # print $fh "$key $num_tropes\n";
     foreach my $value (@{$film_data}) { # creating tropes set
                                         # get top rated tropes
        my $trope_name_lower_case = lc $value;        

        if ($max_frequency < $tropes_ranking{$trope_name_lower_case}) {
          $max_frequency =  $tropes_ranking{$trope_name_lower_case};
          $top_rank_trope = $value;
        }

        $tropes{$trope_name_lower_case}= "$value";
     }
     my $film_name_lc = lc $key;
     # if (exists($top_films{$film_name_lc})) {
     # print $fh "$key $top_rank_trope $max_frequency\n";
     print "$key $top_rank_trope $max_frequency\n";
     #}
  } else {
     delete $data->{$key}; # remove film
  }
  # print $fh_films "$key $top_rank_trope $max_frequency\n"; # create all films file
  # print "$key $top_rank_trope $max_frequency\n"; # create all films file
}
close $fh;
close $fh_films;
