package Parse::CPAN::Packages::Package;
use Moose;

has 'package'      => ( is => 'rw', isa => 'Str' );
has 'version'      => ( is => 'rw', isa => 'Str' );
has 'prefix'       => ( is => 'rw', isa => 'Str' );
has 'distribution' => ( is => 'rw', isa => 'Parse::CPAN::Packages::Distribution' );

sub filename {
    my ( $self )     = @_;
    my $distribution = $self->distribution;
    my @filenames    = $distribution->list_files;
    my $package_file = $self->package;
    $package_file =~ s{::}{/}g;
    $package_file .= '.pm';
    my ( $filename ) = grep { /$package_file$/ } sort { length( $a ) <=> length( $b ) } @filenames;
    return $filename;
}

sub file_content {
    my ( $self ) = @_;
    my $filename = $self->filename;
    my $content  = $self->distribution->get_file_from_tarball( $filename );
    return $content;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Parse::CPAN::Packages::Package

=head1 DESCRIPTION

Represents a CPAN Package. Note: The functions filename and file_content work
only if a mirror directory was supplied for parsing or the package file was
situated inside a cpan mirror structure.

=head1 METHODS

=head2 filename

Tries to guess the name of the file containing this package by looking through
the files contained in the distribution it belongs to.

=head2 file_content

Tries to return the contents of the file returned by filename().
