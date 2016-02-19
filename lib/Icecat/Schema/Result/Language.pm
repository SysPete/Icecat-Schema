use utf8;

package Icecat::Schema::Result::Language;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("language");
__PACKAGE__->add_columns(
    "langid",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "sid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "code",
    {
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 32
    },
    "short_code",
    {
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 5
    },
    "published",
    { data_type => "char", default_value => "N", is_nullable => 0, size => 1 },
    "backup_langid",
    { data_type => "integer", is_nullable => 1 },
    "updated",
    {
        data_type                 => "timestamp",
        datetime_undef_if_invalid => 1,
        default_value             => \"current_timestamp",
        is_nullable               => 0,
    },
);
__PACKAGE__->set_primary_key("langid");

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->belongs_to(
    sidindex => "Icecat::Schema::Result::SidIndex",
    "sid"
);

1;
