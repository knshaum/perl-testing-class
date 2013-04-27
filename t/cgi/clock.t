#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $output = `$^X cgi/clock.cgi`;
like $output, qr{<div id="time">\d+/\d+/\d{4} - \d+:\d+:\d+</div>};

done_testing;
