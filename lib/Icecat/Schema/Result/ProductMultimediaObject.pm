use utf8;

package Icecat::Schema::Result::ProductMultimediaObject;

=head1 NAME

Icecat::Schema::Result::ProductMultimediaObject

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );

=head1 TABLE

product_multimedia_object

=cut

__PACKAGE__->table("product_multimedia_object");
__PACKAGE__->add_columns(
    id         => { data_type => "integer", is_auto_increment => 1 },
    product_id => { data_type => "integer" },
    link       => {
        data_type     => "varchar",
        default_value => "",
        size          => 255
    },
    short_descr => { data_type => "mediumtext" },
    langid      => { data_type => "integer", default_value => 0 },
    size        => { data_type => "integer", default_value => 0 },
    updated => {
        data_type     => "timestamp",
        set_on_create => 1,
        set_on_update => 1,
    },
    content_type => {
        data_type     => "varchar",
        default_value => "",
        size          => 255
    },
    keep_as_url => { data_type => "integer", default_value => 0 },
    type        => {
        data_type     => "varchar",
        default_value => "standard",
        size          => 255,
    },
    height         => { data_type => "integer", default_value => 0 },
    width          => { data_type => "integer", default_value => 0 },
    data_source_id => { data_type => "integer", default_value => 0 },
    link_origin    => {
        data_type     => "varchar",
        default_value => "",
        size          => 255
    },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint( [ "product_id", "langid", "link" ] );

__PACKAGE__->belongs_to(
    product => "Icecat::Schema::Result::Product",
    "product_id"
);

__PACKAGE__->belongs_to(
    language => "Icecat::Schema::Result::Language",
    "langid"
);

1;
