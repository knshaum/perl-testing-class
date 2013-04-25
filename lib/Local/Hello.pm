package Local::Hello;

use strict;
use warnings;

use parent qw(Exporter);
our @EXPORT = qw(hello);

sub hello {
    my($greeting, $place) = @_;

    return "$greeting, $place!\n";
}

1;
