# Pragmas.
use strict;
use warnings;

# Modules.
use Video::Chapter::Text;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Video::Chapter::Text::VERSION, 0.01, 'Version.');
