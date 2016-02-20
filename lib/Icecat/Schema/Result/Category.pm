use utf8;

package Icecat::Schema::Result::Category;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("category");
__PACKAGE__->add_columns(
    catid  => { data_type => "integer" },
    ucatid => { data_type => "varchar", is_nullable => 1, size => 255 },
    pcatid     => { data_type => "integer", is_nullable => 1 },
    sid        => { data_type => "integer" },
    tid        => { data_type => "integer" },
    searchable => { data_type => "integer", default_value => 0 },
    low_pic    => {
        data_type     => "varchar",
        default_value => "",
        size          => 255
    },
    thumb_pic => {
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 1,
        size          => 255
    },
    updated => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    last_published =>
      { data_type => "integer", default_value => 0, is_nullable => 1 },
    watched_top10 => { data_type => "integer", default_value => 0 },
    visible       => { data_type => "integer", default_value => 0 },
    ssid          => { data_type => "integer" },
);
__PACKAGE__->set_primary_key("catid");
__PACKAGE__->add_unique_constraint( "ucatid", ["ucatid"] );

__PACKAGE__->belongs_to(
    parent => "Icecat::Schema::Result::Category",
    "pcatid", { join_type => 'left' }
);

__PACKAGE__->has_many(
    descriptions => "Icecat::Schema::Result::Tex",
    { 'foreign.tid' => 'self.tid' }
);

__PACKAGE__->has_many(
    keywords => "Icecat::Schema::Result::CategoryKeyword",
    "category_id"
);

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->has_many(
    products => "Icecat::Schema::Result::Product",
    "catid"
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
