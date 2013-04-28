#!/usr/bin/env perl

use strict;
use warnings;
use CGI;
use Local::DateTime;

print main(@ARGV) unless caller;

sub main {
    my $cgi = CGI->new;

    my $html = $cgi->header;
    $html   .= page();
    return $html;
}

sub page {
    my $date_time = Local::DateTime->date_time;

    return <<"HTML";
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
        <div id="time">$date_time</div>
    </p>
</body>

</html>
HTML
}
