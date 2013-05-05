# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 6;
use Test::NoWarnings;
use Video::Chapter::One;

# Test.
my $obj = Video::Chapter::One->new;
my $ret = $obj->time_from;
is($ret, undef, 'Undefined time from.');

# Test.
$ret = $obj->time_from('1367783543');
is($ret, '1367783543', "Time from, when is undefined and set to new value.");
$ret = $obj->time_to;
is($ret, '1367783543', "Time to, when is undefined and set time_from().");

# Test.
$ret = $obj->time_from('1367784084');
is($ret, '1367784084', "Update time from to greater value.");
$ret = $obj->time_to;
is($ret, '1367784084', "Time to, when is lesser then new time from value.");
