package Test::Time;
use strict;
use warnings;

use Test::More;

our $VERSION = '0.04_01';
our $time = CORE::time();

our $Freeze = 1;

sub in_effect {
	return $Freeze;
}

sub import {
    my ($class, %opts) = @_;
    $time = $opts{time} if defined $opts{time};

    *CORE::GLOBAL::time         = \&_our_time;
    *CORE::GLOBAL::sleep        = \&_our_sleep;
    *CORE::GLOBAL::localtime    = \&_our_localtime;
    *CORE::GLOBAL::gmtime       = \&_our_gmtime;
}

sub _our_time () {
    if (in_effect) {
        $time;
    } else {
        CORE::time();
    }
}

sub _our_sleep (;$) {
    if (in_effect) {
        my $sleep = shift || 1;
        $time += $sleep;
        note "sleep $sleep";
        return $sleep;
    } else {
        return @_ ? CORE::sleep($_[0]) : CORE::sleep();
    }
}

sub _our_localtime (;$) {
    my $time = @_ ? shift : _our_time;
    return CORE::localtime($time);
}

sub _our_gmtime (;$) {
    my $time = @_ ? shift : _our_time;
    return CORE::gmtime($time);
}

1;
__END__

=encoding utf8

=head1 NAME

Test::Time - Freezes the time related core functions for testing

=head1 SYNOPSIS

    use Test::Time;

    # Freeze time
    my $now = time();

    # Increment internal time (returns immediately)
    sleep 1;

    # Return internal time incremented by 1
    my $then = time();


=head1 DESCRIPTION

Test::Time can be used to test modules that deal with time.

Once you C<use> this module C<time>, C<localtime> and C<gmtime> will
always return the time the module was loaded.

C<sleep> will not actually sleep, but will increment time as if it
had.

You can set custom time by passing C<time => number> after the C<use>
statement:

    use Test::Time time => 1;

    my $now = time;    # $now is equal to 1
    sleep 300;         # returns immediately, displaying a note
    my $then = time;   # $then equals to 301

Unlike the core funciton, L<sleep|perlfunc/sleep> will sleep for just
one second if called with no arguments.

=head2 Local Effect

Test::Time can be turned off using C<$Test::Time::Freeze = 0>.  You
should localize this effect with L<local|perlfunc/local>.

    use Test::Time time => 1;

    print time;    # Will print 1.

    # Time is frozen inside this function call
    some_function_that_uses_time;

    {
        local $Test::Time::Freeze = 0;
        print time;  # Will print the real time

        # Time is flowing inside this function
        some_function_that_uses_time;
    }


=head1 CAVEATS

Be sure to load Test::Time as early as possible.  It has to override
core functions and it must do this before any code which uses them is
compiled.

    use Some::Library;
    use Test::Time;
    use Some::OtherLibrary;

Some::OtherLibrary's functions will be affected by Test::Time, but
Some::Library's (and any other libraries it loads) will not.

=head1 AUTHOR

cho45 E<lt>cho45@lowreal.netE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
