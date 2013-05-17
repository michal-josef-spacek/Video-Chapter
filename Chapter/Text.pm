package Video::Chapter::Text;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Country.
	$self->{'country'} = undef;

	# Language.
	$self->{'lang'} = undef;

	# Name.
	$self->{'name'} = undef;

	# Process parameters.
	set_params($self, @params);

	# Object.
	return $self;
}

# Get or set country.
sub country {
	my ($self, $country) = @_;
	if (defined $country) {
		$self->{'country'} = $country;
	}
	return $self->{'country'};
}

# Get or set language.
sub lang {
	my ($self, $lang) = @_;
	if (defined $lang) {
		$self->{'lang'} = $lang;
	}
	return $self->{'lang'};
}

# Get or set name.
sub name {
	my ($self, $name) = @_;
	if (defined $name) {
		$self->{'name'} = $name;
	}
	return $self->{'name'};
}

1;
