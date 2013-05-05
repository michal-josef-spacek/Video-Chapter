# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Video::Chapter::One;

# Test.
my $obj = Video::Chapter::One->new;
my $ret = $obj->item;
is($ret, undef, 'Undefined item number.');

# Test.
$ret = $obj->item('1');
is($ret, 1, "Item number '1'.");
