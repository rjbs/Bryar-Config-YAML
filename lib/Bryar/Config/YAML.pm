package Bryar::Config::YAML;

use base qw(Bryar::Config);

use strict;
use warnings;
use YAML qw(LoadFile);

use warnings;
use strict;

=head1 NAME

Bryar::Config::YAML - Bryar configuration stored in YAML

=head1 VERSION

version 0.10

 $Id: YAML.pm,v 1.1.1.1 2004/10/23 01:44:22 rjbs Exp $

=cut

our $VERSION = '0.10';

=head1 SYNOPSIS

 Bryar::Config::YAML->new(...);
 Bryar::Config::YAML->load(...);

=head1 DESCRIPTION

This encapsulates a Bryar configuration. It can be used to load a new
configuration from a file, or provide a reasonable set of defaults.

It loads Bryar configuration from a YAML file.

=head1 METHODS

=head2 load

    $self->load($file)

Load the configuration file from somewhere and return the arguments as a
hash.

=cut

sub load {
    my ($self, $file) = @_;
    my %args;
    my $datadir = $self->{datadir};
    if (!-r $file) {
        if (-r "$datadir/$file") { $file = "$datadir/$file"; }
        else                     { return () }
    }
	%args = %{ (LoadFile($file))[0] };
    return %args;
}

=head1 AUTHOR

Ricardo Signes, C<< <rjbs@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-bryar-config-yaml@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT

Copyright 2004 Ricardo Signes, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
