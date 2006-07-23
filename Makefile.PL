use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'Geo::Postcodes::DK',
    'VERSION_FROM'	=> 'DK.pm', # finds $VERSION
    'PREREQ_PM'		=> { Geo::Postcodes => 0.03 }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'DK.pm', # retrieve abstract from module
       AUTHOR     => 'Arne Sommer <perl@bbop.org>') : ()),
);
