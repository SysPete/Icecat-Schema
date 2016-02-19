use utf8;
package Icecat::Schema::Result::ProductFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
__PACKAGE__->table("product_feature");
__PACKAGE__->add_columns(
  "product_feature_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "category_feature_id",
  { data_type => "mediumint", extra => { unsigned => 1 }, is_nullable => 0 },
  "value",
  {
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 20000,
  },
  "updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("product_feature_id");
__PACKAGE__->add_unique_constraint(
  "category_feature_id_2",
  ["category_feature_id", "product_id"],
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-02-18 11:37:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O0HLOLfLCsbs03Hy5Ciuyw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
