###############################################################################
#                                                                             #
#        Geo::Postcodes::DK Test Suite 3 - The 'selection' procedure          #
#        -----------------------------------------------------------          #
#               Arne Sommer - arne@cpan.org  - 19. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 3_selection.t'.   #
#                                                                             #
###############################################################################

use Test::More tests => 5;

BEGIN { use_ok('Geo::Postcodes::DK') };

###############################################################################

my @loc  = qw(0900 0910 0929 0999);
my @loc1 = Geo::Postcodes::DK::selection(location => 'København C');
is_deeply(\@loc1, \@loc,                "location => 'København C'");

###############################################################################

my @typ  = qw(0910 0929 1045 1782 1931 4129 5029 7029 7429 8229 9029);

my @typ1 = Geo::Postcodes::DK::selection(type => 'PP');
is_deeply(\@typ1, \@typ,                "type => 'PP'");

my @typ2 = Geo::Postcodes::DK::selection(type_verbose => 'Ufrankerede svarforsendelser');
is_deeply(\@typ1, \@typ2,               "type_verbose => 'Ufrankerede svarforsendelser'");


###############################################################################

my @oo;

foreach (Geo::Postcodes::DK::selection(location => 'Taastrup'))
{
  push @oo, Geo::Postcodes::DK->new($_);
}

my @oo1 = Geo::Postcodes::DK->selection(location => 'Taastrup');
  ## As above, but as full Geo::Postcodes::DK objects .

is_deeply(\@oo1, \@oo, "List of objects");

###############################################################################
