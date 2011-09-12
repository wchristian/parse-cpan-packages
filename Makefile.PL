#!perl
use strict;
use warnings;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Parse::CPAN::Packages',
    VERSION_FROM => 'lib/Parse/CPAN/Packages.pm',
    AUTHOR       => 'Leon Brocard <acme@astray.com>',
    ABSTRACT     => 'Parse 02packages.details.txt.gz',
    LICENSE      => 'perl',
    PREREQ_PM    => {
        map { $_ => 0 }
          qw(
          Archive::Peek
          Compress::Zlib
          CPAN::DistnameInfo
          File::Slurp
          Moose
          Path::Class
          PPI
          Test::InDistDir
          Test::More
          version
          )
    }
);
