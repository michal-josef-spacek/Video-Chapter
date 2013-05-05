# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Video::Chapter::One;

# Test.
my $obj = Video::Chapter::One->new;
my $ret = $obj->time_to;
is($ret, undef, 'Undefined time to.');

# Test.
$ret = $obj->time_to('1367783543');
is($ret, '1367783543', "Time to '1367783543'.");
