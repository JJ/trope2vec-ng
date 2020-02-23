#!/usr/bin/env perl
#
# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

use strict;
use warnings;

my $max_num_tropes = 1038;

binmode STDOUT, ":utf8";
use utf8;
 
my $i = 0;

for ($i=10; $i <= $max_num_tropes; $i = $i+10) {
   `./tvtropes_num_tropes.pl ./data/tvtropes.json $i`;
} 
