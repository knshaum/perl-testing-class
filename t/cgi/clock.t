#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::XPath;


note "Load clock.cgi as a library in its own package"; {
    package MyClock;
    ::require_ok "./cgi/clock.cgi";
}


note "Basic test that the clock is on the page"; {
    my $html = MyClock::page();

    my $date_time_re = qr{(\d+)/(\d+)/(\d{4}) - (\d+):(\d+):(\d+)};
    my $txpath = Test::XPath->new( xml => $html );
    $txpath->ok( q{//div[@id="time"]}, sub {
        my $div = shift;
        like $div->node, $date_time_re;
    });
}

done_testing;
