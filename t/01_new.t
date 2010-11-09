use strict;
use warnings;
use Test::More tests => 8;
use Digest::BMW;

new_ok('Digest::BMW' => [$_], "algorithm $_") for qw(224 256 384 512);

is(eval { Digest::BMW->new },     undef, 'no algorithm specified');
is(eval { Digest::BMW->new(10) }, undef, 'invalid algorithm specified');

can_ok('Digest::BMW',
    qw(clone algorithm hashsize add digest hexdigest b64digest)
);

my $d1 = Digest::BMW->new(224);
is($d1->add('foobar')->digest, $d1->clone->digest, 'clone');

