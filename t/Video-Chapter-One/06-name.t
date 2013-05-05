# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Video::Chapter::One;

# Test.
my $obj = Video::Chapter::One->new;
my $ret = $obj->name;
is($ret, undef, 'Undefined name.');

# Test.
$ret = $obj->name('Foo bar');
is($ret, 'Foo bar', "Name 'Foo bar'.");
