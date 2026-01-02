
use 5.008;
use ExtUtils::MakeMaker;

my $EUMM_VERSION = $ExtUtils::MakeMaker::VERSION;
$EUMM_VERSION =~ tr/_//d;

my %write_makefile_args = (
    NAME         => 'Devel::Hide',
    VERSION_FROM => 'lib/Devel/Hide.pm',
    PREREQ_PM    => {
        'perl'       => 5.006001,
    },
    ABSTRACT_FROM => 'lib/Devel/Hide.pm',
    AUTHOR        => 'Adriano Ferreira <ferreira@cpan.org>',
    LICENSE       => 'perl',
    META_MERGE    => {
        'dynamic_config' => 0,
        'meta-spec'      => { version => 2 },
        'prereqs'        => {
            test => {
                requires => {
                    'Test::More' => 0.82,
                },
            },
            develop => {
                requires => {
                    'Test::Pod'           => 1.18,
                    'Test::Pod::Coverage' => 1.04,
                },
            },
        },
        resources => {
            repository => {
                type => 'git',
                url  => 'https://github.com/DrHyde/Devel-Hide.git',
                web  => 'https://github.com/DrHyde/Devel-Hide',
            },
        },
    },
);

delete $write_makefile_args{LICENSE} if $EUMM_VERSION < 6.31;

delete $write_makefile_args{META_MERGE} if $EUMM_VERSION < 6.4501;

WriteMakefile(%write_makefile_args);

