use utf8;

package Icecat::Schema::Result::SidIndex;

use strict;
use warnings;

use base 'DBIx::Class::Core';
__PACKAGE__->load_components( "InflateColumn::DateTime", "TimeStamp" );
__PACKAGE__->table("sid_index");
__PACKAGE__->add_columns(
    "sid", { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
    "dummy", { data_type => "integer", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("sid");

__PACKAGE__->has_many( languages => "Icecat::Schema::Result::Language", "sid" );

__PACKAGE__->has_many(
    vocabularies => "Icecat::Schema::Result::Vocabulary",
    "sid"
);

1;
