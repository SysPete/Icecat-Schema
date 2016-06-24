#!/usr/bin/env perl

use warnings;
use strict;
use lib 'lib';

use Icecat::Schema;
use Path::Tiny;
use XML::Twig;

my $schema = Icecat::Schema->connect("ICECAT");
my $product;

foreach my $file ( path("xml/products")->children ) {

    next unless $file->basename =~ /^(\d+)\.xml$/;
    my $id = $1;

    $product = $schema->resultset('Product')
      ->find( $id, { prefetch => "descriptions" } );
    next unless $product;

    die "Product $id not found in database" unless $product;

    print "Processing file: $file\n";

    $schema->txn_do(
        sub {
            my $twig = XML::Twig->new(
                twig_handlers => {
                    EANCode => sub {
                        my ( $t, $elt ) = @_;
                        if ( my $gtin = $elt->att('EAN') ) {
                            $product->gtin($gtin);
                        }
                        1;
                    },
                }
            );
            $twig->parsefile($file);

            $product->update;
        }
    );
}

