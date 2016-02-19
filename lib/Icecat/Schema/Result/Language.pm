use utf8;

package Icecat::Schema::Result::Language;

=head1 NAME

Icecat::Schema::Result::Language

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );

=head1 TABLE

language

=cut

__PACKAGE__->table("language");
__PACKAGE__->add_columns(
    langid        => { data_type => "integer" },
    sid           => { data_type => "integer" },
    code          => { data_type => "varchar", size => 32 },
    short_code    => { data_type => "varchar", size => 5 },
    published     => { data_type => "boolean", default_value => "1" },
    backup_langid => { data_type => "integer", is_nullable => 1 },
    updated => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
);
__PACKAGE__->set_primary_key("langid");

__PACKAGE__->belongs_to(
    backup_language => "Icecat::Schema::Result::Language",
    "backup_langid", { join_type => "left" }
);

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->belongs_to(
    sidindex => "Icecat::Schema::Result::SidIndex",
    "sid"
);

1;
