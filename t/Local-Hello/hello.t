#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::FailWarnings;

use Local::Hello;
pass("Hello compiled");

is hello(),                     "Hello, world!\n";
is hello("Howdy", "Earth"),     "Howdy, Earth!\n";
is hello("", "Sol 3"),          "Hello, Sol 3!\n";
is hello("Yo", ""),             "Yo, world!\n";

done_testing;
