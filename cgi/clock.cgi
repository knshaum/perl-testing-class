#!/usr/bin/env perl

use strict;
use warnings;
use CGI;

print main(@ARGV);

sub main {
    my $cgi = CGI->new;

    my($sec, $min, $hour, $day, $mon, $year) = localtime;
    $year += 1900;
    $mon  += 1;

    my $html = $cgi->header;
    $html .= <<"HTML";
<html>
<head>
    <title>What time is it!</title>
    <style>
        body {
            background-image:url("img/Pinkie Pie clock transparent.png");
            background-repeat:no-repeat;
            background-position:top right;
        }
        #time {
            text-align:left;
            font-size:200%
        }
    </style>
</head>

<body>
    <p>At the sound of your head hitting the desk, the time will be
        <div id="time">$mon/$day/$year - $hour:$min:$sec</div>
    </p>
</body>

</html>
HTML

    return $html;
}
