package Local::Hello;

use parent qw(Exporter);
our @EXPORT = qw(hello);

sub hello {
    return "Hello, world!\n";
}

1;
