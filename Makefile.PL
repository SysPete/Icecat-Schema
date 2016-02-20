use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME          => 'Icecat::Schema',
    AUTHOR        => q{Peter Mottram (SysPete) <peter@sysnix.com>},
    VERSION_FROM  => 'lib/Icecat/Schema.pm',
    ABSTRACT_FROM => 'lib/Icecat/Schema.pm',
    ( $ExtUtils::MakeMaker::VERSION >= 6.47
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES           => {},
    EXE_FILES          => [],
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
        'DBIx::Class'         => 0,
    },
    CONFIGURE => sub {

# PREREQ_PM stuff goes here since we need to add DBIC deploy
# dependencies in the DBIC way so such things as SQLT version
# deps needed by DBIC are always met correctly
# https://metacpan.org/pod/distribution/DBIx-Class/lib/DBIx/Class/Optional/Dependencies.pod
        my $href;
        $href->{PREREQ_PM} = {
            'DBIx::Class'                          => 0,
            'DBIx::Class::Helpers'                 => 2.024001,
            'DBIx::Class::InflateColumn::DateTime' => 0,
            'DBIx::Class::Schema::Config'          => 0.001011,
            'DBIx::Class::Tree'                    => 0,
            'DateTime'                             => 0,
            'Try::Tiny'                            => 0,
            'XML::Twig'                            => 0,
            # Add SQLT dep on version 0 to catch the case of users installing
            # directly from checked out repo who will not have META files yet.
            # This is also needed for travis-ci.
            'SQL::Translator' => 0,
        };

        # now add in the DBIC deploy deps
        eval { require DBIx::Class::Optional::Dependencies };
        return $href if $@;
        my $deploy_deps =
          DBIx::Class::Optional::Dependencies->req_list_for('deploy');

        for ( keys %$deploy_deps ) {
            $href->{PREREQ_PM}->{$_} = $deploy_deps->{$_};
        }
        return $href;
    },
    BUILD_REQUIRES => {
        'Test::Deep'            => 0,
        'Test::More'            => 0,
    },
    dist       => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean      => { FILES    => 'Interchange6-Schema-*' },
    META_MERGE => {
        resources => {
            repository =>
              'https://github.com/interchange/interchange6-schema.git',
            bugtracker =>
              'https://github.com/interchange/interchange6-schema/issues',
            IRC => 'irc://irc.freenode.net/#interchange',
        },
    },
);
