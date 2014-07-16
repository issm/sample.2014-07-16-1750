package MyApp::Web;
use strict;
use warnings;
use utf8;
use parent qw(MyApp Amon2::Web);
use File::Spec;
use Data::Section::Simple qw( get_data_section );

sub dispatch {
    my ($c) = @_;

    my $foo = get_data_section( 'foo' );
    my $res = $c->create_response( defined $foo ? 200 : 500 );
    $res->content_type( 'text/plain' );
    $res->content( defined $foo ? 'OK' : 'NG' );

    return $res;
}

1;
__DATA__

@@ foo
foobar
