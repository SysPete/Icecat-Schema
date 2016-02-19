use utf8;
package Icecat::Schema::Result::ProductMultimediaObject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
__PACKAGE__->table("product_multimedia_object");
__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "link",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "short_descr",
  { data_type => "mediumtext", is_nullable => 0 },
  "langid",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "size",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "content_type",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "keep_as_url",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "type",
  {
    data_type => "varchar",
    default_value => "standard",
    is_nullable => 0,
    size => 255,
  },
  "height",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "width",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "data_source_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "link_origin",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("product_id_3", ["product_id", "langid", "link"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-02-18 11:37:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gkDYW2pr4ZTH+i/DE0xkDA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
