use strict;
use warnings;

package Bryar::Config::YAML;
use base qw(Bryar::Config);

use YAML::Syck qw(LoadFile);

=head1 NAME

Bryar::Config::YAML - Bryar configuration stored in YAML

=head1 VERSION

version 0.104

=cut

our $VERSION = '0.104';

=head1 SYNOPSIS

 Bryar::Config::YAML->new(...);
 Bryar::Config::YAML->load(...);

=head1 DESCRIPTION

B<Achtung!>  This module is no longer maintained.  If you would like to take it
over, contact RJBS.

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
    if (-r "$datadir/$file") {
      $file = "$datadir/$file";
    } else {
      return;
    }
  }
  %args = %{ (LoadFile($file))[0] };
  return %args;
}

=head1 AUTHOR

Ricardo SIGNES, C<< <rjbs@cpan.org> >>

=head1 COPYRIGHT

Copyright 2004-2006 Ricardo SIGNES, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1;
