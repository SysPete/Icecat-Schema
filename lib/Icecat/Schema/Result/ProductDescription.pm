use utf8;
package Icecat::Schema::Result::ProductDescription;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
__PACKAGE__->table("product_description");
__PACKAGE__->add_columns(
  "product_description_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "langid",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "short_desc",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 3000 },
  "long_desc",
  { data_type => "mediumtext", is_nullable => 0 },
  "specs_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "support_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "official_url",
  { data_type => "text", is_nullable => 1 },
  "warranty_info",
  { data_type => "mediumtext", is_nullable => 1 },
  "option_field_1",
  { data_type => "mediumtext", is_nullable => 1 },
  "updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
  "pdf_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "option_field_2",
  { data_type => "mediumtext", is_nullable => 1 },
  "pdf_size",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "manual_pdf_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "manual_pdf_size",
  { data_type => "integer", default_value => 0, is_nullable => 1 },
  "pdf_url_origin",
  { data_type => "text", is_nullable => 1 },
  "manual_pdf_url_origin",
  { data_type => "text", is_nullable => 1 },
  "pdf_updated",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "manual_pdf_updated",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("product_description_id");
__PACKAGE__->add_unique_constraint("product_id", ["product_id", "langid"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-02-18 11:37:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dVEiNlaCYJKRs+BNp2H9XQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
