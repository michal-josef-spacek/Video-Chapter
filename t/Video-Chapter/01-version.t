# Pragmas.
use strict;
use warnings;

# Modules.
use Video::Chapter;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Video::Chapter::VERSION, 0.01, 'Version.');
