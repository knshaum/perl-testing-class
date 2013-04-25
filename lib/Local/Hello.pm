package Local::Hello;

use strict;
use warnings;

use v5.10;

use parent qw(Exporter);
our @EXPORT = qw(hello);

sub hello {
    my($greeting, $place) = @_;
    $greeting //= "Hello";
    $place    //= "world";

    return "$greeting, $place!\n";
}

1;
