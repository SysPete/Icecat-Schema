use utf8;

package Icecat::Schema::Result::Product;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("product");
__PACKAGE__->add_columns(
    product_id  => { data_type => "integer", is_auto_increment => 1 },
    supplier_id => { data_type => "integer", default_value     => 0 },
    prod_id     => { data_type => "varchar", default_value => "", size => 60 },
    catid       => { data_type => "integer", default_value => 0 },
    user_id     => { data_type => "integer", default_value => 1 },
    launch_date => { data_type => "integer", is_nullable   => 1 },
    obsolence_date => { data_type => "integer", is_nullable => 1 },
    name => { data_type => "varchar", default_value => "", size => 255 },
    low_pic   => { data_type => "varchar", default_value => "",  size => 255 },
    high_pic  => { data_type => "varchar", default_value => "",  size => 255 },
    publish   => { data_type => "char",    default_value => "Y", size => 1 },
    public    => { data_type => "char",    default_value => "Y", size => 1 },
    thumb_pic => { data_type => "varchar", is_nullable   => 1,   size => 255 },
    updated   => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    date_added => {
        data_type     => "date",
        set_on_create => 1,
    },
    family_id => { data_type => "integer", default_value => 0 },
    dname     => { data_type => "varchar", default_value => "", size => 255 },
    topseller => { data_type => "varchar", default_value => "", size => 255 },
    low_pic_size =>
      { data_type => "integer", default_value => 0, is_nullable => 1 },
    high_pic_size =>
      { data_type => "integer", default_value => 0, is_nullable => 1 },
    thumb_pic_size =>
      { data_type => "integer", default_value => 0, is_nullable => 1 },
    high_pic_width  => { data_type => "integer", default_value => 0 },
    high_pic_height => { data_type => "integer", default_value => 0 },
    low_pic_width   => { data_type => "integer", default_value => 0 },
    low_pic_height  => { data_type => "integer", default_value => 0 },
    high_pic_origin =>
      { data_type => "varchar", default_value => "", size => 255 },
    series_id              => { data_type => "integer", default_value => 1 },
    checked_by_supereditor => { data_type => "tinyint", default_value => 0 },
    medium_pic             => { data_type => "varchar", size          => 255 },
    medium_pic_size        => { data_type => "integer" },
    medium_pic_width       => { data_type => "integer" },
    medium_pic_height      => { data_type => "integer" },
    high_pic_origin_size   => { data_type => "integer" },
);
__PACKAGE__->set_primary_key("product_id");
__PACKAGE__->add_unique_constraint( [ "prod_id", "supplier_id" ] );

__PACKAGE__->belongs_to(
    category => "Icecat::Schema::Result::Category",
    "catid"
);

__PACKAGE__->belongs_to(
    supplier => "Icecat::Schema::Result::Supplier",
    "supplier_id"
);

1;
