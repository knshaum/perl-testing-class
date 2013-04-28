package Local::DateTime;

use strict;
use warnings;

sub date_time {
    my $class = shift;
    my $time = shift // time;

    my($sec, $min, $hour, $day, $mon, $year) = localtime($time);
    $year += 1900;
    $mon  += 1;

    return "$mon/$day/$year - $hour:$min:$sec";
}

1;
