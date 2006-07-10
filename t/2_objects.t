###############################################################################
#                                                                             #
#            Geo::Postcodes::DK Test Suite 2 - Object interface               #
#            --------------------------------------------------               # 
#               Arne Sommer - arne@cpan.org  - 10. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 1_procedures.t'.  #
#                                                                             #
###############################################################################

use Test::More tests => 16;

BEGIN { use_ok('Geo::Postcodes::DK') };

#################################################################################

my $P = Geo::Postcodes::DK->new("1171");
isa_ok($P, "Geo::Postcodes::DK");

is( $P->postcode(), "1171",         "Postcode object  > Postcode");
is( $P->location(), "København K",  "Postcode object  > Location");
is( $P->type(),     "Gateadresse",  "Postcode object  > Type");
is( $P->address(),  "Fiolstræde",   "Postcode object  > Address");
is( $P->owner(),    undef,          "Postcode object  > Owner");

#################################################################################

my $P2 = Geo::Postcodes::DK->new("215"); # Another one.
isa_ok($P2, "Geo::Postcodes::DK");

is( $P2->postcode(), "215",          "Postcode object  > Postcode");
is( $P2->location(), "Sandur",       "Postcode object  > Location");
is( $P2->type(),     "Postboks",     "Postcode object  > Type");
is( $P2->address(),  undef,          "Postcode object  > Address");
is( $P2->owner(),    undef,          "Postcode object  > Owner");

## And now, error handling ######################################################

my $P3 = Geo::Postcodes::DK->new("9999"); # Dette postnummeret er ikke i bruk.
is( $P3, undef, "Undef ved ulovlig postnummer");

$P3 = Geo::Postcodes::DK->new(undef); 
is( $P3, undef, "Undef ved ulovlig postnummer");

$P3 = Geo::Postcodes::DK->new("Totusensekshundreognoenogtredve"); 
is( $P3, undef, "Undef ved ulovlig postnummer");

#################################################################################

