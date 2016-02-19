use utf8;

package Icecat::Schema::Result::FeatureGroup;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->table("feature_group");
__PACKAGE__->add_columns(
    feature_group_id => { data_type => "integer" },
    sid              => { data_type => "integer" },
);
__PACKAGE__->set_primary_key("feature_group_id");

__PACKAGE__->has_many(
    category_feature_groups => "Icecat::Schema::Result::CategoryFeatureGroup",
    "category_feature_group_id"
);

__PACKAGE__->has_many(
    names => "Icecat::Schema::Result::Vocabulary",
    { 'foreign.sid' => 'self.sid' }
);

__PACKAGE__->belongs_to(
    sidindex => "Icecat::Schema::Result::SidIndex",
    "sid"
);

1;
