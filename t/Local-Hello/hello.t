#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::FailWarnings;

use Local::Hello;
pass("Hello compiled");

my @tests = (
    [["", ""]            =>     "Hello, world!\n"],
    [["Howdy", "Earth"]  =>     "Howdy, Earth!\n"],
    [["", "Sol 3"]       =>     "Hello, Sol 3!\n"],
    [["Yo", ""]          =>     "Yo, world!\n"],
);

for my $test (@tests) {
    my($args, $want) = @$test;

    is hello(@$args), $want, sprintf("hello(%s)", join(", ", @$args));
}

done_testing;
