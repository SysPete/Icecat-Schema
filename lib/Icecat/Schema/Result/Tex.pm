use utf8;

package Icecat::Schema::Result::Tex;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("tex");
__PACKAGE__->add_columns(
    "tex_id",
    { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "tid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "langid",
    { data_type => "integer", default_value => 0, is_nullable => 0 },
    "value",
    { data_type => "mediumtext", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("tex_id");
__PACKAGE__->add_unique_constraint( "tid", [ "tid", "langid" ] );

__PACKAGE__->belongs_to(
    tidindex => "Icecat::Schema::Result::TidIndex",
    "tid"
);

1;
