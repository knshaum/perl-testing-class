#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $CLASS = "Local::DateTime";
require_ok $CLASS;

note "new with no args"; {
    new_ok $CLASS;
}


note "new with a time"; {
    local $ENV{TZ} = "US/Central";
    my $dt = new_ok $CLASS, [time => 167209382];

    is $dt->second,     2,         "second";
    is $dt->minute,     3,         "minute";
    is $dt->hour,       2,         "hour";
    is $dt->day,        20,        "day";
    is $dt->month,      4,         "month";
    is $dt->year,       1975,      "year";
}


done_testing;
