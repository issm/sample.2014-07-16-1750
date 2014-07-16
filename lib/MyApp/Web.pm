package MyApp::Web;
use strict;
use warnings;
use utf8;
use parent qw(MyApp Amon2::Web);
use File::Spec;
use Amon2::Util ();
use Module::Find;
use Data::Section::Simple ();

__PACKAGE__->load_data_section();

sub load_data_section {
    my ($self) = @_;
    my %data;
    my @modules = ( __PACKAGE__, useall __PACKAGE__ );
    for my $m ( @modules ) {
        my $ds = Data::Section::Simple->new( $m );
        $data{$m} = $ds->get_data_section();
    }
    Amon2::Util::add_method( __PACKAGE__, '__data__', sub { \%data } );
}

sub get_data_section {
    my ($self, $key, $pkg) = @_;
    $pkg ||= caller 0;
    my $ret;
    $ret = $self->__data__->{$pkg}{$key}  if $self->can( '__data__' );
    return $ret;
}

sub dispatch {
    my ($c) = @_;

    my $foo = $c->get_data_section( 'foo' );
    my $res = $c->create_response( defined $foo ? 200 : 500 );
    $res->content_type( 'text/plain' );
    $res->content( defined $foo ? 'OK' : 'NG' );

    return $res;
}

1;
__DATA__

@@ foo
foobar
