use utf8;

package Icecat::Schema::Result::TidIndex;

=head1 NAME

Icecat::Schema::Result::TidIndex

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE

tid_index

=cut

__PACKAGE__->table("tid_index");
__PACKAGE__->add_columns(
    tid   => { data_type => "integer", is_auto_increment => 1 },
    dummy => { data_type => "integer", is_nullable       => 1 },
);
__PACKAGE__->set_primary_key("tid");

__PACKAGE__->has_many(
    texts => "Icecat::Schema::Result::Tex",
    "tid"
);

1;
