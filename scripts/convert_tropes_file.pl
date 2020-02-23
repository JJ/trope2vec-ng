#!/usr/bin/env perl 
#
# https://blog-en.openalfa.com/how-to-read-and-write-json-files-in-perl 

use strict;
use warnings;

while (<> ) {
  if (/(\d+\.\d+.*)/) {
     print $1;
  } else {
     print " $_";
  }
}
