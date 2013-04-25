#!/usr/bin/env perl

use strict;
use warnings;
use CGI;

my $cgi = CGI->new;

my($sec, $min, $hour, $day, $mon, $year) = localtime;
$year += 1900;
$mon  += 1;

print $cgi->header;
print <<"HTML";
<html>
<head>
    <title>What time is it!</title>
</head>

<body>
    At the sound of your head hitting your desk, the time will be <b>$mon/$day/$year - $hour:$min:$sec</b>
</body>

</html>
HTML
