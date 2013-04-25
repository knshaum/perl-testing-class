#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

use Local::Hello;
pass("Hello compiled");

ok hello() eq "Hello, world!";

done_testing;
