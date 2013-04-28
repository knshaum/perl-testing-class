#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::XPath;
use Test::Time time => 167213045;  # freeze time at Sun Apr 20 03:04:05 1975

my $Date_Time_RE = qr{(\d+)/(\d+)/(\d{4}) - (\d+):(\d+):(\d+)};

note "Load clock.cgi as a library in its own package"; {
    package MyClock;
    ::require_ok "./cgi/clock.cgi";
}


note "Basic test that the clock is on the page"; {
    local $ENV{TZ} = "US/Central";
    my $html = MyClock::page();

    my $txpath = Test::XPath->new( xml => $html );
    $txpath->ok( q{//div[@id="time"]}, sub {
        my $div = shift;

        my($mon, $day, $year, $hour, $min, $sec) = $div->node =~ $Date_Time_RE;
        is $sec,    5,         "second";
        is $min,    4,         "minute";
        is $hour,   3,         "hour";
        is $day,    20,        "day";
        is $mon,    4,         "month";
        is $year,   1975,      "year";
    });
}


note "Basic formatted date_time test with argument"; {
    local $ENV{TZ} = "US/Central";
    my $date_time = MyClock::date_time(167209382);

    my($mon, $day, $year, $hour, $min, $sec) = $date_time =~ $Date_Time_RE;
    is $sec,    2,         "second";
    is $min,    3,         "minute";
    is $hour,   2,         "hour";
    is $day,    20,        "day";
    is $mon,    4,         "month";
    is $year,   1975,      "year";
}


note "Basic formatted date_time test without argument"; {
    my $now = time;

    local $ENV{TZ} = "US/Central";
    my $date_time = MyClock::date_time();

    my($mon, $day, $year, $hour, $min, $sec) = $date_time =~ $Date_Time_RE;
    is $sec,    5,         "second";
    is $min,    4,         "minute";
    is $hour,   3,         "hour";
    is $day,    20,        "day";
    is $mon,    4,         "month";
    is $year,   1975,      "year";
}

done_testing;
