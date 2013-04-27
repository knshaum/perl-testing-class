#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::XPath;

{
    package MyClock;
    ::require_ok "./cgi/clock.cgi";
}

my $html = MyClock::page();

my $date_time_re = qr{(\d+)/(\d+)/(\d{4}) - (\d+):(\d+):(\d+)};
my $txpath = Test::XPath->new( xml => $html );
$txpath->ok( q{//div[@id="time"]}, sub {
    my $div = shift;
    like $div->node, $date_time_re;
});

done_testing;
