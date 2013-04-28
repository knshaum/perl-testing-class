package Local::DateTime;

use Mouse;

has second =>
  is            => 'rw',
  isa           => 'Int';

has minute =>
  is            => 'rw',
  isa           => 'Int';

has hour =>
  is            => 'rw',
  isa           => 'Int';

has day =>
  is            => 'rw',
  isa           => 'Int';

has month =>
  is            => 'rw',
  isa           => 'Int';

has year =>
  is            => 'rw',
  isa           => 'Int';

sub BUILDARGS {
    my $class = shift;
    my %args = @_;

    my $time = delete $args{time} // time;

    my($sec, $min, $hour, $day, $mon, $year) = localtime($time);
    $year += 1900;
    $mon  += 1;

    $args{second}     //= $sec;
    $args{minute}     //= $min;
    $args{hour}       //= $hour;
    $args{day}        //= $day;
    $args{month}      //= $mon;
    $args{year}       //= $year;

    return \%args;
}

sub date_time {
    my $class = shift;
    my $time = shift // time;

    my $datetime = Local::DateTime->new(time => $time);

    return sprintf "%d/%d/%d - %d\:%d\:%d",
      $datetime->month,
      $datetime->day,
      $datetime->year,
      $datetime->hour,
      $datetime->minute,
      $datetime->second;
}

1;
