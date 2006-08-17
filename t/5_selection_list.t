###############################################################################
#                                                                             #
#           Geo::Postcodes::DK Test Suite 5 - Advanced selection              #
#        -----------------------------------------------------------          #
#               Arne Sommer - perl@bbop.org  - 17. August 2006                #
#                                                                             #
###############################################################################
#                                                                             #
# Before `make install' is performed this script should be runnable with      #
# `make test'. After `make install' it should work as                         #
# `perl 5_selection_list.t'.                                                  #
#                                                                             #
###############################################################################
#                                                                             #
# Note that this test file requires 'List::MoreUtils' to work.                #
#                                                                             #
###############################################################################

use Test::More tests => 4;

BEGIN { use_ok('Geo::Postcodes::DK') };
BEGIN { use_ok('List::MoreUtils') };

###############################################################################

my @or = Geo::Postcodes::DK::selection('or', postcode => '4%',
                                             postcode => '9%');
  # All postcodes starting with '4' or '9'.

my @or1 = List::MoreUtils::uniq(sort(
           Geo::Postcodes::DK::selection(postcode => '4%'), 
           Geo::Postcodes::DK::selection(postcode => '9%')));
             # Merge the two lists, and remove duplicates.

is_deeply(\@or1, \@or, "Combined selection-or");

###############################################################################

my @one = Geo::Postcodes::DK::selection('or', postcode => '1%',
                                              postcode => '%9');
  # All postcodes starting with '1' or ending with '9'.

my @one1 = List::MoreUtils::uniq(sort(
           Geo::Postcodes::DK::selection(postcode => '1%'), 
           Geo::Postcodes::DK::selection(postcode => '%9')));
             # Merge the two lists, and remove duplicates.

is_deeply(\@one1, \@one, "Combined selection-or");

###############################################################################
