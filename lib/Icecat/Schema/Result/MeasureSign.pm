use utf8;

package Icecat::Schema::Result::MeasureSign;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("measure_sign");
__PACKAGE__->add_columns(
    "measure_sign_id",
    { data_type => "integer", is_auto_increment => 1 },
    "measure_id",
    { data_type => "integer", default_value => 0 },
    "langid",
    { data_type => "integer", default_value => 0 },
    "value",
    {
        data_type     => "varchar",
        default_value => "",
        size          => 255
    },
    "updated",
    {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    "last_published",
    {
        data_type     => "timestamp",
        set_on_create => 1,
    },
);
__PACKAGE__->set_primary_key("measure_sign_id");
__PACKAGE__->add_unique_constraint( "measure_id", [ "measure_id", "langid" ] );

__PACKAGE__->belongs_to(
    language => "Icecat::Schema::Result::Language",
    "langid"
);

__PACKAGE__->belongs_to(
    measure => "Icecat::Schema::Result::Measure",
    "measure_id"
);

1;
