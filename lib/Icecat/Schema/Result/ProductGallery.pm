use utf8;

package Icecat::Schema::Result::ProductGallery;

=head1 NAME

Icecat::Schema::Result::ProductGallery

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );

=head1 TABLE

product_gallery

=cut

__PACKAGE__->table("product_gallery");
__PACKAGE__->add_columns(
    id         => { data_type => "integer", is_auto_increment => 1 },
    product_id => { data_type => "integer", default_value     => 0 },
    link => { data_type => "varchar", default_value => "", size => 255 },
    thumb_link => { data_type => "varchar", default_value => "", size => 255 },
    height     => { data_type => "integer", default_value => 0 },
    width      => { data_type => "integer", default_value => 0 },
    size       => { data_type => "integer", default_value => 0 },
    quality => { data_type => "tinyint", default_value => 0, is_nullable => 1 },
    updated => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    thumb_size  => { data_type => "integer", default_value => 0 },
    link_origin => { data_type => "varchar", default_value => "", size => 255 },
    low_link    => { data_type => "varchar", size          => 255 },
    medium_link => { data_type => "varchar", size          => 255 },
    low_height    => { data_type => "integer" },
    medium_height => { data_type => "integer" },
    low_width     => { data_type => "integer" },
    medium_width  => { data_type => "integer" },
    low_size      => { data_type => "integer" },
    medium_size   => { data_type => "integer" },
    size_origin   => { data_type => "integer" },
    langid        => { data_type => "integer", default_value => 0 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint( [ "product_id", "link" ] );

__PACKAGE__->belongs_to(
    language => "Icecat::Schema::Result::Language",
    "langid"
);

__PACKAGE__->belongs_to(
    product => "Icecat::Schema::Result::Product",
    "product_id"
);

1;
