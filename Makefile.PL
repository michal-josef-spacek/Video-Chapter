# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Perl module for video chapters.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'Video-Chapter';
requires 'Class::Utils' => 0.03;
requires 'Error::Pure' => 0.09;
requires 'Scalar::Util' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Video-Chapter';
resources 'homepage' => 'https://github.com/tupinek/Video-Chapter';
resources 'repository' => 'git://github.com/tupinek/Video-Chapter';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
