package Local::DateTime;

use strict;
use warnings;

use parent "Exporter";
our @EXPORT = qw(date_time);

sub date_time {
    my $time = shift // time;

    my($sec, $min, $hour, $day, $mon, $year) = localtime($time);
    $year += 1900;
    $mon  += 1;

    return "$mon/$day/$year - $hour:$min:$sec";
}

1;
