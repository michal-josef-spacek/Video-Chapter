package Video::Chapter::One;

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

	# Item.
	$self->{'item'} = undef;

	# Texts.
	$self->{'text'} = [];

	# Time from.
	$self->{'time_from'} = undef;

	# Time to.
	$self->{'time_to'} = undef;

	# Process parameters.
	set_params($self, @params);

	# Object.
	return $self;
}

# Get or set item number.
sub item {
	my ($self, $item) = @_;
	if (defined $item) {
		$self->{'item'} = $item;
	}
	return $self->{'item'};
}

# Get or set texts.
sub text {
	my ($self, @text) = @_;
	if (@text) {
		$self->{'text'} = \@text;
	}
	return $self->{'text'};
}

# Get or set time from.
sub time_from {
	my ($self, $time_from) = @_;
	if ($time_from) {
		$self->{'time_from'} = $time_from;
		if (! defined $self->{'time_to'}
			|| $self->{'time_to'} < $self->{'time_from'}) {

			$self->{'time_to'} = $time_from;
		}
	}
	return $self->{'time_from'};
}

# Get or set time to.
sub time_to {
	my ($self, $time_to) = @_;
	if ($time_to) {
		$self->{'time_to'} = $time_to;
	}
	return $self->{'time_to'};
}


1;
