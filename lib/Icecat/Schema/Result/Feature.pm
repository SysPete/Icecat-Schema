use utf8;

package Icecat::Schema::Result::Feature;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("feature");
__PACKAGE__->add_columns(
    "feature_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "sid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "tid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "measure_id",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "type",
    {
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 60
    },
    "class",
    { data_type => "tinyint", default_value => 0, is_nullable => 0 },
    "limit_direction",
    { data_type => "tinyint", default_value => 0, is_nullable => 0 },
    "searchable",
    { data_type => "tinyint", default_value => 0, is_nullable => 0 },
    "restricted_values",
    { data_type => "mediumtext", is_nullable => 1 },
    "updated",
    {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    "last_published",
    { data_type => "integer", default_value => 0, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("feature_id");

__PACKAGE__->has_many(
    descriptions => "Icecat::Schema::Result::Tex",
    { 'foreign.tid' => 'self.tid' }
);

__PACKAGE__->belongs_to(
    measure => "Icecat::Schema::Result::Measure",
    "measure_id"
);

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->belongs_to(
    sidindex => "Icecat::Schema::Result::SidIndex",
    "sid"
);

__PACKAGE__->belongs_to(
    tidindex => "Icecat::Schema::Result::TidIndex",
    "tid"
);

1;
