package MyApp;
use strict;
use warnings;
use utf8;
use parent qw/Amon2/;
our $VERSION='0.01';
use 5.008001;

sub load_config {
    +{
        'Text::Xslate' => +{}
    }
}

1;
__END__

=head1 NAME

MyApp - MyApp

=head1 DESCRIPTION

This is a main context class for MyApp

=head1 AUTHOR

MyApp authors.

