#!/usr/bin/env perl
#

# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

use strict;
use warnings;


binmode STDOUT, ":utf8";
use utf8;
 

my $num_args = $#ARGV + 1;
if ($num_args != 3) {
    print "Usage: word2vec_words.pl <max_tropes> <ngram_size> <add_film_name>\n";
    exit;
}

my $DEBUG = 1;
my $max_tropes = $ARGV[0];
my $ngram_size = $ARGV[1];
my $add_film_name = $ARGV[2];
my $output_dir = "../output/max_tropes_$max_tropes" . "_ngrams_$ngram_size" . "_inc_film_name_$add_film_name";
my $output_dir_word2vec = "$output_dir/word2vec";


# create output directory if not exist
if (-e $output_dir_word2vec and -d $output_dir_word2vec) {
    # do nothing
} else {
    `mkdir $output_dir_word2vec`;
}

my $file_input_name = $output_dir . "/ngrams_" . $max_tropes . "_taken_" . $ngram_size. "_add_film_name" . $add_film_name . ".txt";
my $file_output_name =  $output_dir_word2vec . "/ngrams_" . $max_tropes . "_taken_" . $ngram_size. "_vectors_add_film_name" . $add_film_name . ".bin";

`../word2vec/word2vec -train $file_input_name -output $file_output_name -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -binary 1 -iter 15`;
