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

	# Chapters.
	$self->{'chapters'} = [];

	# Id.
	$self->{'id'} = undef;

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

# Get or set chapters.
sub chapters {
	my ($self, @chapters) = @_;
	if (@chapters) {
		$self->{'chapters'} = \@chapters;
	}
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

# Get id from object.
sub id {
	my $self = shift;
	return $self->{'id'};
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Video::Chapter - Perl module for manipulating video chapters.

=head1 SYNOPSIS

 use Video::Chapter;
 my $obj = Video::Chapter(%parameters);
 my @chapters = $obj->chapters(@chapters);
 my $id = $obj->id;

=head1 METHODS

=over 8

=item C<new(%parameters)>

 Constructor.

=over 8

=item * C<chapters>

 List of Video::Chapter::One objects.
 Default value is [].

=item * C<id>

 Chapter object identification.
 Parameter is required.
 Default value is undef.

=back

=item C<chapters([@chapters])>

 Get or set chapters.
 Returns list of Video::Chapter::One objects.

=item C<id()>

 Get identification of object.
 Returns string with id.

=back

=head1 ERRORS

 new():
         Chapter must be a 'Video::Chapter::One' object.
         Parameter 'chapters' must be array.
         Parameter 'id' is required.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Video::Chapter;
 use Video::Chapter::One;
 use Video::Chapter::Text;

 # Object.
 my $obj = Video::Chapter->new(
         'chapters' => [
                 Video::Chapter::One->new(
                         'item' => 1,
                         'text' => Video::Chapter::Text->new(
                                 'lang' => 'cze',
                                 'name' => 'Kapitola 1',
                         ),
                         'time_from' => 99,
                         'time_to' => 199,
                 ),
                 Video::Chapter::One->new(
                         'item' => 2,
                         'time_from' => 199,
                 ),
         ],
         'id' => 'chapter',
 );

 # TODO

 # Output.
 # TODO

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<Scalar::Util>.

=head1 REPOSITORY

L<https://github.com/tupinek/Video-Chapter>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
