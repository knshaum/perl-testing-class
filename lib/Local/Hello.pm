package Local::Hello;

use strict;
use warnings;

use v5.10;

use parent qw(Exporter);
our @EXPORT = qw(hello);

sub hello {
    my($greeting, $place) = @_;
    $greeting = "Hello" unless defined($greeting) && length($greeting);
    $place    = "world" unless defined($place)    && length($place);

    return "$greeting, $place!\n";
}

1;
