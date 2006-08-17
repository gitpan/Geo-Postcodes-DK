###############################################################################
#                                                                             #
#           Geo::Postcodes::DK Test Suite 4 - Available methods               #
#           ---------------------------------------------------               #
#               Arne Sommer - perl@bbop.org  - 30. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 4_methods.t'.     #
#                                                                             #
###############################################################################

use Test::More tests => 20;

BEGIN { use_ok('Geo::Postcodes::DK') };

###############################################################################

my @methods  = qw(postcode location address owner type type_verbose);

my @methods1 = Geo::Postcodes::DK::get_methods();
my @methods2 = Geo::Postcodes::DK->get_methods();

is_deeply(\@methods, \@methods1, "Geo::Postcodes::DK::get_methods()");
is_deeply(\@methods, \@methods2, "Geo::Postcodes::DK->get_methods()");

foreach (@methods)
{
  ok (Geo::Postcodes::DK::is_method($_), "Geo::Postcodes::DK::is_method()");
  ok (Geo::Postcodes::DK->is_method($_), "Geo::Postcodes::DK->is_method()");
}

foreach (qw (just kidding))
{
  ok (! Geo::Postcodes::DK::is_method($_), "Geo::Postcodes::DK::is_method()");
  ok (! Geo::Postcodes::DK->is_method($_), "Geo::Postcodes::DK->is_method()");
}

is (Geo::Postcodes::DK::selection("kidding", "1299"), undef);