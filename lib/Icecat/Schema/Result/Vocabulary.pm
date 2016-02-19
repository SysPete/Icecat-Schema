use utf8;

package Icecat::Schema::Result::Vocabulary;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("vocabulary");
__PACKAGE__->add_columns(
    "record_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "sid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "langid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "value",
    { data_type => "varchar", is_nullable => 1, size => 255 },
    "updated",
    {
        data_type                 => "timestamp",
        datetime_undef_if_invalid => 1,
        default_value             => \"current_timestamp",
        is_nullable               => 0,
    },
);
__PACKAGE__->set_primary_key("record_id");
__PACKAGE__->add_unique_constraint( "sid_2", [ "sid", "langid" ] );

__PACKAGE__->belongs_to(
    sidindex => "Icecat::Schema::Result::SidIndex",
    "sid"
);

1;
