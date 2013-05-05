# Pragmas.
use strict;
use warnings;

# Modules.
use Video::Chapter::One;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Video::Chapter::One::VERSION, 0.01, 'Version.');
