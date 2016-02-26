use utf8;
package Icecat::Schema;

=head1 NAME

Icecat::Schema - DBIx::Class schema for icecat.biz data

=head1 VERSION

0.003

=cut

our $VERSION = 0.003;

use strict;
use warnings;

use base 'DBIx::Class::Schema::Config';

__PACKAGE__->load_namespaces;

1;
