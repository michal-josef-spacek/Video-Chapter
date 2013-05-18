package Video::Chapter;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use Scalar::Util qw(blessed);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Id.
	$self->{'id'} = undef;

	# Chapters.
	$self->{'chapters'} = [];

	# Process parameters.
	set_params($self, @params);

	# Check for id.
	if (! defined $self->{'id'}) {
		err "Parameter 'id' is required.";
	}

	# Check for chapters.
	if (! defined $self->{'chapters'} || ref $self->{'chapters'}) {
		err "Parameter 'chapters' must be array.";
	}
	foreach my $chapter (@{$self->{'chapters'}}) {
		if (! blessed($chapter) || ! $chapter->isa('Video::Chapter::One')) {
			err "Chapter must be a 'Video::Chapter::One' object.";
		}
	}

	# Object.
	return $self;
}

# Get chapters.
sub chapters {
	my $self = shift;
	return @{$self->{'chapters'}};
}

# Get or set chapter.
sub chapter_filter {
	my ($self, $filter, $value) = @_;
	my @chapters;
	foreach my $chapter ($self->chapters) {

		# Get filter value from chapter object.
		my $chapter_filter;
		if ($filter eq 'item') {
			$chapter_filter = $chapter->item;
		} elsif ($filter eq 'name') {
			$chapter_filter = $chapter->name;
		} elsif ($filter eq 'time_from') {
			$chapter_filter = $chapter->time_from;
		} elsif ($filter eq 'time_to') {	
			$chapter_filter = $chapter->time_to;
		} else {
			err "Filter '$filter' doesn't supported.";
		}

		# Compare.
		if (defined $value && defined $chapter_filter
			&& $value eq $chapter_filter) {

			push @chapters, $chapter;
		}
	}
	return @chapters;
}

1;
