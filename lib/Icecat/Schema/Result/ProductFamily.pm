use utf8;

package Icecat::Schema::Result::ProductFamily;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("product_family");
__PACKAGE__->add_columns(
    "family_id"        => { data_type => "integer" },
    "parent_family_id" => { data_type => "integer", is_nullable => 1 },
    "supplier_id"      => { data_type => "integer" },
    "sid"              => { data_type => "integer", default_value => 0 },
    "tid"              => { data_type => "integer", default_value => 0 },
    "low_pic" => { data_type => "varchar", is_nullable => 1, size => 255 },
    "thumb_pic" => { data_type => "varchar", is_nullable => 1, size => 255 },
    "catid"     => { data_type => "integer" },
    "data_source_id" => { data_type => "integer", default_value => 0 },
    "symbol" => { data_type => "varchar", default_value => "", size => 120 },
    "updated" => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
);
__PACKAGE__->set_primary_key("family_id");

__PACKAGE__->has_many(
    descriptions => "Icecat::Schema::Result::Tex",
    { 'foreign.tid' => 'self.tid' }
);

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->has_many(
    product_series => "Icecat::Schema::Result::ProductSeries", "series_id"
);

1;
