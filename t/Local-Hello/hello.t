#!/usr/bin/env perl

use strict;
use warnings;

use utf8;
use Test::More;
use Test::FailWarnings;

use Local::Hello;
pass("Hello compiled");

my @tests = (
    [["Merhaba", "dünya"]=>     "Merhaba, dünya!\n"],
    [["", ""]            =>     "Hello, world!\n"],
    [[]                  =>     "Hello, world!\n"],
    [[undef, undef]      =>     "Hello, world!\n"],
    [[0, 0]              =>     "0, 0!\n"],
    [["Howdy", "Earth"]  =>     "Howdy, Earth!\n"],
    [["", "Sol 3"]       =>     "Hello, Sol 3!\n"],
    [["Yo", ""]          =>     "Yo, world!\n"],
);

for my $test (@tests) {
    my($args, $want) = @$test;

    my $name = sprintf("hello(%s)", join(", ", map { defined $_ ? $_ : "undef" } @$args));
    is hello(@$args), $want, $name;
}

done_testing;
