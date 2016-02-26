# NAME

Icecat::Schema - DBIx::Class schema for icecat.biz data

# VERSION

0.003

# DESCRIPTION

DBIx::Class schema for [Icecat.biz](http://icecat.biz/) product datasheets.

You can use [DBIx::Class::Schema::Config](https://metacpan.org/pod/DBIx::Class::Schema::Config) for database credential storage.

# RESULT CLASSES

- [CategoryFeatureGroup](https://metacpan.org/pod/Icecat::Schema::Result::CategoryFeatureGroup)
- [CategoryFeature](https://metacpan.org/pod/Icecat::Schema::Result::CategoryFeature)
- [CategoryKeyword](https://metacpan.org/pod/Icecat::Schema::Result::CategoryKeyword)
- [Category](https://metacpan.org/pod/Icecat::Schema::Result::Category)
- [FeatureGroup](https://metacpan.org/pod/Icecat::Schema::Result::FeatureGroup)
- [FeatureLogoCategory](https://metacpan.org/pod/Icecat::Schema::Result::FeatureLogoCategory)
- [FeatureLogo](https://metacpan.org/pod/Icecat::Schema::Result::FeatureLogo)
- [Feature](https://metacpan.org/pod/Icecat::Schema::Result::Feature)
- [Language](https://metacpan.org/pod/Icecat::Schema::Result::Language)
- [Measure](https://metacpan.org/pod/Icecat::Schema::Result::Measure)
- [MeasureSign](https://metacpan.org/pod/Icecat::Schema::Result::MeasureSign)
- [ProductDescription](https://metacpan.org/pod/Icecat::Schema::Result::ProductDescription)
- [ProductFamily](https://metacpan.org/pod/Icecat::Schema::Result::ProductFamily)
- [ProductFeatureLocal](https://metacpan.org/pod/Icecat::Schema::Result::ProductFeatureLocal)
- [ProductFeature](https://metacpan.org/pod/Icecat::Schema::Result::ProductFeature)
- [ProductGallery](https://metacpan.org/pod/Icecat::Schema::Result::ProductGallery)
- [ProductMultimediaObject](https://metacpan.org/pod/Icecat::Schema::Result::ProductMultimediaObject)
- [Product](https://metacpan.org/pod/Icecat::Schema::Result::Product)
- [ProductRelated](https://metacpan.org/pod/Icecat::Schema::Result::ProductRelated)
- [ProductReview](https://metacpan.org/pod/Icecat::Schema::Result::ProductReview)
- [ProductSeries](https://metacpan.org/pod/Icecat::Schema::Result::ProductSeries)
- [SidIndex](https://metacpan.org/pod/Icecat::Schema::Result::SidIndex)

    Used for generating alternate keys for relationships with
    [Vocabulary](https://metacpan.org/pod/Icecat::Schema::Result::Vocabulary).

- [Supplier](https://metacpan.org/pod/Icecat::Schema::Result::Supplier)
- [Tex](https://metacpan.org/pod/Icecat::Schema::Result::Tex)

    Long I18N translations.

- [TidIndex](https://metacpan.org/pod/Icecat::Schema::Result::TidIndex)

    Used for generating alternate keys for relationships with
    [Tex](https://metacpan.org/pod/Icecat::Schema::Result::Tex).

- [Vocabulary](https://metacpan.org/pod/Icecat::Schema::Result::Vocabulary)

    Short I18N translations.
