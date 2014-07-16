use 5.18.0;
use warnings;
use utf8;
use Getopt::Long qw( :config posix_default no_ignore_case bundling );
use Time::HiRes ();
use HTTP::Tiny;

my %opts = (
    n => 10,
);
GetOptions(
    'n=i' => \$opts{n},
);

my $ua = HTTP::Tiny->new();

sub main {
    my (%args) = @_;

    my $pid0 = $$;

    for my $i ( 1 .. $args{n} ) {
        my $pid = fork();
        last if ! $pid;
    }

    if ( $$ == $pid0 ) {
        sleep 1;
    }
    else {
        Time::HiRes::sleep ( rand() / 100 );
        my $res = $ua->get( 'http://localhost:5000/' );
        say $res->{status};
    }

    return 0;
}

main( %opts );
