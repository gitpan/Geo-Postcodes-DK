###############################################################################
#                                                                             #
#          Geo::Postcodes::DK Test Suite 1 - Procedural interface             #
#          ------------------------------------------------------             # 
#               Arne Sommer - perl@bbop.org  - 19. July 2006                  #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as `perl 1_procedures.t'.  #
#                                                                             #
###############################################################################

use Test::More tests => 42;

BEGIN { use_ok('Geo::Postcodes::DK') };

#################################################################################

ok(   Geo::Postcodes::DK::legal ("0010"),            "Lovlig postnummer");
ok( ! Geo::Postcodes::DK::valid ("0010"),            "Postnummer ikke i bruk");
ok(   Geo::Postcodes::DK::legal ("0900"),            "Lovlig postnummer");
ok(   Geo::Postcodes::DK::valid ("0900"),            "Postnummer i bruk");
ok( ! Geo::Postcodes::DK::legal ("10"),              "Ulovlig postnummer");
ok( ! Geo::Postcodes::DK::valid ("10"),              "Ulovlig postnummer");
ok( ! Geo::Postcodes::DK::legal ("Ett eller annet"), "Ulovlig postnummer");
ok( ! Geo::Postcodes::DK::valid ("Ett eller annet"), "Ulovlig postnummer");

ok( Geo::Postcodes::DK::legal          ("1171"),                "Lovlig postnummer");
ok( Geo::Postcodes::DK::valid          ("1171"),                "Postnummer i bruk");
is( Geo::Postcodes::DK::location_of    ("1171"), "København K", "Postnummer > Poststed");
is( Geo::Postcodes::DK::type_of        ("1171"), "ST",          "Postnummer > Kategori");
is( Geo::Postcodes::DK::type_verbose_of("1171"), "Gadeadresse",    "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of    ("1171"), undef,            "Postnummer > Kategori");

is( Geo::Postcodes::DK::address_of     ("1171"), "Fiolstræde",  "Postnummer > Adresse");
is( Geo::Postcodes::DK::owner_of       ("1171"), undef,         "Postnummer > Eier");

#################################################################################

ok( Geo::Postcodes::DK::legal          ("215"),             "Lovlig postnummer");
ok( Geo::Postcodes::DK::valid          ("215"),             "Postnummer i bruk");
is( Geo::Postcodes::DK::location_of    ("215"), "Sandur",   "Postnummer > Poststed");
is( Geo::Postcodes::DK::type_of        ("215"), "BX",       "Postnummer > Kategori");
is( Geo::Postcodes::DK::type_verbose_of("215"), "Postboks", "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of    ("215"), undef,      "Postnummer > Kategori");
is( Geo::Postcodes::DK::address_of     ("215"), undef,      "Postnummer > Adresse");
is( Geo::Postcodes::DK::owner_of       ("215"), undef,      "Postnummer > Eier");

#################################################################################

ok( Geo::Postcodes::DK::legal          ("0999"),                   "Lovlig postnummer");
ok( Geo::Postcodes::DK::valid          ("0999"),                   "Postnummer i bruk");
is( Geo::Postcodes::DK::location_of    ("0999"), "København C",    "Postnummer > Poststed");
is( Geo::Postcodes::DK::type_of        ("0999"), "IO",             "Postnummer > Kategori");
is( Geo::Postcodes::DK::type_verbose_of("0999"), "Personlig ejer", "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of    ("0999"), undef,            "Postnummer > Kategori");
is( Geo::Postcodes::DK::address_of     ("0999"), undef,            "Postnummer > Adresse");
is( Geo::Postcodes::DK::owner_of       ("0999"), "DR Byen",        "Postnummer > Eier");


## And now, error handling ######################################################

ok( ! Geo::Postcodes::DK::legal (undef), "Ulovlig postnummer");
ok( ! Geo::Postcodes::DK::valid (undef), "Postnummer ikke i bruk");

is( Geo::Postcodes::DK::location_of    (undef), undef, "Postnummer > Poststed");
is( Geo::Postcodes::DK::type_of        (undef), undef, "Postnummer > Kategori");
is( Geo::Postcodes::DK::type_verbose_of(undef), undef, "Postnummer > Kategori");
is( Geo::Postcodes::type_verbose_of    (undef), undef, "Postnummer > Kategori");
is( Geo::Postcodes::DK::type_of        (undef), undef, "Postnummer > Kategori");
is( Geo::Postcodes::DK::address_of     (undef), undef, "Postnummer > Adresse");
is( Geo::Postcodes::DK::owner_of       (undef), undef, "Postnummer > Eier");

#################################################################################
