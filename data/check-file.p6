#!/usr/bin/env raku

my @lines = "txt/trope_vectors.txt".IO.lines;

for @lines -> $l, $label {
    my @components = $l.split( /\s+/ );
    say @components.join(", "), ", $label";
}
