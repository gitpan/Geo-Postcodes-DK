package Geo::Postcodes::DK;

use Geo::Postcodes 0.30;
use base qw(Geo::Postcodes);

use strict;
use warnings;

our $VERSION = '0.30';

## Which fields are available ##################################################

my @valid_fields = qw(postcode location address owner type type_verbose);
  # Used by the 'get_fields' procedure.

my %valid_fields; # Used by the 'is_field' procedure/method.

foreach (@valid_fields)
{
  $valid_fields{$_} = 1;
}

## Private Variables ############################################################

my (%location, %borough, %type, %address, %owner);

## Type Description #############################################################

my %typedesc;

$typedesc{BX} = "Postboks";
$typedesc{ST} = "Gadeadresse";
$typedesc{IO} = "Personlig ejer";
$typedesc{PP} = "Ufrankerede svarforsendelser";

## OO Methods ###################################################################

sub new
{
  my $class    = shift;
  my $postcode = shift;

  return unless valid($postcode);

  my $self = bless \(my $dummy), $class;

  $Geo::Postcodes::postcode_of  {$self} = $postcode;
  $Geo::Postcodes::location_of  {$self} = location_of($postcode);
  $Geo::Postcodes::type_of      {$self} = type_of($postcode);
  $Geo::Postcodes::owner_of     {$self} = owner_of($postcode);
  $Geo::Postcodes::address_of   {$self} = address_of($postcode);

  return $self;
}

sub DESTROY
{
  my $object_id = $_[0];

  delete $Geo::Postcodes::postcode_of  {$object_id};
  delete $Geo::Postcodes::location_of  {$object_id};
  delete $Geo::Postcodes::type_of      {$object_id};
  delete $Geo::Postcodes::owner_of     {$object_id};
  delete $Geo::Postcodes::address_of   {$object_id};
}

sub get_fields
{
  return @valid_fields;
}

sub is_field
{
  my $field = shift;
  $field    = shift if $field =~ /Geo::Postcodes/; # Called on an object.

  return 1 if $valid_fields{$field};
  return 0;
}

sub type_verbose # Override the one in the base class.
{
  my $self = shift;
  return unless $self;
  return unless $Geo::Postcodes::type_of{$self};
  return unless $typedesc{$Geo::Postcodes::type_of{$self}};
  return $typedesc{$Geo::Postcodes::type_of{$self}};
}

## Global Procedures ############################################################

sub legal # Is it a legal code, i.e. something that follows the syntax rule.
{
  my $postcode = shift;
  return 0 unless $postcode;
  return 0 unless $postcode =~ /^\d{3,4}$/;
  return 1;
}

sub valid # Is the code in actual use.
{
  my $postcode = shift;
  return 0 unless legal($postcode);

  return 1 if $location{$postcode};
  return 0;
}

sub postcode_of # So that 'selection' does not choke.
{
  my $postcode = shift;
  return $postcode;
}

sub location_of
{
  my $postcode = shift;
  return unless $postcode;

  return $location{$postcode} if $location{$postcode};
  return;
}

sub address_of
{
  my $postcode = shift;
  return unless $postcode;

  return $address{$postcode} if $address{$postcode};
  return;
}

sub owner_of
{
  my $postcode = shift;
  return unless $postcode;

  return $owner{$postcode} if $owner{$postcode};
  return;
}

sub type_of
{
  my $postcode = shift;
  return unless $postcode;
  return unless $type{$postcode};

  return $type{$postcode};
}

sub type_verbose_of
{
  my $postcode = shift;
  return unless $postcode;

  my $type = type_of($postcode);
  return unless $type;

  return type2verbose($type);
}

sub type2verbose
{
  my $type = shift;
  return unless $type;
  return unless $typedesc{$type};
  return $typedesc{$type};
}

sub get_postcodes
{
  return keys %location;
}

## Returns a list of postcodes if called as a procedure; Geo::Postcodes::DK::selection(xx => 'yy')
## Returns a list of objects if called as a method;      Geo::Postcodes::DK->selection(xx => 'yy')

sub verify_selectionlist
{
  return Geo::Postcodes::_verify_selectionlist("Geo::Postcodes::DK", @_);
}

sub selection
{
  return Geo::Postcodes::_selection("Geo::Postcodes::DK", @_);
    # Black magic.
}

sub selection_loop
{
  return Geo::Postcodes::_selection_loop('Geo::Postcodes::DK', @_);
    # Black magic.
}

## bin/update begin
## This data structure was auto generated on Wed Jul 19 13:03:36 2006. Do NOT edit it!

$location{'0555'} = "Scanning"; $owner{'0555'} = "Data Scanning A/S, 'L�s Ind'-service";
$location{'0555'} = "Scanning"; $owner{'0555'} = "Data Scanning A/S, 'L�s Ind'-service";
$location{'0800'} = "H�je Taastrup"; $owner{'0800'} = "BG-Bank A/S"; $type{'0800'} = "IO";
$location{'0877'} = "Valby"; $owner{'0877'} = "Aller Press (konkurrencer)"; $type{'0877'} = "IO";
$location{'0900'} = "K�benhavn C"; $owner{'0900'} = "K�benhavns Postcenter + erhvervskunder";
$location{'0910'} = "K�benhavn C"; $type{'0910'} = "PP";
$location{'0929'} = "K�benhavn C"; $type{'0929'} = "PP";
$location{'0999'} = "K�benhavn C"; $owner{'0999'} = "DR Byen"; $type{'0999'} = "IO";
$location{'1000'} = "K�benhavn K"; $owner{'1000'} = "K�bmagergade Postkontor"; $type{'1000'} = "IO";
$location{'1001'} = "K�benhavn K"; $type{'1001'} = "BX";
$location{'1002'} = "K�benhavn K"; $type{'1002'} = "BX";
$location{'1003'} = "K�benhavn K"; $type{'1003'} = "BX";
$location{'1004'} = "K�benhavn K"; $type{'1004'} = "BX";
$location{'1005'} = "K�benhavn K"; $type{'1005'} = "BX";
$location{'1006'} = "K�benhavn K"; $type{'1006'} = "BX";
$location{'1007'} = "K�benhavn K"; $type{'1007'} = "BX";
$location{'1008'} = "K�benhavn K"; $type{'1008'} = "BX";
$location{'1009'} = "K�benhavn K"; $type{'1009'} = "BX";
$location{'1010'} = "K�benhavn K"; $type{'1010'} = "BX";
$location{'1011'} = "K�benhavn K"; $type{'1011'} = "BX";
$location{'1012'} = "K�benhavn K"; $type{'1012'} = "BX";
$location{'1013'} = "K�benhavn K"; $type{'1013'} = "BX";
$location{'1014'} = "K�benhavn K"; $type{'1014'} = "BX";
$location{'1015'} = "K�benhavn K"; $type{'1015'} = "BX";
$location{'1016'} = "K�benhavn K"; $type{'1016'} = "BX";
$location{'1017'} = "K�benhavn K"; $type{'1017'} = "BX";
$location{'1018'} = "K�benhavn K"; $type{'1018'} = "BX";
$location{'1019'} = "K�benhavn K"; $type{'1019'} = "BX";
$location{'1020'} = "K�benhavn K"; $type{'1020'} = "BX";
$location{'1021'} = "K�benhavn K"; $type{'1021'} = "BX";
$location{'1022'} = "K�benhavn K"; $type{'1022'} = "BX";
$location{'1023'} = "K�benhavn K"; $type{'1023'} = "BX";
$location{'1024'} = "K�benhavn K"; $type{'1024'} = "BX";
$location{'1025'} = "K�benhavn K"; $type{'1025'} = "BX";
$location{'1026'} = "K�benhavn K"; $type{'1026'} = "BX";
$location{'1045'} = "K�benhavn K"; $type{'1045'} = "PP";
$location{'1050'} = "K�benhavn K"; $address{'1050'} = "Kongens Nytorv"; $type{'1050'} = "ST";
$location{'1051'} = "K�benhavn K"; $address{'1051'} = "Nyhavn"; $type{'1051'} = "ST";
$location{'1052'} = "K�benhavn K"; $address{'1052'} = "Herluf Trolles Gade"; $type{'1052'} = "ST";
$location{'1053'} = "K�benhavn K"; $address{'1053'} = "Cort Adelers Gade"; $type{'1053'} = "ST";
$location{'1054'} = "K�benhavn K"; $address{'1054'} = "Peder Skrams Gade"; $type{'1054'} = "ST";
$location{'1055'} = "K�benhavn K"; $address{'1055'} = "August Bournonvilles Passage"; $type{'1055'} = "ST";
$location{'1055'} = "K�benhavn K"; $address{'1055'} = "August Bournonvilles Passage"; $type{'1055'} = "ST";
$location{'1056'} = "K�benhavn K"; $address{'1056'} = "Heibergsgade"; $type{'1056'} = "ST";
$location{'1057'} = "K�benhavn K"; $address{'1057'} = "Holbergsgade"; $type{'1057'} = "ST";
$location{'1058'} = "K�benhavn K"; $address{'1058'} = "Havnegade"; $type{'1058'} = "ST";
$location{'1059'} = "K�benhavn K"; $address{'1059'} = "Niels Juels Gade"; $type{'1059'} = "ST";
$location{'1060'} = "K�benhavn K"; $address{'1060'} = "Holmens Kanal"; $type{'1060'} = "ST";
$location{'1061'} = "K�benhavn K"; $address{'1061'} = "Ved Stranden"; $type{'1061'} = "ST";
$location{'1062'} = "K�benhavn K"; $address{'1062'} = "Boldhusgade"; $type{'1062'} = "ST";
$location{'1063'} = "K�benhavn K"; $address{'1063'} = "Laksegade"; $type{'1063'} = "ST";
$location{'1064'} = "K�benhavn K"; $address{'1064'} = "Asylgade"; $type{'1064'} = "ST";
$location{'1065'} = "K�benhavn K"; $address{'1065'} = "Fortunstr�de"; $type{'1065'} = "ST";
$location{'1066'} = "K�benhavn K"; $address{'1066'} = "Admiralgade"; $type{'1066'} = "ST";
$location{'1067'} = "K�benhavn K"; $address{'1067'} = "Nikolaj Plads"; $type{'1067'} = "ST";
$location{'1068'} = "K�benhavn K"; $address{'1068'} = "Nikolajgade"; $type{'1068'} = "ST";
$location{'1069'} = "K�benhavn K"; $address{'1069'} = "Bremerholm"; $type{'1069'} = "ST";
$location{'1070'} = "K�benhavn K"; $address{'1070'} = "Ving�rdstr�de"; $type{'1070'} = "ST";
$location{'1071'} = "K�benhavn K"; $address{'1071'} = "Dybensgade"; $type{'1071'} = "ST";
$location{'1072'} = "K�benhavn K"; $address{'1072'} = "Lille Kirkestr�de"; $type{'1072'} = "ST";
$location{'1073'} = "K�benhavn K"; $address{'1073'} = "Store Kirkestr�de"; $type{'1073'} = "ST";
$location{'1074'} = "K�benhavn K"; $address{'1074'} = "Lille Kongensgade"; $type{'1074'} = "ST";
$location{'1092'} = "K�benhavn K"; $owner{'1092'} = "Danske Bank A/S"; $type{'1092'} = "IO";
$location{'1093'} = "K�benhavn K"; $owner{'1093'} = "Danmarks Nationalbank"; $type{'1093'} = "IO";
$location{'1095'} = "K�benhavn K"; $owner{'1095'} = "Magasin du Nord"; $type{'1095'} = "IO";
$location{'1098'} = "K�benhavn K"; $owner{'1098'} = "A.P. M�ller"; $type{'1098'} = "IO";
$location{'1100'} = "K�benhavn K"; $address{'1100'} = "�stergade"; $type{'1100'} = "ST";
$location{'1101'} = "K�benhavn K"; $address{'1101'} = "Ny �stergade"; $type{'1101'} = "ST";
$location{'1102'} = "K�benhavn K"; $address{'1102'} = "Pistolstr�de"; $type{'1102'} = "ST";
$location{'1103'} = "K�benhavn K"; $address{'1103'} = "Hovedvagtsgade"; $type{'1103'} = "ST";
$location{'1104'} = "K�benhavn K"; $address{'1104'} = "Ny Adelgade"; $type{'1104'} = "ST";
$location{'1105'} = "K�benhavn K"; $address{'1105'} = "Kristen Bernikows Gade"; $type{'1105'} = "ST";
$location{'1106'} = "K�benhavn K"; $address{'1106'} = "Antonigade"; $type{'1106'} = "ST";
$location{'1107'} = "K�benhavn K"; $address{'1107'} = "Gr�nnegade"; $type{'1107'} = "ST";
$location{'1110'} = "K�benhavn K"; $address{'1110'} = "Store Regnegade"; $type{'1110'} = "ST";
$location{'1111'} = "K�benhavn K"; $address{'1111'} = "Christian IX's Gade"; $type{'1111'} = "ST";
$location{'1112'} = "K�benhavn K"; $address{'1112'} = "Pilestr�de"; $type{'1112'} = "ST";
$location{'1113'} = "K�benhavn K"; $address{'1113'} = "Silkegade"; $type{'1113'} = "ST";
$location{'1114'} = "K�benhavn K"; $address{'1114'} = "Kronprinsensgade"; $type{'1114'} = "ST";
$location{'1115'} = "K�benhavn K"; $address{'1115'} = "Klareboderne"; $type{'1115'} = "ST";
$location{'1116'} = "K�benhavn K"; $address{'1116'} = "M�ntergade"; $type{'1116'} = "ST";
$location{'1117'} = "K�benhavn K"; $address{'1117'} = "Gammel M�nt"; $type{'1117'} = "ST";
$location{'1118'} = "K�benhavn K"; $address{'1118'} = "Sv�rtegade"; $type{'1118'} = "ST";
$location{'1119'} = "K�benhavn K"; $address{'1119'} = "Landem�rket"; $type{'1119'} = "ST";
$location{'1120'} = "K�benhavn K"; $address{'1120'} = "Vognmagergade"; $type{'1120'} = "ST";
$location{'1121'} = "K�benhavn K"; $address{'1121'} = "L�nporten"; $type{'1121'} = "ST";
$location{'1122'} = "K�benhavn K"; $address{'1122'} = "Sj�leboderne"; $type{'1122'} = "ST";
$location{'1123'} = "K�benhavn K"; $address{'1123'} = "Gothersgade"; $type{'1123'} = "ST";
$location{'1124'} = "K�benhavn K"; $address{'1124'} = "�benr�"; $type{'1124'} = "ST";
$location{'1125'} = "K�benhavn K"; $address{'1125'} = "Suhmsgade"; $type{'1125'} = "ST";
$location{'1126'} = "K�benhavn K"; $address{'1126'} = "Pustervig"; $type{'1126'} = "ST";
$location{'1127'} = "K�benhavn K"; $address{'1127'} = "Hauser Plads"; $type{'1127'} = "ST";
$location{'1128'} = "K�benhavn K"; $address{'1128'} = "Hausergade"; $type{'1128'} = "ST";
$location{'1129'} = "K�benhavn K"; $address{'1129'} = "Sankt Gertruds Str�de"; $type{'1129'} = "ST";
$location{'1130'} = "K�benhavn K"; $address{'1130'} = "Rosenborggade"; $type{'1130'} = "ST";
$location{'1131'} = "K�benhavn K"; $address{'1131'} = "Tornebuskegade"; $type{'1131'} = "ST";
$location{'1140'} = "K�benhavn K"; $owner{'1140'} = "Dagbladet B�rsen"; $type{'1140'} = "IO";
$location{'1147'} = "K�benhavn K"; $owner{'1147'} = "Berlingske Tidende"; $type{'1147'} = "IO";
$location{'1148'} = "K�benhavn K"; $owner{'1148'} = "Gutenberghus"; $type{'1148'} = "IO";
$location{'1150'} = "K�benhavn K"; $address{'1150'} = "K�bmagergade"; $type{'1150'} = "ST";
$location{'1151'} = "K�benhavn K"; $address{'1151'} = "Valkendorfsgade"; $type{'1151'} = "ST";
$location{'1152'} = "K�benhavn K"; $address{'1152'} = "L�vstr�de"; $type{'1152'} = "ST";
$location{'1153'} = "K�benhavn K"; $address{'1153'} = "Niels Hemmingsens Gade"; $type{'1153'} = "ST";
$location{'1154'} = "K�benhavn K"; $address{'1154'} = "Gr�br�dretorv"; $type{'1154'} = "ST";
$location{'1155'} = "K�benhavn K"; $address{'1155'} = "Kejsergade"; $type{'1155'} = "ST";
$location{'1156'} = "K�benhavn K"; $address{'1156'} = "Gr�br�drestr�de"; $type{'1156'} = "ST";
$location{'1157'} = "K�benhavn K"; $address{'1157'} = "Klosterstr�de"; $type{'1157'} = "ST";
$location{'1158'} = "K�benhavn K"; $address{'1158'} = "Skoubogade"; $type{'1158'} = "ST";
$location{'1159'} = "K�benhavn K"; $address{'1159'} = "Skindergade"; $type{'1159'} = "ST";
$location{'1160'} = "K�benhavn K"; $address{'1160'} = "Amagertorv"; $type{'1160'} = "ST";
$location{'1161'} = "K�benhavn K"; $address{'1161'} = "Vimmelskaftet"; $type{'1161'} = "ST";
$location{'1162'} = "K�benhavn K"; $address{'1162'} = "Jorcks Passage"; $type{'1162'} = "ST";
$location{'1163'} = "K�benhavn K"; $address{'1163'} = "Klosterg�rden"; $type{'1163'} = "ST";
$location{'1164'} = "K�benhavn K"; $address{'1164'} = "Nygade"; $type{'1164'} = "ST";
$location{'1165'} = "K�benhavn K"; $address{'1165'} = "N�rregade"; $type{'1165'} = "ST";
$location{'1166'} = "K�benhavn K"; $address{'1166'} = "Dyrk�b"; $type{'1166'} = "ST";
$location{'1167'} = "K�benhavn K"; $address{'1167'} = "Bispetorvet"; $type{'1167'} = "ST";
$location{'1168'} = "K�benhavn K"; $address{'1168'} = "Frue Plads"; $type{'1168'} = "ST";
$location{'1169'} = "K�benhavn K"; $address{'1169'} = "Store Kannikestr�de"; $type{'1169'} = "ST";
$location{'1170'} = "K�benhavn K"; $address{'1170'} = "Lille Kannikestr�de"; $type{'1170'} = "ST";
$location{'1171'} = "K�benhavn K"; $address{'1171'} = "Fiolstr�de"; $type{'1171'} = "ST";
$location{'1172'} = "K�benhavn K"; $address{'1172'} = "Krystalgade"; $type{'1172'} = "ST";
$location{'1173'} = "K�benhavn K"; $address{'1173'} = "Peder Hvitfeldts Str�de"; $type{'1173'} = "ST";
$location{'1174'} = "K�benhavn K"; $address{'1174'} = "Roseng�rden"; $type{'1174'} = "ST";
$location{'1175'} = "K�benhavn K"; $address{'1175'} = "Kultorvet"; $type{'1175'} = "ST";
$location{'1200'} = "K�benhavn K"; $address{'1200'} = "H�jbro Plads"; $type{'1200'} = "ST";
$location{'1201'} = "K�benhavn K"; $address{'1201'} = "L�derstr�de"; $type{'1201'} = "ST";
$location{'1202'} = "K�benhavn K"; $address{'1202'} = "Gammel Strand"; $type{'1202'} = "ST";
$location{'1203'} = "K�benhavn K"; $address{'1203'} = "Nybrogade"; $type{'1203'} = "ST";
$location{'1204'} = "K�benhavn K"; $address{'1204'} = "Magstr�de"; $type{'1204'} = "ST";
$location{'1205'} = "K�benhavn K"; $address{'1205'} = "Snaregade"; $type{'1205'} = "ST";
$location{'1206'} = "K�benhavn K"; $address{'1206'} = "Nabol�s"; $type{'1206'} = "ST";
$location{'1207'} = "K�benhavn K"; $address{'1207'} = "Hyskenstr�de"; $type{'1207'} = "ST";
$location{'1208'} = "K�benhavn K"; $address{'1208'} = "Kompagnistr�de"; $type{'1208'} = "ST";
$location{'1209'} = "K�benhavn K"; $address{'1209'} = "Badstuestr�de"; $type{'1209'} = "ST";
$location{'1210'} = "K�benhavn K"; $address{'1210'} = "Knabrostr�de"; $type{'1210'} = "ST";
$location{'1211'} = "K�benhavn K"; $address{'1211'} = "Brol�ggerstr�de"; $type{'1211'} = "ST";
$location{'1212'} = "K�benhavn K"; $address{'1212'} = "Vindebrogade"; $type{'1212'} = "ST";
$location{'1213'} = "K�benhavn K"; $address{'1213'} = "Bertel Thorvaldsens Plads"; $type{'1213'} = "ST";
$location{'1214'} = "K�benhavn K"; $address{'1214'} = "T�jhusgade"; $type{'1214'} = "ST";
$location{'1214'} = "K�benhavn K"; $address{'1214'} = "T�jhusgade"; $type{'1214'} = "ST";
$location{'1215'} = "K�benhavn K"; $address{'1215'} = "B�rsgade"; $type{'1215'} = "ST";
$location{'1216'} = "K�benhavn K"; $address{'1216'} = "Slotsholmsgade"; $type{'1216'} = "ST";
$location{'1217'} = "K�benhavn K"; $address{'1217'} = "B�rsen"; $type{'1217'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1218'} = "K�benhavn K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "ST";
$location{'1219'} = "K�benhavn K"; $address{'1219'} = "Christians Brygge ulige nr. + 2-22"; $type{'1219'} = "ST";
$location{'1220'} = "K�benhavn K"; $address{'1220'} = "Frederiksholms Kanal"; $type{'1220'} = "ST";
$location{'1240'} = "K�benhavn K"; $owner{'1240'} = "Folketinget"; $type{'1240'} = "IO";
$location{'1250'} = "K�benhavn K"; $address{'1250'} = "Sankt Ann� Plads"; $type{'1250'} = "ST";
$location{'1251'} = "K�benhavn K"; $address{'1251'} = "Kv�sthusgade"; $type{'1251'} = "ST";
$location{'1252'} = "K�benhavn K"; $address{'1252'} = "Kv�sthusbroen"; $type{'1252'} = "ST";
$location{'1253'} = "K�benhavn K"; $address{'1253'} = "Toldbodgade"; $type{'1253'} = "ST";
$location{'1254'} = "K�benhavn K"; $address{'1254'} = "Lille Strandstr�de"; $type{'1254'} = "ST";
$location{'1255'} = "K�benhavn K"; $address{'1255'} = "Store Strandstr�de"; $type{'1255'} = "ST";
$location{'1256'} = "K�benhavn K"; $address{'1256'} = "Amaliegade"; $type{'1256'} = "ST";
$location{'1257'} = "K�benhavn K"; $address{'1257'} = "Amalienborg"; $type{'1257'} = "ST";
$location{'1258'} = "K�benhavn K"; $address{'1258'} = "Larsens Plads"; $type{'1258'} = "ST";
$location{'1259'} = "K�benhavn K"; $address{'1259'} = "Trekroner"; $type{'1259'} = "ST";
$location{'1259'} = "K�benhavn K"; $address{'1259'} = "Trekroner"; $type{'1259'} = "ST";
$location{'1260'} = "K�benhavn K"; $address{'1260'} = "Bredgade"; $type{'1260'} = "ST";
$location{'1261'} = "K�benhavn K"; $address{'1261'} = "Pal�gade"; $type{'1261'} = "ST";
$location{'1263'} = "K�benhavn K"; $address{'1263'} = "Churchillparken"; $type{'1263'} = "ST";
$location{'1263'} = "K�benhavn K"; $address{'1263'} = "Churchillparken"; $type{'1263'} = "ST";
$location{'1264'} = "K�benhavn K"; $address{'1264'} = "Store Kongensgade"; $type{'1264'} = "ST";
$location{'1265'} = "K�benhavn K"; $address{'1265'} = "Frederiksgade"; $type{'1265'} = "ST";
$location{'1266'} = "K�benhavn K"; $address{'1266'} = "Bornholmsgade"; $type{'1266'} = "ST";
$location{'1267'} = "K�benhavn K"; $address{'1267'} = "Hammerensgade"; $type{'1267'} = "ST";
$location{'1268'} = "K�benhavn K"; $address{'1268'} = "Jens Kofods Gade"; $type{'1268'} = "ST";
$location{'1270'} = "K�benhavn K"; $address{'1270'} = "Gr�nningen"; $type{'1270'} = "ST";
$location{'1271'} = "K�benhavn K"; $address{'1271'} = "Poul Ankers Gade"; $type{'1271'} = "ST";
$location{'1291'} = "K�benhavn K"; $owner{'1291'} = "J. Lauritzen A/S"; $type{'1291'} = "IO";
$location{'1300'} = "K�benhavn K"; $address{'1300'} = "Borgergade"; $type{'1300'} = "ST";
$location{'1301'} = "K�benhavn K"; $address{'1301'} = "Landgreven"; $type{'1301'} = "ST";
$location{'1302'} = "K�benhavn K"; $address{'1302'} = "Dronningens Tv�rgade"; $type{'1302'} = "ST";
$location{'1303'} = "K�benhavn K"; $address{'1303'} = "Hindegade"; $type{'1303'} = "ST";
$location{'1304'} = "K�benhavn K"; $address{'1304'} = "Adelgade"; $type{'1304'} = "ST";
$location{'1306'} = "K�benhavn K"; $address{'1306'} = "Kronprinsessegade"; $type{'1306'} = "ST";
$location{'1307'} = "K�benhavn K"; $address{'1307'} = "S�lvgade"; $type{'1307'} = "ST";
$location{'1307'} = "K�benhavn K"; $address{'1307'} = "S�lvgade"; $type{'1307'} = "ST";
$location{'1308'} = "K�benhavn K"; $address{'1308'} = "Klerkegade"; $type{'1308'} = "ST";
$location{'1309'} = "K�benhavn K"; $address{'1309'} = "Rosengade"; $type{'1309'} = "ST";
$location{'1310'} = "K�benhavn K"; $address{'1310'} = "Fredericiagade"; $type{'1310'} = "ST";
$location{'1311'} = "K�benhavn K"; $address{'1311'} = "Olfert Fischers Gade"; $type{'1311'} = "ST";
$location{'1312'} = "K�benhavn K"; $address{'1312'} = "Gammelvagt"; $type{'1312'} = "ST";
$location{'1313'} = "K�benhavn K"; $address{'1313'} = "Sankt Pauls Gade"; $type{'1313'} = "ST";
$location{'1314'} = "K�benhavn K"; $address{'1314'} = "Sankt Pauls Plads"; $type{'1314'} = "ST";
$location{'1315'} = "K�benhavn K"; $address{'1315'} = "R�vegade"; $type{'1315'} = "ST";
$location{'1316'} = "K�benhavn K"; $address{'1316'} = "Rigensgade"; $type{'1316'} = "ST";
$location{'1317'} = "K�benhavn K"; $address{'1317'} = "Stokhusgade"; $type{'1317'} = "ST";
$location{'1318'} = "K�benhavn K"; $address{'1318'} = "Krusemyntegade"; $type{'1318'} = "ST";
$location{'1319'} = "K�benhavn K"; $address{'1319'} = "Gernersgade"; $type{'1319'} = "ST";
$location{'1320'} = "K�benhavn K"; $address{'1320'} = "Haregade"; $type{'1320'} = "ST";
$location{'1321'} = "K�benhavn K"; $address{'1321'} = "Tigergade"; $type{'1321'} = "ST";
$location{'1322'} = "K�benhavn K"; $address{'1322'} = "Suensonsgade"; $type{'1322'} = "ST";
$location{'1323'} = "K�benhavn K"; $address{'1323'} = "Hjertensfrydsgade"; $type{'1323'} = "ST";
$location{'1324'} = "K�benhavn K"; $address{'1324'} = "Elsdyrsgade"; $type{'1324'} = "ST";
$location{'1325'} = "K�benhavn K"; $address{'1325'} = "Delfingade"; $type{'1325'} = "ST";
$location{'1326'} = "K�benhavn K"; $address{'1326'} = "Krokodillegade"; $type{'1326'} = "ST";
$location{'1327'} = "K�benhavn K"; $address{'1327'} = "Vildandegade"; $type{'1327'} = "ST";
$location{'1328'} = "K�benhavn K"; $address{'1328'} = "Svanegade"; $type{'1328'} = "ST";
$location{'1329'} = "K�benhavn K"; $address{'1329'} = "Timiansgade"; $type{'1329'} = "ST";
$location{'1349'} = "K�benhavn K"; $owner{'1349'} = "DSB"; $type{'1349'} = "IO";
$location{'1350'} = "K�benhavn K"; $address{'1350'} = "�ster Voldgade"; $type{'1350'} = "ST";
$location{'1352'} = "K�benhavn K"; $address{'1352'} = "R�rholmsgade"; $type{'1352'} = "ST";
$location{'1353'} = "K�benhavn K"; $address{'1353'} = "�ster Farimagsgade 1-19 + 2-2D"; $type{'1353'} = "ST";
$location{'1354'} = "K�benhavn K"; $address{'1354'} = "Ole Suhrs Gade"; $type{'1354'} = "ST";
$location{'1355'} = "K�benhavn K"; $address{'1355'} = "Gammeltoftsgade"; $type{'1355'} = "ST";
$location{'1356'} = "K�benhavn K"; $address{'1356'} = "Bartholinsgade"; $type{'1356'} = "ST";
$location{'1357'} = "K�benhavn K"; $address{'1357'} = "�ster S�gade 1 - 36"; $type{'1357'} = "ST";
$location{'1358'} = "K�benhavn K"; $address{'1358'} = "N�rre Voldgade"; $type{'1358'} = "ST";
$location{'1359'} = "K�benhavn K"; $address{'1359'} = "Ahlefeldtsgade"; $type{'1359'} = "ST";
$location{'1360'} = "K�benhavn K"; $address{'1360'} = "Frederiksborggade"; $type{'1360'} = "ST";
$location{'1361'} = "K�benhavn K"; $address{'1361'} = "Linn�sgade"; $type{'1361'} = "ST";
$location{'1361'} = "K�benhavn K"; $address{'1361'} = "Linn�sgade"; $type{'1361'} = "ST";
$location{'1362'} = "K�benhavn K"; $address{'1362'} = "R�mersgade"; $type{'1362'} = "ST";
$location{'1363'} = "K�benhavn K"; $address{'1363'} = "Vendersgade"; $type{'1363'} = "ST";
$location{'1364'} = "K�benhavn K"; $address{'1364'} = "N�rre Farimagsgade"; $type{'1364'} = "ST";
$location{'1365'} = "K�benhavn K"; $address{'1365'} = "Schacksgade"; $type{'1365'} = "ST";
$location{'1366'} = "K�benhavn K"; $address{'1366'} = "Nansensgade"; $type{'1366'} = "ST";
$location{'1367'} = "K�benhavn K"; $address{'1367'} = "Kjeld Langes Gade"; $type{'1367'} = "ST";
$location{'1368'} = "K�benhavn K"; $address{'1368'} = "Turesensgade"; $type{'1368'} = "ST";
$location{'1369'} = "K�benhavn K"; $address{'1369'} = "Gyldenl�vesgade Lige nr"; $type{'1369'} = "ST";
$location{'1370'} = "K�benhavn K"; $address{'1370'} = "N�rre S�gade"; $type{'1370'} = "ST";
$location{'1371'} = "K�benhavn K"; $address{'1371'} = "S�torvet"; $type{'1371'} = "ST";
$location{'1390'} = "K�benhavn K"; $owner{'1390'} = "BG-Bank"; $type{'1390'} = "IO";
$location{'1400'} = "K�benhavn K"; $address{'1400'} = "Knippelsbro"; $type{'1400'} = "ST";
$location{'1400'} = "K�benhavn K"; $address{'1400'} = "Knippelsbro"; $type{'1400'} = "ST";
$location{'1401'} = "K�benhavn K"; $address{'1401'} = "Strandgade"; $type{'1401'} = "ST";
$location{'1402'} = "K�benhavn K"; $address{'1402'} = "Hammersh�i Kaj"; $type{'1402'} = "ST";
$location{'1402'} = "K�benhavn K"; $address{'1402'} = "Hammersh�i Kaj"; $type{'1402'} = "ST";
$location{'1402'} = "K�benhavn K"; $address{'1402'} = "Hammersh�i Kaj"; $type{'1402'} = "ST";
$location{'1402'} = "K�benhavn K"; $address{'1402'} = "Hammersh�i Kaj"; $type{'1402'} = "ST";
$location{'1402'} = "K�benhavn K"; $address{'1402'} = "Hammersh�i Kaj"; $type{'1402'} = "ST";
$location{'1403'} = "K�benhavn K"; $address{'1403'} = "Wilders Plads"; $type{'1403'} = "ST";
$location{'1404'} = "K�benhavn K"; $address{'1404'} = "Kr�yers Plads"; $type{'1404'} = "ST";
$location{'1405'} = "K�benhavn K"; $address{'1405'} = "Gr�nlandske Handels Plads"; $type{'1405'} = "ST";
$location{'1406'} = "K�benhavn K"; $address{'1406'} = "Christianshavns Kanal"; $type{'1406'} = "ST";
$location{'1407'} = "K�benhavn K"; $address{'1407'} = "B�dsmandsstr�de"; $type{'1407'} = "ST";
$location{'1408'} = "K�benhavn K"; $address{'1408'} = "Wildersgade"; $type{'1408'} = "ST";
$location{'1409'} = "K�benhavn K"; $address{'1409'} = "Knippelsbrogade"; $type{'1409'} = "ST";
$location{'1410'} = "K�benhavn K"; $address{'1410'} = "Christianshavns Torv"; $type{'1410'} = "ST";
$location{'1411'} = "K�benhavn K"; $address{'1411'} = "Applebys Plads"; $type{'1411'} = "ST";
$location{'1411'} = "K�benhavn K"; $address{'1411'} = "Applebys Plads"; $type{'1411'} = "ST";
$location{'1412'} = "K�benhavn K"; $address{'1412'} = "Voldg�rden"; $type{'1412'} = "ST";
$location{'1413'} = "K�benhavn K"; $address{'1413'} = "Ved Kanalen"; $type{'1413'} = "ST";
$location{'1414'} = "K�benhavn K"; $address{'1414'} = "Overgaden neden Vandet"; $type{'1414'} = "ST";
$location{'1415'} = "K�benhavn K"; $address{'1415'} = "Overgaden oven Vandet"; $type{'1415'} = "ST";
$location{'1416'} = "K�benhavn K"; $address{'1416'} = "Sankt Ann� Gade"; $type{'1416'} = "ST";
$location{'1417'} = "K�benhavn K"; $address{'1417'} = "Mikkel Vibes Gade"; $type{'1417'} = "ST";
$location{'1418'} = "K�benhavn K"; $address{'1418'} = "Sofiegade"; $type{'1418'} = "ST";
$location{'1419'} = "K�benhavn K"; $address{'1419'} = "Store S�ndervoldstr�de"; $type{'1419'} = "ST";
$location{'1420'} = "K�benhavn K"; $address{'1420'} = "Dronningensgade"; $type{'1420'} = "ST";
$location{'1421'} = "K�benhavn K"; $address{'1421'} = "Lille S�ndervoldstr�de"; $type{'1421'} = "ST";
$location{'1422'} = "K�benhavn K"; $address{'1422'} = "Prinsessegade"; $type{'1422'} = "ST";
$location{'1423'} = "K�benhavn K"; $address{'1423'} = "Amagergade"; $type{'1423'} = "ST";
$location{'1424'} = "K�benhavn K"; $address{'1424'} = "Christianshavns Voldgade"; $type{'1424'} = "ST";
$location{'1425'} = "K�benhavn K"; $address{'1425'} = "Ved Volden"; $type{'1425'} = "ST";
$location{'1426'} = "K�benhavn K"; $address{'1426'} = "Voldboligerne"; $type{'1426'} = "ST";
$location{'1427'} = "K�benhavn K"; $address{'1427'} = "Brobergsgade"; $type{'1427'} = "ST";
$location{'1428'} = "K�benhavn K"; $address{'1428'} = "Andreas Bj�rns Gade"; $type{'1428'} = "ST";
$location{'1429'} = "K�benhavn K"; $address{'1429'} = "Burmeistersgade"; $type{'1429'} = "ST";
$location{'1430'} = "K�benhavn K"; $address{'1430'} = "Bodenhoffs Plads"; $type{'1430'} = "ST";
$location{'1431'} = "K�benhavn K"; $address{'1431'} = "Islands Plads"; $type{'1431'} = "ST";
$location{'1432'} = "K�benhavn K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "ST";
$location{'1432'} = "K�benhavn K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "ST";
$location{'1432'} = "K�benhavn K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1433'} = "K�benhavn K"; $address{'1433'} = "Christiansholms �"; $type{'1433'} = "ST";
$location{'1434'} = "K�benhavn K"; $address{'1434'} = "Danneskiold-Sams�es All�"; $type{'1434'} = "ST";
$location{'1435'} = "K�benhavn K"; $address{'1435'} = "Philip de Langes All�"; $type{'1435'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1436'} = "K�benhavn K"; $address{'1436'} = "Kugleg�rden"; $type{'1436'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1437'} = "K�benhavn K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1438'} = "K�benhavn K"; $address{'1438'} = "Judich�rs Kvarter"; $type{'1438'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1439'} = "K�benhavn K"; $address{'1439'} = "H.C. Sneedorffs All�"; $type{'1439'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1440'} = "K�benhavn K"; $address{'1440'} = "M�lkevejen"; $type{'1440'} = "ST";
$location{'1441'} = "K�benhavn K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "ST";
$location{'1441'} = "K�benhavn K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "ST";
$location{'1441'} = "K�benhavn K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "ST";
$location{'1448'} = "K�benhavn K"; $owner{'1448'} = "Udenrigsministeriet"; $type{'1448'} = "IO";
$location{'1450'} = "K�benhavn K"; $address{'1450'} = "Nytorv"; $type{'1450'} = "ST";
$location{'1451'} = "K�benhavn K"; $address{'1451'} = "Larslejsstr�de"; $type{'1451'} = "ST";
$location{'1452'} = "K�benhavn K"; $address{'1452'} = "Teglg�rdstr�de"; $type{'1452'} = "ST";
$location{'1453'} = "K�benhavn K"; $address{'1453'} = "Sankt Peders Str�de"; $type{'1453'} = "ST";
$location{'1454'} = "K�benhavn K"; $address{'1454'} = "Larsbj�rnsstr�de"; $type{'1454'} = "ST";
$location{'1455'} = "K�benhavn K"; $address{'1455'} = "Studiestr�de 1-49 + 2-42"; $type{'1455'} = "ST";
$location{'1456'} = "K�benhavn K"; $address{'1456'} = "Vestergade"; $type{'1456'} = "ST";
$location{'1457'} = "K�benhavn K"; $address{'1457'} = "Gammeltorv"; $type{'1457'} = "ST";
$location{'1458'} = "K�benhavn K"; $address{'1458'} = "Kattesundet"; $type{'1458'} = "ST";
$location{'1459'} = "K�benhavn K"; $address{'1459'} = "Frederiksberggade"; $type{'1459'} = "ST";
$location{'1460'} = "K�benhavn K"; $address{'1460'} = "Mikkel Bryggers Gade"; $type{'1460'} = "ST";
$location{'1461'} = "K�benhavn K"; $address{'1461'} = "Slutterigade"; $type{'1461'} = "ST";
$location{'1462'} = "K�benhavn K"; $address{'1462'} = "Lavendelstr�de"; $type{'1462'} = "ST";
$location{'1463'} = "K�benhavn K"; $address{'1463'} = "Farvergade"; $type{'1463'} = "ST";
$location{'1464'} = "K�benhavn K"; $address{'1464'} = "Hestem�llestr�de"; $type{'1464'} = "ST";
$location{'1465'} = "K�benhavn K"; $address{'1465'} = "G�segade"; $type{'1465'} = "ST";
$location{'1466'} = "K�benhavn K"; $address{'1466'} = "R�dhusstr�de"; $type{'1466'} = "ST";
$location{'1467'} = "K�benhavn K"; $address{'1467'} = "Vandkunsten"; $type{'1467'} = "ST";
$location{'1468'} = "K�benhavn K"; $address{'1468'} = "L�ngangstr�de"; $type{'1468'} = "ST";
$location{'1470'} = "K�benhavn K"; $address{'1470'} = "Stormgade 2-16"; $type{'1470'} = "ST";
$location{'1471'} = "K�benhavn K"; $address{'1471'} = "Ny Vestergade"; $type{'1471'} = "ST";
$location{'1472'} = "K�benhavn K"; $address{'1472'} = "Ny Kongensgade,  til 17 + til 16"; $type{'1472'} = "ST";
$location{'1473'} = "K�benhavn K"; $address{'1473'} = "Bryghusgade"; $type{'1473'} = "ST";
$location{'1500'} = "K�benhavn V"; $owner{'1500'} = "Vesterbro Postkontor"; $type{'1500'} = "IO";
$location{'1501'} = "K�benhavn V"; $type{'1501'} = "BX";
$location{'1502'} = "K�benhavn V"; $type{'1502'} = "BX";
$location{'1503'} = "K�benhavn V"; $type{'1503'} = "BX";
$location{'1504'} = "K�benhavn V"; $type{'1504'} = "BX";
$location{'1505'} = "K�benhavn V"; $type{'1505'} = "BX";
$location{'1506'} = "K�benhavn V"; $type{'1506'} = "BX";
$location{'1507'} = "K�benhavn V"; $type{'1507'} = "BX";
$location{'1508'} = "K�benhavn V"; $type{'1508'} = "BX";
$location{'1509'} = "K�benhavn V"; $type{'1509'} = "BX";
$location{'1510'} = "K�benhavn V"; $type{'1510'} = "BX";
$location{'1532'} = "K�benhavn V"; $owner{'1532'} = "Internationalt Postcenter, returforsendelser + consignment"; $type{'1532'} = "IO";
$location{'1533'} = "K�benhavn V"; $owner{'1533'} = "Internationalt Postcenter"; $type{'1533'} = "IO";
$location{'1550'} = "K�benhavn V"; $address{'1550'} = "Bag R�dhuset"; $type{'1550'} = "ST";
$location{'1550'} = "K�benhavn V"; $address{'1550'} = "Bag R�dhuset"; $type{'1550'} = "ST";
$location{'1551'} = "K�benhavn V"; $address{'1551'} = "Jarmers Plads"; $type{'1551'} = "ST";
$location{'1552'} = "K�benhavn V"; $address{'1552'} = "Vester Voldgade"; $type{'1552'} = "ST";
$location{'1553'} = "K�benhavn V"; $address{'1553'} = "Langebro"; $type{'1553'} = "ST";
$location{'1553'} = "K�benhavn V"; $address{'1553'} = "Langebro"; $type{'1553'} = "ST";
$location{'1554'} = "K�benhavn V"; $address{'1554'} = "Studiestr�de 51-69 + 46-54"; $type{'1554'} = "ST";
$location{'1555'} = "K�benhavn V"; $address{'1555'} = "Stormgade Ulige nr + 18-20"; $type{'1555'} = "ST";
$location{'1556'} = "K�benhavn V"; $address{'1556'} = "Dantes Plads"; $type{'1556'} = "ST";
$location{'1557'} = "K�benhavn V"; $address{'1557'} = "Ny Kongensgade, fra 18 + fra 19"; $type{'1557'} = "ST";
$location{'1558'} = "K�benhavn V"; $address{'1558'} = "Christiansborggade"; $type{'1558'} = "ST";
$location{'1559'} = "K�benhavn V"; $address{'1559'} = "Christians Brygge 24 - 30"; $type{'1559'} = "ST";
$location{'1560'} = "K�benhavn V"; $address{'1560'} = "Kalvebod Brygge"; $type{'1560'} = "ST";
$location{'1561'} = "K�benhavn V"; $address{'1561'} = "Fisketorvet"; $type{'1561'} = "ST";
$location{'1561'} = "K�benhavn V"; $address{'1561'} = "Fisketorvet"; $type{'1561'} = "ST";
$location{'1562'} = "K�benhavn V"; $address{'1562'} = "Hambrosgade"; $type{'1562'} = "ST";
$location{'1563'} = "K�benhavn V"; $address{'1563'} = "Otto M�nsteds Plads"; $type{'1563'} = "ST";
$location{'1564'} = "K�benhavn V"; $address{'1564'} = "Rysensteensgade"; $type{'1564'} = "ST";
$location{'1566'} = "K�benhavn V"; $owner{'1566'} = "Post Danmark A/S"; $type{'1566'} = "IO";
$location{'1567'} = "K�benhavn V"; $address{'1567'} = "Polititorvet"; $type{'1567'} = "ST";
$location{'1568'} = "K�benhavn V"; $address{'1568'} = "Mitchellsgade"; $type{'1568'} = "ST";
$location{'1569'} = "K�benhavn V"; $address{'1569'} = "Edvard Falcks Gade"; $type{'1569'} = "ST";
$location{'1570'} = "K�benhavn V"; $address{'1570'} = "K�benhavns Hovedbaneg�rd"; $type{'1570'} = "ST";
$location{'1570'} = "K�benhavn V"; $address{'1570'} = "K�benhavns Hovedbaneg�rd"; $type{'1570'} = "ST";
$location{'1571'} = "K�benhavn V"; $address{'1571'} = "Otto M�nsteds Gade"; $type{'1571'} = "ST";
$location{'1572'} = "K�benhavn V"; $address{'1572'} = "Anker Heegaards Gade"; $type{'1572'} = "ST";
$location{'1573'} = "K�benhavn V"; $address{'1573'} = "Puggaardsgade"; $type{'1573'} = "ST";
$location{'1574'} = "K�benhavn V"; $address{'1574'} = "Niels Brocks Gade"; $type{'1574'} = "ST";
$location{'1575'} = "K�benhavn V"; $address{'1575'} = "Ved Glyptoteket"; $type{'1575'} = "ST";
$location{'1576'} = "K�benhavn V"; $address{'1576'} = "Stoltenbergsgade"; $type{'1576'} = "ST";
$location{'1577'} = "K�benhavn V"; $address{'1577'} = "Bernstorffsgade"; $type{'1577'} = "ST";
$location{'1590'} = "K�benhavn V"; $owner{'1590'} = "Realkredit Danmark"; $type{'1590'} = "IO";
$location{'1592'} = "K�benhavn V"; $owner{'1592'} = "K�benhavns Socialdirektorat"; $type{'1592'} = "IO";
$location{'1599'} = "K�benhavn V"; $owner{'1599'} = "K�benhavns R�dhus"; $type{'1599'} = "IO";
$location{'1600'} = "K�benhavn V"; $address{'1600'} = "Gyldenl�vesgade Ulige nr."; $type{'1600'} = "ST";
$location{'1601'} = "K�benhavn V"; $address{'1601'} = "Vester S�gade"; $type{'1601'} = "ST";
$location{'1602'} = "K�benhavn V"; $address{'1602'} = "Nyropsgade"; $type{'1602'} = "ST";
$location{'1603'} = "K�benhavn V"; $address{'1603'} = "Dahlerupsgade"; $type{'1603'} = "ST";
$location{'1604'} = "K�benhavn V"; $address{'1604'} = "Kampmannsgade"; $type{'1604'} = "ST";
$location{'1605'} = "K�benhavn V"; $address{'1605'} = "Herholdtsgade"; $type{'1605'} = "ST";
$location{'1606'} = "K�benhavn V"; $address{'1606'} = "Vester Farimagsgade"; $type{'1606'} = "ST";
$location{'1607'} = "K�benhavn V"; $address{'1607'} = "Staunings Plads"; $type{'1607'} = "ST";
$location{'1608'} = "K�benhavn V"; $address{'1608'} = "Jernbanegade"; $type{'1608'} = "ST";
$location{'1609'} = "K�benhavn V"; $address{'1609'} = "Axeltorv"; $type{'1609'} = "ST";
$location{'1610'} = "K�benhavn V"; $address{'1610'} = "Gammel Kongevej 1-51 + 2-10"; $type{'1610'} = "ST";
$location{'1611'} = "K�benhavn V"; $address{'1611'} = "Hammerichsgade"; $type{'1611'} = "ST";
$location{'1612'} = "K�benhavn V"; $address{'1612'} = "Ved Vesterport"; $type{'1612'} = "ST";
$location{'1613'} = "K�benhavn V"; $address{'1613'} = "Meldahlsgade"; $type{'1613'} = "ST";
$location{'1614'} = "K�benhavn V"; $address{'1614'} = "Trommesalen"; $type{'1614'} = "ST";
$location{'1615'} = "K�benhavn V"; $address{'1615'} = "Sankt J�rgens All�"; $type{'1615'} = "ST";
$location{'1616'} = "K�benhavn V"; $address{'1616'} = "Stenosgade"; $type{'1616'} = "ST";
$location{'1617'} = "K�benhavn V"; $address{'1617'} = "Bagerstr�de"; $type{'1617'} = "ST";
$location{'1618'} = "K�benhavn V"; $address{'1618'} = "Tullinsgade"; $type{'1618'} = "ST";
$location{'1619'} = "K�benhavn V"; $address{'1619'} = "V�rnedamsvej Lige nr."; $type{'1619'} = "ST";
$location{'1620'} = "K�benhavn V"; $address{'1620'} = "Vesterbros Torv"; $type{'1620'} = "ST";
$location{'1620'} = "K�benhavn V"; $address{'1620'} = "Vesterbros Torv"; $type{'1620'} = "ST";
$location{'1621'} = "K�benhavn V"; $address{'1621'} = "Frederiksberg All� 1 - 13B"; $type{'1621'} = "ST";
$location{'1622'} = "K�benhavn V"; $address{'1622'} = "Boyesgade Ulige nr"; $type{'1622'} = "ST";
$location{'1623'} = "K�benhavn V"; $address{'1623'} = "Kingosgade 1-9 + 2-6"; $type{'1623'} = "ST";
$location{'1624'} = "K�benhavn V"; $address{'1624'} = "Brorsonsgade"; $type{'1624'} = "ST";
$location{'1630'} = "K�benhavn V"; $owner{'1630'} = "Tivoli A/S"; $type{'1630'} = "IO";
$location{'1631'} = "K�benhavn V"; $address{'1631'} = "Herman Triers Plads"; $type{'1631'} = "ST";
$location{'1632'} = "K�benhavn V"; $address{'1632'} = "Julius Thomsens Gade Lige nr"; $type{'1632'} = "ST";
$location{'1633'} = "K�benhavn V"; $address{'1633'} = "Kleinsgade"; $type{'1633'} = "ST";
$location{'1634'} = "K�benhavn V"; $address{'1634'} = "Rosen�rns All� 2-18"; $type{'1634'} = "ST";
$location{'1635'} = "K�benhavn V"; $address{'1635'} = "�boulevard 1-13"; $type{'1635'} = "ST";
$location{'1639'} = "K�benhavn V"; $owner{'1639'} = "K�benhavns Skatteforvaltning"; $type{'1639'} = "IO";
$location{'1640'} = "K�benhavn V"; $owner{'1640'} = "K�benhavns Folkeregister"; $type{'1640'} = "IO";
$location{'1650'} = "K�benhavn V"; $address{'1650'} = "Istedgade"; $type{'1650'} = "ST";
$location{'1651'} = "K�benhavn V"; $address{'1651'} = "Reventlowsgade"; $type{'1651'} = "ST";
$location{'1652'} = "K�benhavn V"; $address{'1652'} = "Colbj�rnsensgade"; $type{'1652'} = "ST";
$location{'1653'} = "K�benhavn V"; $address{'1653'} = "Helgolandsgade"; $type{'1653'} = "ST";
$location{'1654'} = "K�benhavn V"; $address{'1654'} = "Abel Cathrines Gade"; $type{'1654'} = "ST";
$location{'1655'} = "K�benhavn V"; $address{'1655'} = "Viktoriagade"; $type{'1655'} = "ST";
$location{'1656'} = "K�benhavn V"; $address{'1656'} = "Gasv�rksvej"; $type{'1656'} = "ST";
$location{'1657'} = "K�benhavn V"; $address{'1657'} = "Eskildsgade"; $type{'1657'} = "ST";
$location{'1658'} = "K�benhavn V"; $address{'1658'} = "Absalonsgade"; $type{'1658'} = "ST";
$location{'1659'} = "K�benhavn V"; $address{'1659'} = "Svendsgade"; $type{'1659'} = "ST";
$location{'1660'} = "K�benhavn V"; $address{'1660'} = "Otto Krabbes Plads"; $type{'1660'} = "ST";
$location{'1660'} = "K�benhavn V"; $address{'1660'} = "Otto Krabbes Plads"; $type{'1660'} = "ST";
$location{'1661'} = "K�benhavn V"; $address{'1661'} = "Westend"; $type{'1661'} = "ST";
$location{'1662'} = "K�benhavn V"; $address{'1662'} = "Saxogade"; $type{'1662'} = "ST";
$location{'1663'} = "K�benhavn V"; $address{'1663'} = "Oehlenschl�gersgade"; $type{'1663'} = "ST";
$location{'1664'} = "K�benhavn V"; $address{'1664'} = "Kaalundsgade"; $type{'1664'} = "ST";
$location{'1665'} = "K�benhavn V"; $address{'1665'} = "Valdemarsgade"; $type{'1665'} = "ST";
$location{'1666'} = "K�benhavn V"; $address{'1666'} = "Matth�usgade"; $type{'1666'} = "ST";
$location{'1667'} = "K�benhavn V"; $address{'1667'} = "Frederiksstadsgade"; $type{'1667'} = "ST";
$location{'1668'} = "K�benhavn V"; $address{'1668'} = "Mysundegade"; $type{'1668'} = "ST";
$location{'1669'} = "K�benhavn V"; $address{'1669'} = "Flensborggade"; $type{'1669'} = "ST";
$location{'1670'} = "K�benhavn V"; $address{'1670'} = "Enghave Plads"; $type{'1670'} = "ST";
$location{'1671'} = "K�benhavn V"; $address{'1671'} = "Haderslevgade"; $type{'1671'} = "ST";
$location{'1671'} = "K�benhavn V"; $address{'1671'} = "Haderslevgade"; $type{'1671'} = "ST";
$location{'1672'} = "K�benhavn V"; $address{'1672'} = "Broagergade"; $type{'1672'} = "ST";
$location{'1673'} = "K�benhavn V"; $address{'1673'} = "Ullerupgade"; $type{'1673'} = "ST";
$location{'1674'} = "K�benhavn V"; $address{'1674'} = "Enghavevej, til 79 + til 78"; $type{'1674'} = "ST";
$location{'1675'} = "K�benhavn V"; $address{'1675'} = "Kongsh�jgade"; $type{'1675'} = "ST";
$location{'1676'} = "K�benhavn V"; $address{'1676'} = "Sankelmarksgade"; $type{'1676'} = "ST";
$location{'1677'} = "K�benhavn V"; $address{'1677'} = "Gr�stensgade"; $type{'1677'} = "ST";
$location{'1699'} = "K�benhavn V"; $address{'1699'} = "Staldgade"; $type{'1699'} = "ST";
$location{'1700'} = "K�benhavn V"; $address{'1700'} = "Halmtorvet"; $type{'1700'} = "ST";
$location{'1701'} = "K�benhavn V"; $address{'1701'} = "Reverdilsgade"; $type{'1701'} = "ST";
$location{'1702'} = "K�benhavn V"; $address{'1702'} = "Stampesgade"; $type{'1702'} = "ST";
$location{'1703'} = "K�benhavn V"; $address{'1703'} = "Lille Colbj�rnsensgade"; $type{'1703'} = "ST";
$location{'1704'} = "K�benhavn V"; $address{'1704'} = "Tietgensgade"; $type{'1704'} = "ST";
$location{'1705'} = "K�benhavn V"; $address{'1705'} = "Ingerslevsgade"; $type{'1705'} = "ST";
$location{'1706'} = "K�benhavn V"; $address{'1706'} = "Lille Istedgade"; $type{'1706'} = "ST";
$location{'1707'} = "K�benhavn V"; $address{'1707'} = "Maria Kirkeplads"; $type{'1707'} = "ST";
$location{'1708'} = "K�benhavn V"; $address{'1708'} = "Eriksgade"; $type{'1708'} = "ST";
$location{'1709'} = "K�benhavn V"; $address{'1709'} = "Skydebanegade"; $type{'1709'} = "ST";
$location{'1710'} = "K�benhavn V"; $address{'1710'} = "Kv�gtorvsgade"; $type{'1710'} = "ST";
$location{'1711'} = "K�benhavn V"; $address{'1711'} = "Fl�sketorvet"; $type{'1711'} = "ST";
$location{'1712'} = "K�benhavn V"; $address{'1712'} = "H�kerboderne"; $type{'1712'} = "ST";
$location{'1713'} = "K�benhavn V"; $address{'1713'} = "Kv�gtorvet"; $type{'1713'} = "ST";
$location{'1714'} = "K�benhavn V"; $address{'1714'} = "K�dboderne"; $type{'1714'} = "ST";
$location{'1715'} = "K�benhavn V"; $address{'1715'} = "Slagtehusgade"; $type{'1715'} = "ST";
$location{'1716'} = "K�benhavn V"; $address{'1716'} = "Slagterboderne"; $type{'1716'} = "ST";
$location{'1717'} = "K�benhavn V"; $address{'1717'} = "Skelb�kgade"; $type{'1717'} = "ST";
$location{'1718'} = "K�benhavn V"; $address{'1718'} = "Sommerstedgade"; $type{'1718'} = "ST";
$location{'1719'} = "K�benhavn V"; $address{'1719'} = "Krus�gade"; $type{'1719'} = "ST";
$location{'1720'} = "K�benhavn V"; $address{'1720'} = "S�nder Boulevard"; $type{'1720'} = "ST";
$location{'1721'} = "K�benhavn V"; $address{'1721'} = "Dybb�lsgade"; $type{'1721'} = "ST";
$location{'1722'} = "K�benhavn V"; $address{'1722'} = "Godsbanegade"; $type{'1722'} = "ST";
$location{'1723'} = "K�benhavn V"; $address{'1723'} = "Letlandsgade"; $type{'1723'} = "ST";
$location{'1724'} = "K�benhavn V"; $address{'1724'} = "Estlandsgade"; $type{'1724'} = "ST";
$location{'1725'} = "K�benhavn V"; $address{'1725'} = "Esbern Snares Gade"; $type{'1725'} = "ST";
$location{'1726'} = "K�benhavn V"; $address{'1726'} = "Arkonagade"; $type{'1726'} = "ST";
$location{'1727'} = "K�benhavn V"; $address{'1727'} = "Asger Rygs Gade"; $type{'1727'} = "ST";
$location{'1728'} = "K�benhavn V"; $address{'1728'} = "Skjalm Hvides Gade"; $type{'1728'} = "ST";
$location{'1729'} = "K�benhavn V"; $address{'1729'} = "Sigerstedgade"; $type{'1729'} = "ST";
$location{'1730'} = "K�benhavn V"; $address{'1730'} = "Knud Lavards Gade"; $type{'1730'} = "ST";
$location{'1731'} = "K�benhavn V"; $address{'1731'} = "Erik Ejegods Gade"; $type{'1731'} = "ST";
$location{'1732'} = "K�benhavn V"; $address{'1732'} = "Bodilsgade"; $type{'1732'} = "ST";
$location{'1733'} = "K�benhavn V"; $address{'1733'} = "Palnatokesgade"; $type{'1733'} = "ST";
$location{'1734'} = "K�benhavn V"; $address{'1734'} = "Heilsgade"; $type{'1734'} = "ST";
$location{'1735'} = "K�benhavn V"; $address{'1735'} = "R�ddinggade"; $type{'1735'} = "ST";
$location{'1736'} = "K�benhavn V"; $address{'1736'} = "Bevtoftgade"; $type{'1736'} = "ST";
$location{'1737'} = "K�benhavn V"; $address{'1737'} = "Bustrupgade"; $type{'1737'} = "ST";
$location{'1738'} = "K�benhavn V"; $address{'1738'} = "Stenderupgade"; $type{'1738'} = "ST";
$location{'1739'} = "K�benhavn V"; $address{'1739'} = "Enghave Passage"; $type{'1739'} = "ST";
$location{'1748'} = "K�benhavn V"; $address{'1748'} = "Kammasvej 2"; $type{'1748'} = "ST";
$location{'1749'} = "K�benhavn V"; $address{'1749'} = "Rahbeks All� 3-15"; $type{'1749'} = "ST";
$location{'1750'} = "K�benhavn V"; $address{'1750'} = "Vesterf�lledvej"; $type{'1750'} = "ST";
$location{'1751'} = "K�benhavn V"; $address{'1751'} = "Sundevedsgade"; $type{'1751'} = "ST";
$location{'1752'} = "K�benhavn V"; $address{'1752'} = "T�ndergade"; $type{'1752'} = "ST";
$location{'1753'} = "K�benhavn V"; $address{'1753'} = "Ballumgade"; $type{'1753'} = "ST";
$location{'1754'} = "K�benhavn V"; $address{'1754'} = "Hedebygade"; $type{'1754'} = "ST";
$location{'1755'} = "K�benhavn V"; $address{'1755'} = "M�gelt�ndergade"; $type{'1755'} = "ST";
$location{'1756'} = "K�benhavn V"; $address{'1756'} = "Amerikavej"; $type{'1756'} = "ST";
$location{'1757'} = "K�benhavn V"; $address{'1757'} = "Tr�jborggade"; $type{'1757'} = "ST";
$location{'1758'} = "K�benhavn V"; $address{'1758'} = "Lyrskovgade"; $type{'1758'} = "ST";
$location{'1759'} = "K�benhavn V"; $address{'1759'} = "Rejsbygade"; $type{'1759'} = "ST";
$location{'1760'} = "K�benhavn V"; $address{'1760'} = "Ny Carlsberg Vej"; $type{'1760'} = "ST";
$location{'1761'} = "K�benhavn V"; $address{'1761'} = "Ejderstedgade"; $type{'1761'} = "ST";
$location{'1762'} = "K�benhavn V"; $address{'1762'} = "Slesvigsgade"; $type{'1762'} = "ST";
$location{'1763'} = "K�benhavn V"; $address{'1763'} = "Dannevirkegade"; $type{'1763'} = "ST";
$location{'1764'} = "K�benhavn V"; $address{'1764'} = "Alsgade"; $type{'1764'} = "ST";
$location{'1765'} = "K�benhavn V"; $address{'1765'} = "Angelgade"; $type{'1765'} = "ST";
$location{'1766'} = "K�benhavn V"; $address{'1766'} = "Slien"; $type{'1766'} = "ST";
$location{'1770'} = "K�benhavn V"; $address{'1770'} = "Carstensgade"; $type{'1770'} = "ST";
$location{'1771'} = "K�benhavn V"; $address{'1771'} = "Lundbyesgade"; $type{'1771'} = "ST";
$location{'1772'} = "K�benhavn V"; $address{'1772'} = "Ernst Meyers Gade"; $type{'1772'} = "ST";
$location{'1773'} = "K�benhavn V"; $address{'1773'} = "Bissensgade"; $type{'1773'} = "ST";
$location{'1774'} = "K�benhavn V"; $address{'1774'} = "K�chlersgade"; $type{'1774'} = "ST";
$location{'1775'} = "K�benhavn V"; $address{'1775'} = "Freundsgade"; $type{'1775'} = "ST";
$location{'1777'} = "K�benhavn V"; $address{'1777'} = "Jerichausgade"; $type{'1777'} = "ST";
$location{'1778'} = "K�benhavn V"; $address{'1778'} = "Pasteursvej"; $type{'1778'} = "ST";
$location{'1780'} = "K�benhavn V"; $owner{'1780'} = "Erhvervskunder";
$location{'1782'} = "K�benhavn V"; $type{'1782'} = "PP";
$location{'1784'} = "K�benhavn V"; $owner{'1784'} = "Forlagsgruppen (ufrankerede svarforsendelser)"; $type{'1784'} = "IO";
$location{'1785'} = "K�benhavn V"; $owner{'1785'} = "Politiken og Ekstrabladet"; $type{'1785'} = "IO";
$location{'1786'} = "K�benhavn V"; $owner{'1786'} = "Unibank"; $type{'1786'} = "IO";
$location{'1787'} = "K�benhavn V"; $owner{'1787'} = "Dansk Industri"; $type{'1787'} = "IO";
$location{'1788'} = "K�benhavn V"; $owner{'1788'} = "Erhvervskunder";
$location{'1789'} = "K�benhavn V"; $owner{'1789'} = "Star Tour A/S"; $type{'1789'} = "IO";
$location{'1790'} = "K�benhavn V"; $owner{'1790'} = "Erhvervskunder";
$location{'1795'} = "K�benhavn V"; $owner{'1795'} = "Bogklubforlag"; $type{'1795'} = "IO";
$location{'1799'} = "K�benhavn V"; $owner{'1799'} = "Carlsberg"; $type{'1799'} = "IO";
$location{'1800'} = "Frederiksberg C"; $address{'1800'} = "Vesterbrogade, fra 152 og 153"; $type{'1800'} = "ST";
$location{'1801'} = "Frederiksberg C"; $address{'1801'} = "Rahbeks All� 2-36 + 17-23"; $type{'1801'} = "ST";
$location{'1802'} = "Frederiksberg C"; $address{'1802'} = "Halls All�"; $type{'1802'} = "ST";
$location{'1803'} = "Frederiksberg C"; $address{'1803'} = "Br�ndsteds All�"; $type{'1803'} = "ST";
$location{'1804'} = "Frederiksberg C"; $address{'1804'} = "Bakkeg�rds All�"; $type{'1804'} = "ST";
$location{'1805'} = "Frederiksberg C"; $address{'1805'} = "Kammasvej 1-3 + 4"; $type{'1805'} = "ST";
$location{'1806'} = "Frederiksberg C"; $address{'1806'} = "Jacobys All�"; $type{'1806'} = "ST";
$location{'1807'} = "Frederiksberg C"; $address{'1807'} = "Schlegels All�"; $type{'1807'} = "ST";
$location{'1808'} = "Frederiksberg C"; $address{'1808'} = "Asmussens All�"; $type{'1808'} = "ST";
$location{'1809'} = "Frederiksberg C"; $address{'1809'} = "Frydendalsvej"; $type{'1809'} = "ST";
$location{'1810'} = "Frederiksberg C"; $address{'1810'} = "Platanvej"; $type{'1810'} = "ST";
$location{'1811'} = "Frederiksberg C"; $address{'1811'} = "Asg�rdsvej"; $type{'1811'} = "ST";
$location{'1812'} = "Frederiksberg C"; $address{'1812'} = "Kochsvej"; $type{'1812'} = "ST";
$location{'1813'} = "Frederiksberg C"; $address{'1813'} = "Henrik Ibsens Vej"; $type{'1813'} = "ST";
$location{'1814'} = "Frederiksberg C"; $address{'1814'} = "Carit Etlars Vej"; $type{'1814'} = "ST";
$location{'1815'} = "Frederiksberg C"; $address{'1815'} = "Paludan M�llers Vej"; $type{'1815'} = "ST";
$location{'1816'} = "Frederiksberg C"; $address{'1816'} = "Engtoftevej"; $type{'1816'} = "ST";
$location{'1817'} = "Frederiksberg C"; $address{'1817'} = "Carl Bernhards Vej"; $type{'1817'} = "ST";
$location{'1818'} = "Frederiksberg C"; $address{'1818'} = "Kingosgade 8-12 + 11-17"; $type{'1818'} = "ST";
$location{'1819'} = "Frederiksberg C"; $address{'1819'} = "V�rnedamsvej Ulige nr."; $type{'1819'} = "ST";
$location{'1820'} = "Frederiksberg C"; $address{'1820'} = "Frederiksberg All� 15-65 + 2-104"; $type{'1820'} = "ST";
$location{'1822'} = "Frederiksberg C"; $address{'1822'} = "Boyesgade Lige nr"; $type{'1822'} = "ST";
$location{'1823'} = "Frederiksberg C"; $address{'1823'} = "Haveselskabetsvej"; $type{'1823'} = "ST";
$location{'1824'} = "Frederiksberg C"; $address{'1824'} = "Sankt Thomas All�"; $type{'1824'} = "ST";
$location{'1825'} = "Frederiksberg C"; $address{'1825'} = "Hauchsvej"; $type{'1825'} = "ST";
$location{'1826'} = "Frederiksberg C"; $address{'1826'} = "Alhambravej"; $type{'1826'} = "ST";
$location{'1827'} = "Frederiksberg C"; $address{'1827'} = "Mynstersvej"; $type{'1827'} = "ST";
$location{'1828'} = "Frederiksberg C"; $address{'1828'} = "Martensens All�"; $type{'1828'} = "ST";
$location{'1829'} = "Frederiksberg C"; $address{'1829'} = "Madvigs All�"; $type{'1829'} = "ST";
$location{'1835'} = "Frederiksberg C"; $owner{'1835'} = "inkl. Frederiksberg C Postkontor"; $type{'1835'} = "BX";
$location{'1850'} = "Frederiksberg C"; $address{'1850'} = "Gammel Kongevej 85-179 + 60-178"; $type{'1850'} = "ST";
$location{'1851'} = "Frederiksberg C"; $address{'1851'} = "Nyvej"; $type{'1851'} = "ST";
$location{'1852'} = "Frederiksberg C"; $address{'1852'} = "Amicisvej"; $type{'1852'} = "ST";
$location{'1853'} = "Frederiksberg C"; $address{'1853'} = "Maglekildevej"; $type{'1853'} = "ST";
$location{'1854'} = "Frederiksberg C"; $address{'1854'} = "Dr. Priemes Vej"; $type{'1854'} = "ST";
$location{'1855'} = "Frederiksberg C"; $address{'1855'} = "Holl�ndervej"; $type{'1855'} = "ST";
$location{'1856'} = "Frederiksberg C"; $address{'1856'} = "Edisonsvej"; $type{'1856'} = "ST";
$location{'1857'} = "Frederiksberg C"; $address{'1857'} = "Hortensiavej"; $type{'1857'} = "ST";
$location{'1860'} = "Frederiksberg C"; $address{'1860'} = "Christian Winthers Vej"; $type{'1860'} = "ST";
$location{'1861'} = "Frederiksberg C"; $address{'1861'} = "Sagasvej"; $type{'1861'} = "ST";
$location{'1862'} = "Frederiksberg C"; $address{'1862'} = "Rathsacksvej"; $type{'1862'} = "ST";
$location{'1863'} = "Frederiksberg C"; $address{'1863'} = "Ceresvej"; $type{'1863'} = "ST";
$location{'1864'} = "Frederiksberg C"; $address{'1864'} = "Grundtvigsvej"; $type{'1864'} = "ST";
$location{'1865'} = "Frederiksberg C"; $address{'1865'} = "Grundtvigs Sidevej"; $type{'1865'} = "ST";
$location{'1866'} = "Frederiksberg C"; $address{'1866'} = "Henrik Steffens Vej"; $type{'1866'} = "ST";
$location{'1867'} = "Frederiksberg C"; $address{'1867'} = "Acaciavej"; $type{'1867'} = "ST";
$location{'1868'} = "Frederiksberg C"; $address{'1868'} = "Bianco Lunos All�"; $type{'1868'} = "ST";
$location{'1870'} = "Frederiksberg C"; $address{'1870'} = "B�lowsvej"; $type{'1870'} = "ST";
$location{'1871'} = "Frederiksberg C"; $address{'1871'} = "Thorvaldsensvej"; $type{'1871'} = "ST";
$location{'1872'} = "Frederiksberg C"; $address{'1872'} = "Bomhoffs Have"; $type{'1872'} = "ST";
$location{'1873'} = "Frederiksberg C"; $address{'1873'} = "Helenevej"; $type{'1873'} = "ST";
$location{'1874'} = "Frederiksberg C"; $address{'1874'} = "Harsdorffsvej"; $type{'1874'} = "ST";
$location{'1875'} = "Frederiksberg C"; $address{'1875'} = "Amalievej"; $type{'1875'} = "ST";
$location{'1876'} = "Frederiksberg C"; $address{'1876'} = "Kastanievej"; $type{'1876'} = "ST";
$location{'1877'} = "Frederiksberg C"; $address{'1877'} = "Lindevej"; $type{'1877'} = "ST";
$location{'1878'} = "Frederiksberg C"; $address{'1878'} = "Uraniavej"; $type{'1878'} = "ST";
$location{'1879'} = "Frederiksberg C"; $address{'1879'} = "H.C. �rsteds Vej"; $type{'1879'} = "ST";
$location{'1900'} = "Frederiksberg C"; $address{'1900'} = "Vodroffsvej"; $type{'1900'} = "ST";
$location{'1901'} = "Frederiksberg C"; $address{'1901'} = "T�rnborgvej"; $type{'1901'} = "ST";
$location{'1902'} = "Frederiksberg C"; $address{'1902'} = "Lykkesholms All�"; $type{'1902'} = "ST";
$location{'1903'} = "Frederiksberg C"; $address{'1903'} = "Sankt Knuds Vej"; $type{'1903'} = "ST";
$location{'1904'} = "Frederiksberg C"; $address{'1904'} = "Forh�bningsholms All�"; $type{'1904'} = "ST";
$location{'1905'} = "Frederiksberg C"; $address{'1905'} = "Svanholmsvej"; $type{'1905'} = "ST";
$location{'1906'} = "Frederiksberg C"; $address{'1906'} = "Sch�nbergsgade"; $type{'1906'} = "ST";
$location{'1908'} = "Frederiksberg C"; $address{'1908'} = "Prinsesse Maries All�"; $type{'1908'} = "ST";
$location{'1909'} = "Frederiksberg C"; $address{'1909'} = "Vodroffs Tv�rgade"; $type{'1909'} = "ST";
$location{'1910'} = "Frederiksberg C"; $address{'1910'} = "Danasvej"; $type{'1910'} = "ST";
$location{'1911'} = "Frederiksberg C"; $address{'1911'} = "Niels Ebbesens Vej"; $type{'1911'} = "ST";
$location{'1912'} = "Frederiksberg C"; $address{'1912'} = "Svend Tr�sts Vej"; $type{'1912'} = "ST";
$location{'1913'} = "Frederiksberg C"; $address{'1913'} = "Carl Plougs Vej"; $type{'1913'} = "ST";
$location{'1914'} = "Frederiksberg C"; $address{'1914'} = "Vodroffslund"; $type{'1914'} = "ST";
$location{'1915'} = "Frederiksberg C"; $address{'1915'} = "Danas Plads"; $type{'1915'} = "ST";
$location{'1916'} = "Frederiksberg C"; $address{'1916'} = "Norsvej"; $type{'1916'} = "ST";
$location{'1917'} = "Frederiksberg C"; $address{'1917'} = "Sveasvej"; $type{'1917'} = "ST";
$location{'1920'} = "Frederiksberg C"; $address{'1920'} = "Forchhammersvej"; $type{'1920'} = "ST";
$location{'1921'} = "Frederiksberg C"; $address{'1921'} = "Sankt Markus Plads"; $type{'1921'} = "ST";
$location{'1922'} = "Frederiksberg C"; $address{'1922'} = "Sankt Markus All�"; $type{'1922'} = "ST";
$location{'1923'} = "Frederiksberg C"; $address{'1923'} = "Johnstrups All�"; $type{'1923'} = "ST";
$location{'1924'} = "Frederiksberg C"; $address{'1924'} = "Steenstrups All�"; $type{'1924'} = "ST";
$location{'1925'} = "Frederiksberg C"; $address{'1925'} = "Julius Thomsens Plads"; $type{'1925'} = "ST";
$location{'1926'} = "Frederiksberg C"; $address{'1926'} = "Martinsvej"; $type{'1926'} = "ST";
$location{'1927'} = "Frederiksberg C"; $address{'1927'} = "Suomisvej"; $type{'1927'} = "ST";
$location{'1928'} = "Frederiksberg C"; $address{'1928'} = "Filippavej"; $type{'1928'} = "ST";
$location{'1931'} = "Frederiksberg C"; $type{'1931'} = "PP";
$location{'1950'} = "Frederiksberg C"; $address{'1950'} = "Hostrupsvej"; $type{'1950'} = "ST";
$location{'1951'} = "Frederiksberg C"; $address{'1951'} = "Christian Richardts Vej"; $type{'1951'} = "ST";
$location{'1952'} = "Frederiksberg C"; $address{'1952'} = "Falkonerv�nget"; $type{'1952'} = "ST";
$location{'1953'} = "Frederiksberg C"; $address{'1953'} = "Sankt Nikolaj Vej"; $type{'1953'} = "ST";
$location{'1954'} = "Frederiksberg C"; $address{'1954'} = "Hostrups Have"; $type{'1954'} = "ST";
$location{'1955'} = "Frederiksberg C"; $address{'1955'} = "Dr. Abildgaards All�"; $type{'1955'} = "ST";
$location{'1956'} = "Frederiksberg C"; $address{'1956'} = "L.I. Brandes All�"; $type{'1956'} = "ST";
$location{'1957'} = "Frederiksberg C"; $address{'1957'} = "N.J. Fjords All�"; $type{'1957'} = "ST";
$location{'1958'} = "Frederiksberg C"; $address{'1958'} = "Rolighedsvej"; $type{'1958'} = "ST";
$location{'1959'} = "Frederiksberg C"; $address{'1959'} = "Falkonerg�rdsvej"; $type{'1959'} = "ST";
$location{'1960'} = "Frederiksberg C"; $address{'1960'} = "�boulevard 15-55"; $type{'1960'} = "ST";
$location{'1961'} = "Frederiksberg C"; $address{'1961'} = "J.M. Thieles Vej"; $type{'1961'} = "ST";
$location{'1962'} = "Frederiksberg C"; $address{'1962'} = "Fuglevangsvej"; $type{'1962'} = "ST";
$location{'1963'} = "Frederiksberg C"; $address{'1963'} = "Bille Brahes Vej"; $type{'1963'} = "ST";
$location{'1964'} = "Frederiksberg C"; $address{'1964'} = "Ingemannsvej"; $type{'1964'} = "ST";
$location{'1965'} = "Frederiksberg C"; $address{'1965'} = "Erik Menveds Vej"; $type{'1965'} = "ST";
$location{'1966'} = "Frederiksberg C"; $address{'1966'} = "Steenwinkelsvej"; $type{'1966'} = "ST";
$location{'1967'} = "Frederiksberg C"; $address{'1967'} = "Svanemoseg�rdsvej"; $type{'1967'} = "ST";
$location{'1970'} = "Frederiksberg C"; $address{'1970'} = "Rosen�rns All� 1-65 + 20-70"; $type{'1970'} = "ST";
$location{'1971'} = "Frederiksberg C"; $address{'1971'} = "Adolph Steens All�"; $type{'1971'} = "ST";
$location{'1972'} = "Frederiksberg C"; $address{'1972'} = "Worsaaesvej"; $type{'1972'} = "ST";
$location{'1973'} = "Frederiksberg C"; $address{'1973'} = "Jakob Dannef�rds Vej"; $type{'1973'} = "ST";
$location{'1974'} = "Frederiksberg C"; $address{'1974'} = "Julius Thomsens Gade Ulige nr"; $type{'1974'} = "ST";
$location{'1999'} = "Frederiksberg C"; $owner{'1999'} = "Danmarks Radio"; $type{'1999'} = "IO";
$location{'2000'} = "Frederiksberg";
$location{'2100'} = "K�benhavn �";
$location{'2200'} = "K�benhavn N";
$location{'2300'} = "K�benhavn S";
$location{'2400'} = "K�benhavn NV";
$location{'2450'} = "K�benhavn SV";
$location{'2500'} = "Valby";
$location{'2600'} = "Glostrup";
$location{'2605'} = "Br�ndby";
$location{'2610'} = "R�dovre";
$location{'2620'} = "Albertslund";
$location{'2625'} = "Vallensb�k";
$location{'2630'} = "Taastrup";
$location{'2633'} = "Taastrup"; $owner{'2633'} = "Erhvervskunder";
$location{'2635'} = "Ish�j";
$location{'2640'} = "Hedehusene";
$location{'2650'} = "Hvidovre";
$location{'2660'} = "Br�ndby Strand";
$location{'2665'} = "Vallensb�k Strand";
$location{'2670'} = "Greve";
$location{'2680'} = "Solr�d Strand";
$location{'2690'} = "Karlslunde";
$location{'2700'} = "Br�nsh�j";
$location{'2720'} = "Vanl�se";
$location{'2730'} = "Herlev";
$location{'2740'} = "Skovlunde";
$location{'2750'} = "Ballerup";
$location{'2760'} = "M�l�v";
$location{'2765'} = "Sm�rum";
$location{'2770'} = "Kastrup";
$location{'2791'} = "Drag�r";
$location{'2800'} = "Kongens Lyngby";
$location{'2820'} = "Gentofte";
$location{'2830'} = "Virum";
$location{'2840'} = "Holte";
$location{'2850'} = "N�rum";
$location{'2860'} = "S�borg";
$location{'2870'} = "Dysseg�rd ";
$location{'2880'} = "Bagsv�rd";
$location{'2900'} = "Hellerup";
$location{'2920'} = "Charlottenlund";
$location{'2930'} = "Klampenborg";
$location{'2942'} = "Skodsborg";
$location{'2950'} = "Vedb�k";
$location{'2960'} = "Rungsted Kyst";
$location{'2970'} = "H�rsholm";
$location{'2980'} = "Kokkedal";
$location{'2990'} = "Niv�";
$location{'3000'} = "Helsing�r";
$location{'3050'} = "Humleb�k";
$location{'3060'} = "Esperg�rde";
$location{'3070'} = "Snekkersten";
$location{'3080'} = "Tik�b";
$location{'3100'} = "Hornb�k";
$location{'3120'} = "Dronningm�lle";
$location{'3140'} = "�lsg�rde";
$location{'3150'} = "Helleb�k";
$location{'3200'} = "Helsinge";
$location{'3210'} = "Vejby";
$location{'3220'} = "Tisvildeleje";
$location{'3230'} = "Gr�sted";
$location{'3250'} = "Gilleleje";
$location{'3300'} = "Frederiksv�rk";
$location{'3310'} = "�lsted";
$location{'3320'} = "Sk�vinge";
$location{'3330'} = "G�rl�se";
$location{'3360'} = "Liseleje";
$location{'3370'} = "Melby";
$location{'3390'} = "Hundested";
$location{'3400'} = "Hiller�d";
$location{'3450'} = "Aller�d";
$location{'3460'} = "Birker�d";
$location{'3480'} = "Fredensborg";
$location{'3490'} = "Kvistg�rd";
$location{'3500'} = "V�rl�se";
$location{'3520'} = "Farum";
$location{'3540'} = "Lynge";
$location{'3550'} = "Slangerup";
$location{'3600'} = "Frederikssund";
$location{'3630'} = "J�gerspris";
$location{'3650'} = "�lstykke";
$location{'3660'} = "Stenl�se";
$location{'3670'} = "Veks� Sj�lland";
$location{'3700'} = "R�nne";
$location{'3720'} = "Aakirkeby";
$location{'3730'} = "Nex�";
$location{'3740'} = "Svaneke";
$location{'3751'} = "�stermarie";
$location{'3760'} = "Gudhjem";
$location{'3770'} = "Allinge";
$location{'3782'} = "Klemensker";
$location{'3790'} = "Hasle";
$location{'4000'} = "Roskilde";
$location{'4040'} = "Jyllinge";
$location{'4050'} = "Skibby";
$location{'4060'} = "Kirke S�by";
$location{'4070'} = "Kirke Hyllinge";
$location{'4100'} = "Ringsted";
$location{'4105'} = "Ringsted"; $owner{'4105'} = "Midtsj�llands Postcenter + erhvervskunder";
$location{'4129'} = "Ringsted"; $type{'4129'} = "PP";
$location{'4130'} = "Viby Sj�lland";
$location{'4140'} = "Borup";
$location{'4160'} = "Herlufmagle";
$location{'4171'} = "Glums�";
$location{'4173'} = "Fjenneslev";
$location{'4174'} = "Jystrup Midtsj";
$location{'4180'} = "Sor�";
$location{'4190'} = "Munke Bjergby";
$location{'4200'} = "Slagelse";
$location{'4220'} = "Kors�r";
$location{'4230'} = "Sk�lsk�r";
$location{'4241'} = "Vemmelev";
$location{'4242'} = "Boeslunde";
$location{'4243'} = "Rude";
$location{'4250'} = "Fuglebjerg";
$location{'4261'} = "Dalmose";
$location{'4262'} = "Sandved";
$location{'4270'} = "H�ng";
$location{'4281'} = "G�rlev";
$location{'4291'} = "Ruds Vedby";
$location{'4293'} = "Dianalund";
$location{'4295'} = "Stenlille";
$location{'4296'} = "Nyrup";
$location{'4300'} = "Holb�k";
$location{'4320'} = "Lejre";
$location{'4330'} = "Hvals�";
$location{'4340'} = "T�ll�se";
$location{'4350'} = "Ugerl�se";
$location{'4360'} = "Kirke Eskilstrup";
$location{'4370'} = "Store Merl�se";
$location{'4390'} = "Vipper�d";
$location{'4400'} = "Kalundborg";
$location{'4420'} = "Regstrup";
$location{'4440'} = "M�rk�v";
$location{'4450'} = "Jyderup";
$location{'4460'} = "Snertinge";
$location{'4470'} = "Sveb�lle";
$location{'4480'} = "Store Fuglede";
$location{'4490'} = "Jerslev Sj�lland";
$location{'4500'} = "Nyk�bing Sj";
$location{'4520'} = "Svinninge";
$location{'4532'} = "Gislinge";
$location{'4534'} = "H�rve";
$location{'4540'} = "F�revejle";
$location{'4550'} = "Asn�s";
$location{'4560'} = "Vig";
$location{'4571'} = "Grevinge";
$location{'4572'} = "N�rre Asmindrup";
$location{'4573'} = "H�jby";
$location{'4581'} = "R�rvig";
$location{'4583'} = "Sj�llands Odde";
$location{'4591'} = "F�llenslev";
$location{'4592'} = "Sejer�";
$location{'4593'} = "Eskebjerg";
$location{'4600'} = "K�ge";
$location{'4621'} = "Gadstrup";
$location{'4622'} = "Havdrup";
$location{'4623'} = "Lille Skensved";
$location{'4632'} = "Bj�verskov";
$location{'4640'} = "Fakse";
$location{'4652'} = "H�rlev";
$location{'4653'} = "Karise";
$location{'4654'} = "Fakse Ladeplads";
$location{'4660'} = "Store Heddinge";
$location{'4671'} = "Str�by";
$location{'4672'} = "Klippinge";
$location{'4673'} = "R�dvig Stevns";
$location{'4681'} = "Herf�lge";
$location{'4682'} = "Tureby";
$location{'4683'} = "R�nnede";
$location{'4684'} = "Holmegaard ";
$location{'4690'} = "Haslev";
$location{'4700'} = "N�stved";
$location{'4720'} = "Pr�st�";
$location{'4733'} = "Tappern�je";
$location{'4735'} = "Mern";
$location{'4736'} = "Karreb�ksminde";
$location{'4750'} = "Lundby";
$location{'4760'} = "Vordingborg";
$location{'4771'} = "Kalvehave";
$location{'4772'} = "Langeb�k";
$location{'4773'} = "Stensved";
$location{'4780'} = "Stege";
$location{'4791'} = "Borre";
$location{'4792'} = "Askeby";
$location{'4793'} = "Bog� By";
$location{'4800'} = "Nyk�bing F";
$location{'4840'} = "N�rre Alslev";
$location{'4850'} = "Stubbek�bing";
$location{'4862'} = "Guldborg";
$location{'4863'} = "Eskilstrup";
$location{'4871'} = "Horbelev";
$location{'4872'} = "Idestrup";
$location{'4873'} = "V�ggerl�se";
$location{'4874'} = "Gedser";
$location{'4880'} = "Nysted";
$location{'4891'} = "Toreby L";
$location{'4892'} = "Kettinge";
$location{'4894'} = "�ster Ulslev";
$location{'4895'} = "Errindlev";
$location{'4900'} = "Nakskov";
$location{'4912'} = "Harpelunde";
$location{'4913'} = "Horslunde";
$location{'4920'} = "S�llested";
$location{'4930'} = "Maribo";
$location{'4941'} = "Bandholm";
$location{'4943'} = "Torrig L";
$location{'4944'} = "Fej�";
$location{'4951'} = "N�rreballe";
$location{'4952'} = "Stokkemarke";
$location{'4953'} = "Vesterborg";
$location{'4960'} = "Holeby";
$location{'4970'} = "R�dby";
$location{'4983'} = "Dannemare";
$location{'4990'} = "Saksk�bing";
$location{'5000'} = "Odense C";
$location{'5029'} = "Odense C"; $type{'5029'} = "PP";
$location{'5090'} = "Odense C"; $owner{'5090'} = "Erhvervskunder";
$location{'5100'} = "Odense C"; $type{'5100'} = "BX";
$location{'5200'} = "Odense V";
$location{'5210'} = "Odense NV";
$location{'5220'} = "Odense S�";
$location{'5230'} = "Odense M";
$location{'5240'} = "Odense N�";
$location{'5250'} = "Odense SV";
$location{'5260'} = "Odense S";
$location{'5270'} = "Odense N";
$location{'5290'} = "Marslev";
$location{'5300'} = "Kerteminde";
$location{'5320'} = "Agedrup";
$location{'5330'} = "Munkebo";
$location{'5350'} = "Rynkeby";
$location{'5370'} = "Mesinge";
$location{'5380'} = "Dalby";
$location{'5390'} = "Martofte";
$location{'5400'} = "Bogense";
$location{'5450'} = "Otterup";
$location{'5462'} = "Morud";
$location{'5463'} = "Harndrup";
$location{'5464'} = "Brenderup Fyn";
$location{'5466'} = "Asperup";
$location{'5471'} = "S�nders�";
$location{'5474'} = "Veflinge";
$location{'5485'} = "Skamby";
$location{'5491'} = "Blommenslyst";
$location{'5492'} = "Vissenbjerg";
$location{'5500'} = "Middelfart";
$location{'5540'} = "Ullerslev";
$location{'5550'} = "Langeskov";
$location{'5560'} = "Aarup";
$location{'5580'} = "N�rre Aaby";
$location{'5591'} = "Gelsted";
$location{'5592'} = "Ejby";
$location{'5600'} = "Faaborg";
$location{'5610'} = "Assens";
$location{'5620'} = "Glamsbjerg";
$location{'5631'} = "Ebberup";
$location{'5642'} = "Millinge";
$location{'5672'} = "Broby";
$location{'5683'} = "Haarby";
$location{'5690'} = "Tommerup";
$location{'5700'} = "Svendborg";
$location{'5750'} = "Ringe";
$location{'5762'} = "Vester Skerninge";
$location{'5771'} = "Stenstrup";
$location{'5772'} = "Kv�rndrup";
$location{'5792'} = "�rslev";
$location{'5800'} = "Nyborg";
$location{'5853'} = "�rb�k";
$location{'5854'} = "Gislev";
$location{'5856'} = "Ryslinge";
$location{'5863'} = "Ferritslev Fyn";
$location{'5871'} = "Fr�rup";
$location{'5874'} = "Hesselager";
$location{'5881'} = "Sk�rup Fyn";
$location{'5882'} = "Vejstrup";
$location{'5883'} = "Oure";
$location{'5884'} = "Gudme";
$location{'5892'} = "Gudbjerg Sydfyn";
$location{'5900'} = "Rudk�bing";
$location{'5932'} = "Humble";
$location{'5935'} = "Bagenkop";
$location{'5953'} = "Tranek�r";
$location{'5960'} = "Marstal";
$location{'5970'} = "�r�sk�bing";
$location{'5985'} = "S�by �r�";
$location{'6000'} = "Kolding";
$location{'6040'} = "Egtved";
$location{'6051'} = "Almind";
$location{'6052'} = "Viuf";
$location{'6064'} = "Jordrup";
$location{'6070'} = "Christiansfeld";
$location{'6091'} = "Bjert";
$location{'6092'} = "S�nder Stenderup";
$location{'6093'} = "Sj�lund";
$location{'6094'} = "Hejls";
$location{'6100'} = "Haderslev";
$location{'6200'} = "Aabenraa";
$location{'6230'} = "R�dekro";
$location{'6240'} = "L�gumkloster";
$location{'6261'} = "Bredebro";
$location{'6270'} = "T�nder";
$location{'6280'} = "H�jer";
$location{'6300'} = "Gr�sten";
$location{'6310'} = "Broager";
$location{'6320'} = "Egernsund";
$location{'6330'} = "Padborg";
$location{'6340'} = "Krus�";
$location{'6360'} = "Tinglev";
$location{'6372'} = "Bylderup-Bov";
$location{'6392'} = "Bolderslev";
$location{'6400'} = "S�nderborg";
$location{'6430'} = "Nordborg";
$location{'6440'} = "Augustenborg";
$location{'6470'} = "Sydals";
$location{'6500'} = "Vojens";
$location{'6510'} = "Gram";
$location{'6520'} = "Toftlund";
$location{'6534'} = "Agerskov";
$location{'6535'} = "Branderup J";
$location{'6541'} = "Bevtoft";
$location{'6560'} = "Sommersted";
$location{'6580'} = "Vamdrup";
$location{'6600'} = "Vejen";
$location{'6621'} = "Gesten";
$location{'6622'} = "B�kke";
$location{'6623'} = "Vorbasse";
$location{'6630'} = "R�dding";
$location{'6640'} = "Lunderskov";
$location{'6650'} = "Br�rup";
$location{'6660'} = "Lintrup";
$location{'6670'} = "Holsted";
$location{'6682'} = "Hovborg";
$location{'6683'} = "F�vling";
$location{'6690'} = "G�rding";
$location{'6700'} = "Esbjerg";
$location{'6701'} = "Esbjerg"; $type{'6701'} = "BX";
$location{'6705'} = "Esbjerg �";
$location{'6710'} = "Esbjerg V";
$location{'6715'} = "Esbjerg N";
$location{'6720'} = "Fan�";
$location{'6731'} = "Tj�reborg";
$location{'6740'} = "Bramming";
$location{'6752'} = "Glejbjerg";
$location{'6753'} = "Agerb�k";
$location{'6760'} = "Ribe";
$location{'6771'} = "Gredstedbro";
$location{'6780'} = "Sk�rb�k";
$location{'6792'} = "R�m�";
$location{'6800'} = "Varde";
$location{'6818'} = "�rre";
$location{'6823'} = "Ansager";
$location{'6830'} = "N�rre Nebel";
$location{'6840'} = "Oksb�l";
$location{'6851'} = "Janderup Vestj";
$location{'6852'} = "Billum";
$location{'6853'} = "Vejers Strand";
$location{'6854'} = "Henne";
$location{'6855'} = "Outrup";
$location{'6857'} = "Bl�vand";
$location{'6862'} = "Tistrup";
$location{'6870'} = "�lgod";
$location{'6880'} = "Tarm";
$location{'6893'} = "Hemmet";
$location{'6900'} = "Skjern";
$location{'6920'} = "Videb�k";
$location{'6933'} = "Kib�k";
$location{'6940'} = "Lem St";
$location{'6950'} = "Ringk�bing";
$location{'6960'} = "Hvide Sande";
$location{'6971'} = "Spjald";
$location{'6973'} = "�rnh�j";
$location{'6980'} = "Tim";
$location{'6990'} = "Ulfborg";
$location{'7000'} = "Fredericia";
$location{'7007'} = "Fredericia"; $owner{'7007'} = "Sydjyllands Postcenter + erhvervskunder";
$location{'7029'} = "Fredericia"; $type{'7029'} = "PP";
$location{'7080'} = "B�rkop";
$location{'7100'} = "Vejle";
$location{'7120'} = "Vejle �st";
$location{'7130'} = "Juelsminde";
$location{'7140'} = "Stouby";
$location{'7150'} = "Barrit";
$location{'7160'} = "T�rring";
$location{'7171'} = "Uldum";
$location{'7173'} = "Vonge";
$location{'7182'} = "Bredsten";
$location{'7183'} = "Randb�l";
$location{'7184'} = "Vandel";
$location{'7190'} = "Billund";
$location{'7200'} = "Grindsted";
$location{'7250'} = "Hejnsvig";
$location{'7260'} = "S�nder Omme";
$location{'7270'} = "Stakroge";
$location{'7280'} = "S�nder Felding";
$location{'7300'} = "Jelling";
$location{'7321'} = "Gadbjerg";
$location{'7323'} = "Give";
$location{'7330'} = "Brande";
$location{'7361'} = "Ejstrupholm";
$location{'7362'} = "Hampen";
$location{'7400'} = "Herning";
$location{'7401'} = "Herning"; $owner{'7401'} = "Erhvervskunder";
$location{'7429'} = "Herning"; $type{'7429'} = "PP";
$location{'7430'} = "Ikast";
$location{'7441'} = "Bording";
$location{'7442'} = "Engesvang";
$location{'7451'} = "Sunds";
$location{'7470'} = "Karup J";
$location{'7480'} = "Vildbjerg";
$location{'7490'} = "Aulum";
$location{'7500'} = "Holstebro";
$location{'7540'} = "Haderup";
$location{'7550'} = "S�rvad";
$location{'7560'} = "Hjerm";
$location{'7570'} = "Vemb";
$location{'7600'} = "Struer";
$location{'7620'} = "Lemvig";
$location{'7650'} = "B�vlingbjerg";
$location{'7660'} = "B�kmarksbro";
$location{'7673'} = "Harbo�re";
$location{'7680'} = "Thybor�n";
$location{'7700'} = "Thisted";
$location{'7730'} = "Hanstholm";
$location{'7741'} = "Fr�strup";
$location{'7742'} = "Vesl�s";
$location{'7752'} = "Snedsted";
$location{'7755'} = "Bedsted Thy";
$location{'7760'} = "Hurup Thy";
$location{'7770'} = "Vestervig";
$location{'7790'} = "Thyholm";
$location{'7800'} = "Skive";
$location{'7830'} = "Vinderup";
$location{'7840'} = "H�jslev";
$location{'7850'} = "Stoholm Jyll";
$location{'7860'} = "Sp�ttrup";
$location{'7870'} = "Roslev";
$location{'7884'} = "Fur";
$location{'7900'} = "Nyk�bing M";
$location{'7950'} = "Erslev";
$location{'7960'} = "Karby";
$location{'7970'} = "Redsted M";
$location{'7980'} = "Vils";
$location{'7990'} = "�ster Assels";
$location{'8000'} = "�rhus C";
$location{'8100'} = "�rhus C"; $type{'8100'} = "BX";
$location{'8200'} = "�rhus N";
$location{'8210'} = "�rhus V";
$location{'8220'} = "Brabrand";
$location{'8229'} = "Risskov �"; $type{'8229'} = "PP";
$location{'8230'} = "�byh�j";
$location{'8240'} = "Risskov";
$location{'8245'} = "Risskov �"; $owner{'8245'} = "�stjyllands Postcenter + erhvervskunder";
$location{'8250'} = "Eg�";
$location{'8260'} = "Viby J";
$location{'8270'} = "H�jbjerg";
$location{'8300'} = "Odder";
$location{'8305'} = "Sams�";
$location{'8310'} = "Tranbjerg J";
$location{'8320'} = "M�rslet";
$location{'8330'} = "Beder";
$location{'8340'} = "Malling";
$location{'8350'} = "Hundslund";
$location{'8355'} = "Solbjerg";
$location{'8361'} = "Hasselager";
$location{'8362'} = "H�rning";
$location{'8370'} = "Hadsten";
$location{'8380'} = "Trige";
$location{'8381'} = "Tilst";
$location{'8382'} = "Hinnerup";
$location{'8400'} = "Ebeltoft";
$location{'8410'} = "R�nde";
$location{'8420'} = "Knebel";
$location{'8444'} = "Balle";
$location{'8450'} = "Hammel";
$location{'8462'} = "Harlev J";
$location{'8464'} = "Galten";
$location{'8471'} = "Sabro";
$location{'8472'} = "Sporup";
$location{'8500'} = "Grenaa";
$location{'8520'} = "Lystrup";
$location{'8530'} = "Hjortsh�j";
$location{'8541'} = "Sk�dstrup";
$location{'8543'} = "Hornslet";
$location{'8544'} = "M�rke";
$location{'8550'} = "Ryomg�rd";
$location{'8560'} = "Kolind";
$location{'8570'} = "Trustrup";
$location{'8581'} = "Nimtofte";
$location{'8585'} = "Glesborg";
$location{'8586'} = "�rum Djurs";
$location{'8592'} = "Anholt";
$location{'8600'} = "Silkeborg";
$location{'8620'} = "Kjellerup";
$location{'8632'} = "Lemming";
$location{'8641'} = "Sorring";
$location{'8643'} = "Ans By";
$location{'8653'} = "Them";
$location{'8654'} = "Bryrup";
$location{'8660'} = "Skanderborg";
$location{'8670'} = "L�sby";
$location{'8680'} = "Ry";
$location{'8700'} = "Horsens";
$location{'8721'} = "Daug�rd";
$location{'8722'} = "Hedensted";
$location{'8723'} = "L�sning";
$location{'8732'} = "Hovedg�rd";
$location{'8740'} = "Br�dstrup";
$location{'8751'} = "Gedved";
$location{'8752'} = "�stbirk";
$location{'8762'} = "Flemming";
$location{'8763'} = "Rask M�lle";
$location{'8765'} = "Klovborg";
$location{'8766'} = "N�rre Snede";
$location{'8781'} = "Stenderup";
$location{'8783'} = "Hornsyld";
$location{'8800'} = "Viborg";
$location{'8830'} = "Tjele";
$location{'8831'} = "L�gstrup";
$location{'8832'} = "Skals";
$location{'8840'} = "R�dk�rsbro";
$location{'8850'} = "Bjerringbro";
$location{'8860'} = "Ulstrup";
$location{'8870'} = "Lang�";
$location{'8881'} = "Thors�";
$location{'8882'} = "F�rvang";
$location{'8883'} = "Gjern";
$location{'8900'} = "Randers";
$location{'8950'} = "�rsted";
$location{'8961'} = "Alling�bro";
$location{'8963'} = "Auning";
$location{'8970'} = "Havndal";
$location{'8981'} = "Spentrup";
$location{'8983'} = "Gjerlev J";
$location{'8990'} = "F�rup";
$location{'9000'} = "Aalborg";
$location{'9020'} = "Aalborg"; $owner{'9020'} = "Erhvervskunder";
$location{'9029'} = "Aalborg"; $type{'9029'} = "PP";
$location{'9100'} = "Aalborg"; $type{'9100'} = "BX";
$location{'9200'} = "Aalborg SV";
$location{'9210'} = "Aalborg S�";
$location{'9220'} = "Aalborg �st";
$location{'9230'} = "Svenstrup J";
$location{'9240'} = "Nibe";
$location{'9260'} = "Gistrup";
$location{'9270'} = "Klarup";
$location{'9280'} = "Storvorde";
$location{'9293'} = "Kongerslev";
$location{'9300'} = "S�by";
$location{'9310'} = "Vodskov";
$location{'9320'} = "Hjallerup";
$location{'9330'} = "Dronninglund";
$location{'9340'} = "Asaa";
$location{'9352'} = "Dybvad";
$location{'9362'} = "Gandrup";
$location{'9370'} = "Hals";
$location{'9380'} = "Vestbjerg";
$location{'9381'} = "Sulsted";
$location{'9382'} = "Tylstrup";
$location{'9400'} = "N�rresundby";
$location{'9430'} = "Vadum";
$location{'9440'} = "Aabybro";
$location{'9460'} = "Brovst";
$location{'9480'} = "L�kken";
$location{'9490'} = "Pandrup";
$location{'9492'} = "Blokhus";
$location{'9493'} = "Saltum";
$location{'9500'} = "Hobro";
$location{'9510'} = "Arden";
$location{'9520'} = "Sk�rping";
$location{'9530'} = "St�vring";
$location{'9541'} = "Suldrup";
$location{'9550'} = "Mariager";
$location{'9560'} = "Hadsund";
$location{'9574'} = "B�lum";
$location{'9575'} = "Terndrup";
$location{'9600'} = "Aars";
$location{'9610'} = "N�rager";
$location{'9620'} = "Aalestrup";
$location{'9631'} = "Gedsted";
$location{'9632'} = "M�ldrup";
$location{'9640'} = "Fars�";
$location{'9670'} = "L�gst�r";
$location{'9681'} = "Ranum";
$location{'9690'} = "Fjerritslev";
$location{'9700'} = "Br�nderslev";
$location{'9740'} = "Jerslev J";
$location{'9750'} = "�stervr�";
$location{'9760'} = "Vr�";
$location{'9800'} = "Hj�rring";
$location{'9830'} = "T�rs";
$location{'9850'} = "Hirtshals";
$location{'9870'} = "Sindal";
$location{'9881'} = "Bindslev";
$location{'9900'} = "Frederikshavn";
$location{'9940'} = "L�s�";
$location{'9970'} = "Strandby";
$location{'9981'} = "Jerup";
$location{'9982'} = "�lb�k";
$location{'9990'} = "Skagen";
$location{'3900'} = "Nuuk";
$location{'3905'} = "Nuussuaq";
$location{'3910'} = "Kangerlussuaq";
$location{'3911'} = "Sisimiut";
$location{'3912'} = "Maniitsoq";
$location{'3913'} = "Tasiilaq";
$location{'3915'} = "Kulusuk";
$location{'3919'} = "Alluitsup Paa";
$location{'3920'} = "Qaqortoq";
$location{'3921'} = "Narsaq";
$location{'3922'} = "Nanortalik";
$location{'3923'} = "Narsarsuaq";
$location{'3924'} = "Ikerasassuaq";
$location{'3930'} = "Kangilinnguit";
$location{'3932'} = "Arsuk";
$location{'3940'} = "Paamiut";
$location{'3950'} = "Aasiaat";
$location{'3951'} = "Qasigiannguit";
$location{'3952'} = "Ilulissat";
$location{'3953'} = "Qeqertarsuaq";
$location{'3955'} = "Kangaatsiaq";
$location{'3961'} = "Uummannaq";
$location{'3962'} = "Upernavik";
$location{'3964'} = "Qaarsut";
$location{'3970'} = "Pituffik";
$location{'3971'} = "Qaanaaq";
$location{'3980'} = "Ittoqqortoormiit";
$location{'3984'} = "Danmarkshavn";
$location{'3985'} = "Constable Pynt";
$location{'100'} = "T�rshavn";
$location{'110'} = "T�rshavn "; $type{'110'} = "BX";
$location{'160'} = "Argir";
$location{'165'} = "Argir "; $type{'165'} = "BX";
$location{'175'} = "Kirkjub�ur";
$location{'176'} = "Velbastadur";
$location{'177'} = "Sydradalur, Streymoy";
$location{'178'} = "Nordradalur";
$location{'180'} = "Kaldbak";
$location{'185'} = "Kaldbaksbotnur";
$location{'186'} = "Sund";
$location{'187'} = "Hvitanes";
$location{'188'} = "Hoyv�k";
$location{'210'} = "Sandur";
$location{'215'} = "Sandur"; $type{'215'} = "BX";
$location{'220'} = "Sk�lav�k";
$location{'230'} = "H�sav�k";
$location{'235'} = "Dalur";
$location{'236'} = "Skarvanes";
$location{'240'} = "Skopun";
$location{'260'} = "Sk�voy";
$location{'270'} = "N�lsoy";
$location{'280'} = "Hestur";
$location{'285'} = "Koltur";
$location{'286'} = "St�ra Dimun";
$location{'330'} = "Stykkid";
$location{'335'} = "Leynar";
$location{'336'} = "Sk�llingur";
$location{'340'} = "Kv�v�k";
$location{'350'} = "Vestmanna";
$location{'355'} = "Vestmanna"; $type{'355'} = "BX";
$location{'358'} = "V�lur";
$location{'360'} = "Sandav�gur";
$location{'370'} = "Midv�gur";
$location{'375'} = "Midv�gur"; $type{'375'} = "BX";
$location{'380'} = "S�rv�gur";
$location{'385'} = "Vatnsoyrar";
$location{'386'} = "B�ur";
$location{'387'} = "G�sadalur";
$location{'388'} = "Mykines";
$location{'400'} = "Oyrarbakki";
$location{'405'} = "Oyrarbakki"; $type{'405'} = "BX";
$location{'410'} = "Kollafj�rdur";
$location{'415'} = "Oyrareingir";
$location{'416'} = "Signab�ur";
$location{'420'} = "H�sv�k";
$location{'430'} = "Hvalv�k";
$location{'435'} = "Streymnes";
$location{'436'} = "Saksun";
$location{'437'} = "Nesv�k";
$location{'438'} = "Langasandur";
$location{'440'} = "Haldarsv�k";
$location{'445'} = "Tj�rnuv�k";
$location{'450'} = "Oyri";
$location{'460'} = "Nordsk�li";
$location{'465'} = "Svin�ir";
$location{'466'} = "Lj�s�";
$location{'470'} = "Eidi";
$location{'475'} = "Funningur";
$location{'476'} = "Gj�gv";
$location{'477'} = "Funningsfj�rdur";
$location{'478'} = "Elduv�k";
$location{'480'} = "Sk�li";
$location{'485'} = "Sk�lafj�rdur";
$location{'490'} = "Strendur";
$location{'494'} = "innan Glyvur";
$location{'495'} = "Kolbanargj�gv";
$location{'496'} = "Morskranes";
$location{'497'} = "Selatrad";
$location{'510'} = "G�ta";
$location{'511'} = "G�tugj�gv";
$location{'512'} = "Nordrag�ta";
$location{'513'} = "Sydrug�ta";
$location{'515'} = "G�ta"; $type{'515'} = "BX";
$location{'520'} = "Leirv�k";
$location{'530'} = "Fuglafj�rdur";
$location{'535'} = "Fuglafj�rdur"; $type{'535'} = "BX";
$location{'600'} = "Saltangar�";
$location{'610'} = "Saltangar�"; $type{'610'} = "BX";
$location{'620'} = "Runav�k";
$location{'625'} = "Glyvrar";
$location{'626'} = "Lambareidi";
$location{'627'} = "Lambi";
$location{'640'} = "Rituv�k";
$location{'645'} = "�duv�k";
$location{'650'} = "Toftir";
$location{'655'} = "Nes, Eysturoy";
$location{'656'} = "Saltnes";
$location{'660'} = "S�ldarfj�rdur";
$location{'665'} = "Skipanes";
$location{'666'} = "G�tueidi";
$location{'690'} = "Oyndarfj�rdur";
$location{'695'} = "Hellur";
$location{'700'} = "Klaksv�k";
$location{'710'} = "Klaksv�k"; $type{'710'} = "BX";
$location{'725'} = "Nordoyri";
$location{'726'} = "�nir";
$location{'727'} = "�rnafj�rdur";
$location{'730'} = "Norddepil";
$location{'735'} = "Depil";
$location{'736'} = "Nordtoftir";
$location{'737'} = "M�li";
$location{'740'} = "Hvannasund";
$location{'750'} = "Vidareidi";
$location{'765'} = "Svinoy";
$location{'766'} = "Kirkja";
$location{'767'} = "Hattarv�k";
$location{'780'} = "Kunoy";
$location{'785'} = "Haraldssund";
$location{'795'} = "Sydradalur, Kalsoy";
$location{'796'} = "H�sar";
$location{'797'} = "Mikladalur";
$location{'798'} = "Tr�llanes";
$location{'800'} = "Tv�royri";
$location{'810'} = "Tv�royri"; $type{'810'} = "BX";
$location{'825'} = "Frodba";
$location{'826'} = "Trongisv�gur";
$location{'827'} = "�rav�k";
$location{'850'} = "Hvalba";
$location{'860'} = "Sandv�k";
$location{'870'} = "F�mjin";
$location{'900'} = "V�gur";
$location{'910'} = "V�gur"; $type{'910'} = "BX";
$location{'925'} = "Nes, V�gur";
$location{'926'} = "Lopra";
$location{'927'} = "Akrar";
$location{'928'} = "Vikarbyrgi";
$location{'950'} = "Porkeri";
$location{'960'} = "Hov";
$location{'970'} = "Sumba";

## bin/update end

1;
__END__

=head1 NAME

Geo::Postcodes::DK - Danish postcodes with associated information

=head1 SYNOPSIS

This module can be used object oriented, or as procedures.
Take your pick.

=head2 AS OBJECTS

 use Geo::Postcodes::DK;

 my $postcode = '1171';

 if (Geo::Postcodes::DK::valid($postcode)) # A valid postcode?
 {
   my $P = Geo::Postcodes::DK->new($postcode);

   printf "Postcode         '%s'.\n", $P->postcode();
   printf "Postal location: '%s'.\n", $P->location();
   printf "Borough:         '%s'.\n", $P->borough();
   printf "County:          '%s'.\n", $P->county();
   printf "Owner:           '%s'.\n", $P->owner();
   printf "Address:         '%s'.\n", $P->address();
   printf "Postcode type:   '%s'.\n", $P->type(); 
   printf "- in danish:     '%s'.\n", $P->type_verbose(); 
   printf "- in english:    '%s'.\n", $P->Geo::Postcodes::type_verbose(); 
 }

The test for a valid postcode can also be done on the object itself, as
it will be I<undef> when passed an illegal postcode (and thus no object
at all.)

 my $P = Geo::postcodes::DK->new($postcode);

 if ($P) { ... }

A more compact solution:

 if ($P = Geo::Postcodes::DK->new($postcode))
 {
   foreach my $field (Geo::Postcodes::DK::get_fields())
   {
     printf("%-20s %s\n", ucfirst($field), $P->$field())
   }
 }

=head2 AS PROCEDURES

 use Geo::postcodes::DK;

 my $postcode = "1171";

 if (Geo::Postcodes::DK::valid($postcode))
 {
   printf "Postcode"        '%s'.\n", $postcode;
   printf "Postal location: '%s'.\n", location_of($postcode);
   printf "Postcode type:   '%s'.\n", type_of($postcode); 
   printf "Owner:           '%s'.\n", owner_of($postcode);
   printf "Address:         '%s'.\n", address_of($postcode);
 }

=head1 ABSTRACT

Geo::postcodes::DK - Perl extension for the mapping between danish
(including Gr�nland and F�r�erne) postcodes, postal location,
address and address owner.

=head1 DESCRIPTION

Tired og entering the postal name all the time? This is not necessary, as
it is uniquely defined from the postcode. Request the postcode only,
and use this library to get the postal name.

=head2 EXPORT

None.

The module supports the following fields: 'postcode', 'location', 'address',
'owner', 'type', and -type_verbose'. This list can also be obtained with the
call C<Geo::Postcodes::DK::get_fields()>.

=head1 DEPENDENCIES

This module is a subclass of Geo::Postcodes, which must be installed first.

=head1 PROCEDURES and METHODS

These functions can be used as methods or procedures.

=head2 is_field

 my $boolean = Geo::postcodes::DK::is_field($field);
 my $boolean = $postcode_object->is_field($field);

Does the specified field exist.

=head2 get_fields

  my @fields = Geo::postcodes::DK::get_fields();
  my @fields = $postcode_object->get_fields();

A list of fields supported by this class.

=head2 selection

This procedure/method makes it possible to select more than one postcode at a time,
based on arbitrary complex rules.

See the selection documentation (I<perldoc Geo::Postcodes::Selection> or
I<man Geo::Postcodes::Selection>) for a full description, and the tutorial
(I<perldoc Geo::Postcodes::Tutorial> or I<man Geo::Postcodes::Tutorial>)
for sample code.

=head2 selection_loop

As above.

=head1 PROCEDURES

Note that the I<xxx_of> procedures return I<undef> when passed an illegal
argument. They are used internally by the object constructor (new).

=head2 legal

C<my $boolean = Geo::postcodes::DK::legal($postcode);>

Do we have a legal postcode; a code that follows the syntax rules?

=head2 valid

C<my $boolean = Geo::postcodes::DK::valid($postcode);>

Do we have a valid postcode; a code in actual use?

=head2 get_postcodes

This will return an unsorted list of all the norwegian postcodes.

=head2 verify_selectionlist

This will check the list of arguments for correctness, and should
be used before calling 'selection'. The procedure returns a modified
version of the arguments on success, and diagnostic messages on failure.

  my($status, @modified) = Geo::Postcodes::DK::verify_selectionlist(@args);

  if ($status)
  {
    my @result = Geo::Postcodes::DK::selection(@modified);
  }
  else
  {
    print "Diagnostic messages:\n";
    map { print " - $_\n" } @modified;
  }

=head2 postcode_of

  $postcode = Geo::Postcodes::NO::postcode_of($postcode);

Used internally by 'selection', but otherwise not very useful.

=head2 location_of

C<my $location = Geo::postcodes::DK::location_of($postcode);>

The postal place associated with the specified postcode.

=head2 owner_of

C<my $owner = Geo::postcodes::DK::owner_of($postcode);>

The owner (company) of the postcode, if any.

=head2 address_of

C<my $address = Geo::postcodes::DK::address_of($postcode);>

The address (street) associated with the specified postcode.

=head2 type_of

 my $type = Geo::postcodes::DK::type_of($postcode);

What kind of postcode is this, as a code.

=head2 type_verbose_of

 my $danish_description  = Geo::postcodes::DK::type_verbose_of($postcode);
 my $english_description = Geo::postcodes::type_verbose_of($postcode);

A danish text describing the type. Use the base class for the english
description.

See the L<TYPE> section for a description of the types.

=head2 type2verbose

Get the description of the specified type.

  my $danish_description  = Geo::Postcodes::DK::type2verbose($type);
  my $english_description = Geo::Postcodes::type2verbose($type);

=head1 METHODS

=head2 new

  my $P = Geo::postcodes::DK-E<gt>new($postcode);

Create a new postcode object. Internally this will call the C<xxx_of> procedures
for the fields supported by this class.

The constructor will return I<undef> when passed an invalid or illegal postcode.
Do not try method calls on it, as it is not an object. See the description of
the I<legal> and I<valid> procedures above.

=head2 postcode

  my $postcode = $P->postcode();

The postcode, as given to the constructor (new).

=head2 location

  my $location = $P->location();

The postal location associated with the specified postcode.

=head2 type

  my $type = $P->type();

See the description of the procedure I<type_of> above.

=head2 type_verbose

See the description of the procedure I<type_verbose_of> above.

  my $type_danish  = $P->type_verbose();
  my $type_english = $P->Geo::Postcodes::type_verbose();

Use this to get the description.

See the L<TYPE> section for a description of the types.

=head1 TYPE

This class supports the following types for the postal locatuons:

=over

=item BX

Postboks (Post Office box)

=item ST

Gadeadresse (Street address)

=item IO

Personlig eier (Individual owner)

=item PP

Ufrankerede svarforsendelser (Porto Paye receiver)

=back

Se L<Geo::Postcodes> for furter descriptions.

=head1 CAVEAT

=head2 POSTCODES

Danish postcodes (including Gr�nland) are four digit numbers ("0000" to "9999"),
while F�r�erne uses three digits numbers ("000" to "999"). This means that
"0010" and "010" are legal, while "10" is not.

Use I<legal> to check for legal postcodes, and I<valid> to check if
the postcode is actually in use. C<Geo::postcodes::DK->new($postcode)>
will return I<undef> if passed an illegal or invalid postcode. 

An attempt to access the methods of a non-existent postcode object will
result in a runtime error. This can be avoided by checking if the postal
code is legal, before creating the object; C<valid($postcode)>
returns true or false.

=head2 CHARACTER SET

The library was written using the ISO-8859-1 (iso-latin1) character set, and the
special danish letters '�', '�' and '�' occur regularly in the postal places,
kommune name and fylke name. Usage of other character sets may cause havoc.
Unicode is not tested.

Note that the case insensitive search (in the 'selection' method/procedure)
doesn't recognize an '�' as an '�' (and so on). C<use locale> in the
application program should fix this, if the current locale supports these
characters.

=head1 SEE ALSO

See also the sample programs in the C<eg/>-directory of the distribution,
and the tutorial I<Geo::Postcodes::Tutorial> available as
C<perldoc Geo::Postcodes::Tutorial> or C<man Geo::Postcodes::Tutorial>.

The latest version of this library should always be available on CPAN, but see
also the library home page; F<http://bbop.org/perl/GeoPostcodes> for additional
information and sample usage.

=head1 AUTHOR

Arne Sommer, E<lt>perl@bbop.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
