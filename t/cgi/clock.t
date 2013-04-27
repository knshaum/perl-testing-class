#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::XPath;

{
    package MyClock;
    ::require_ok "./cgi/clock.cgi";
}

my $html = MyClock::main();

# Strip HTTP headers so we have just HTML
# Up to the first blank line CGI.pm will sometimes use \015\012
$html =~ s{^.*?\015?\012\015?\012}{}ms;

my $date_time_re = qr{(\d+)/(\d+)/(\d{4}) - (\d+):(\d+):(\d+)};
my $txpath = Test::XPath->new( xml => $html );
$txpath->ok( q{//div[@id="time"]}, sub {
    my $div = shift;
    like $div->node, $date_time_re;
});

done_testing;
