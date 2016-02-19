use utf8;
package Icecat::Schema::Result::ProductReview;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");
__PACKAGE__->table("product_review");
__PACKAGE__->add_columns(
  "product_review_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "product_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "langid",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "review_group",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "review_code",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 60 },
  "review_id",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "score",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
  "url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "logo_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "value",
  { data_type => "blob", is_nullable => 1 },
  "value_good",
  { data_type => "blob", is_nullable => 1 },
  "value_bad",
  { data_type => "blob", is_nullable => 1 },
  "postscriptum",
  { data_type => "blob", is_nullable => 1 },
  "review_award_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 120 },
  "high_review_award_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "low_review_award_url",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "date_added",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
  "updated",
  {
    data_type => "timestamp",
    datetime_undef_if_invalid => 1,
    default_value => \"current_timestamp",
    is_nullable => 0,
  },
);
__PACKAGE__->set_primary_key("product_review_id");
__PACKAGE__->add_unique_constraint("product_id", ["product_id", "review_id", "langid"]);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2016-02-18 11:37:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZsVO2D6zTzZLU2WOkojuwg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
