use strict;
use warnings;
use Test::More;
use Plack::Test;

my $app = do {
    package Foo;
    use Tripel;
    use Test::More;
    use utf8;

    get '/' => sub {
        my ($c) = @_;
        is $c->config->{foo}, 'bar';
        $c->render('bridge.tt');
    };

    to_app();
};

test_psgi app => $app,
    client => sub {
        my $cb = shift;
        my $req = HTTP::Request->new(GET => 'http://localhost/?u=%E3%82%84%E3%83%BC');
        my $res = $cb->($req);
        is $res->code, 200;
    };

done_testing;
