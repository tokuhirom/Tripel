use strict;
use warnings;
use Test::More;
use Plack::Test;

my $app = do {
    package Foo;
    use Tripel;

    get '/' => sub {
        my ($c) = @_;
        $c->render('bridge.tt');
    };

    to_app();
};

test_psgi app => $app,
    client => sub {
        my $cb = shift;
        my $req = HTTP::Request->new(GET => 'http://localhost/');
        my $res = $cb->($req);
        is $res->code, 200;
        is $res->content, "3\n";
    };

done_testing;
