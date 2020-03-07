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
    print "Usage: create-corpus-top.pl <json_file> <file-films-tropes-top> <file-films-votes> <file-all-tropes-ranking>\n";
    exit;
}

my $DEBUG = 1;
my $file_films_tropes_top = $ARGV[1];
my $file_films_votes = $ARGV[2];
my $file_all_tropes_ranking = $ARGV[3];
my $output_dir = ".";
my $shuffle = 1;
my $to_lowercase = 1;
my $json;
my $film_div_factor = 100000;
my $trope_div_factor = 100;

my $max_tropes = 15;
my $min_tropes = 2;
my $ngram_size = 9;
my $add_film_name = 0;

my @output_lines;

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


open my $fh_films_tropes_top, '<', "$file_films_tropes_top" or die "can't open file: $!";
chomp(my @lines_films_tropes_top = <$fh_films_tropes_top>);
close $fh_films_tropes_top;


foreach my $element (@lines_films_tropes_top) {


}

my %films_votes;

open my $fh_films_votes, '<', "$file_films_votes" or die "can't open file: $!";
chomp(my @lines_films_votes = <$fh_films_votes>);
close $fh_films_votes;


foreach my $element (@lines_films_votes) {
  (my $film_name, my $film_votes) = split(" ", $element);  
  $film_votes =~ s/\.//g;
  $films_votes{$film_name} = $film_votes;
}


my %all_tropes_ranking;

open my $fh_all_tropes_ranking, '<', "$file_all_tropes_ranking" or die "can't open file: $!";
chomp(my @lines_all_tropes_ranking = <$fh_all_tropes_ranking>);
close $fh_all_tropes_ranking;


foreach my $element (@lines_all_tropes_ranking) {
   (my $trope_name, my $trope_rank) = split(";", $element);     
   $trope_name = lc $trope_name;
   $all_tropes_ranking{$trope_name} = $trope_rank;
}


my $film_name_lc = "";

foreach $key (keys %{$data}) { # foreach film name
  $film_name_lc = lc $key; 
  if (exists($films_votes{$film_name_lc})) { #if exist film in top films with votes
     # print "$film_name_lc $films_votes{$film_name_lc}\n";
     my $tmp = $films_votes{$film_name_lc} / $film_div_factor;
     for(my $i=0; $i < $tmp; $i++) {
        print "film $film_name_lc\n"; 
     } 
     $film_data = $data->{$key};
     foreach my $value (@{$film_data}) { # creating tropes set
       my $trope_name_lc = lc $value;
       my $tmp = $all_tropes_ranking{$trope_name_lc} / $trope_div_factor;
       for (my $i=0; $i < $tmp; $i++) {
          # relationship trope-film film 
          print "$trope_name_lc" . "_" . "$film_name_lc $film_name_lc\n"; 
         
          # relationship trope_word trope_name"
          print "trope $trope_name_lc\n";

          
          # relationship trope_word trope_name+film"
          print "trope $trope_name_lc" . "_" . "$film_name_lc\n";

          # relationship trope trope+film"
          print "$trope_name_lc $trope_name_lc" . "_" . "$film_name_lc\n";          

 
          # print "trope $trope_name_lc" . "_" . "$film_name_lc film $film_name_lc\n";
          # print "trope $trope_name_lc trope $trope_name_lc" . "_" . "$film_name_lc\n";
       }
     }    
  }
