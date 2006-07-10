package Geo::Postcodes::DK;

use Geo::Postcodes; ## qw(borough_of county_of);

use base qw(Geo::Postcodes);

my @ISA = ('Geo::Postcodes', 'Exporter');

use strict;
use warnings;

require Exporter;

my %EXPORT_TAGS = ( 'core'  => [ qw(legal valid location_of borough_of county_of type_of owner_of address_of) ],
                    'addon' => [ qw( ) ],
                    'all'   => [ qw( ) ] );

my @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

my @EXPORT = qw( );

our $VERSION = '0.01';

# Preloaded methods go here.

## Private Variables ############################################################

my (%location, %borough, %type, %address, %owner);

## OO Methods ###################################################################

sub new
{
  my $class      = shift;
  my $postcode     = shift;

  return undef unless valid($postcode);

  my $self = bless \(my $dummy), $class;

  $Geo::Postcodes::postcode_of  {$self} = $postcode;
  $Geo::Postcodes::location_of  {$self} = location_of($postcode);
  # $Geo::Postcodes::borough_of {$self} = borough_of($postcode);
  # $Geo::Postcodes::county_of  {$self} = county_of($postcode);
  $Geo::Postcodes::type_of      {$self} = type_of($postcode);
  $Geo::Postcodes::owner_of     {$self} = owner_of($postcode);
  $Geo::Postcodes::address_of   {$self} = address_of($postcode);

  return $self;
}

sub DESTROY {
  my $dead_body = $_[0];

  delete $Geo::Postcodes::postcode_of  {$dead_body};
  delete $Geo::Postcodes::location_of  {$dead_body};
  # delete $Geo::Postcodes::borough_of {$dead_body};
  # delete $Geo::Postcodes::county_of  {$dead_body};
  delete $Geo::Postcodes::type_of      {$dead_body};
  delete $Geo::Postcodes::owner_of     {$dead_body};
  delete $Geo::Postcodes::address_of   {$dead_body};
}

## Global Procedures ############################################################

sub legal # Is it a legal code, i.e. something that follows the syntax rule.
{
  my $postcode = shift;
  return 0 unless defined $postcode;
  return 0 unless $postcode =~ /^\d\d\d\d$/ or $postcode =~ /^\d\d\d$/;
  return 1;
}

sub valid # Is the code in actual use.
{
  my $postcode = shift;
  return 0 unless legal($postcode);

  return 1 if exists $location{$postcode};
  return 0;
}

sub location_of
{
  my $postcode = shift;
  return unless defined $postcode;

  return $location{$postcode} if exists $location{$postcode};
  return;
}

sub type_of
{
  my $postcode = shift;
  return unless defined $postcode;
  return unless exists $type{$postcode};

  my %kat; $kat{"B"} = "Postboks";
           $kat{"P"} = "Personlig eier";
           $kat{"U"} = "Ufrankerede svarforsendelser";
           $kat{"G"} = "Gateadresse";

  my $kategorikode = $type{$postcode};

  return $kat{$kategorikode} if exists $kat{$kategorikode};
  return;
}

sub address_of
{
  my $postcode = shift;
  return unless defined $postcode;

  return $address{$postcode} if exists $address{$postcode};
  return;
}

sub owner_of
{
  my $postcode = shift;
  return unless defined $postcode;

  return $owner{$postcode} if exists $owner{$postcode};
  return;
}

## bin/mkpostalinfo begin
## This file was auto generated on Mon Jul 10 11:16:48 2006. Do NOT edit it!

$location{'0555'} = "Scanning"; $owner{'0555'} = "Data Scanning A/S, 'Læs Ind'-service";
$location{'0555'} = "Scanning"; $owner{'0555'} = "Data Scanning A/S, 'Læs Ind'-service";
$location{'0800'} = "Høje Taastrup"; $owner{'0800'} = "BG-Bank A/S"; $type{'0800'} = "P";
$location{'0877'} = "Valby"; $owner{'0877'} = "Aller Press (konkurrencer)"; $type{'0877'} = "P";
$location{'0900'} = "København C"; $owner{'0900'} = "Københavns Postcenter + erhvervskunder";
$location{'0910'} = "København C"; $type{'0910'} = "U";
$location{'0929'} = "København C"; $type{'0929'} = "U";
$location{'0999'} = "København C"; $owner{'0999'} = "DR Byen"; $type{'0999'} = "P";
$location{'1000'} = "København K"; $owner{'1000'} = "Købmagergade Postkontor"; $type{'1000'} = "P";
$location{'1001'} = "København K"; $type{'1001'} = "B";
$location{'1002'} = "København K"; $type{'1002'} = "B";
$location{'1003'} = "København K"; $type{'1003'} = "B";
$location{'1004'} = "København K"; $type{'1004'} = "B";
$location{'1005'} = "København K"; $type{'1005'} = "B";
$location{'1006'} = "København K"; $type{'1006'} = "B";
$location{'1007'} = "København K"; $type{'1007'} = "B";
$location{'1008'} = "København K"; $type{'1008'} = "B";
$location{'1009'} = "København K"; $type{'1009'} = "B";
$location{'1010'} = "København K"; $type{'1010'} = "B";
$location{'1011'} = "København K"; $type{'1011'} = "B";
$location{'1012'} = "København K"; $type{'1012'} = "B";
$location{'1013'} = "København K"; $type{'1013'} = "B";
$location{'1014'} = "København K"; $type{'1014'} = "B";
$location{'1015'} = "København K"; $type{'1015'} = "B";
$location{'1016'} = "København K"; $type{'1016'} = "B";
$location{'1017'} = "København K"; $type{'1017'} = "B";
$location{'1018'} = "København K"; $type{'1018'} = "B";
$location{'1019'} = "København K"; $type{'1019'} = "B";
$location{'1020'} = "København K"; $type{'1020'} = "B";
$location{'1021'} = "København K"; $type{'1021'} = "B";
$location{'1022'} = "København K"; $type{'1022'} = "B";
$location{'1023'} = "København K"; $type{'1023'} = "B";
$location{'1024'} = "København K"; $type{'1024'} = "B";
$location{'1025'} = "København K"; $type{'1025'} = "B";
$location{'1026'} = "København K"; $type{'1026'} = "B";
$location{'1045'} = "København K"; $type{'1045'} = "U";
$location{'1050'} = "København K"; $address{'1050'} = "Kongens Nytorv"; $type{'1050'} = "G";
$location{'1051'} = "København K"; $address{'1051'} = "Nyhavn"; $type{'1051'} = "G";
$location{'1052'} = "København K"; $address{'1052'} = "Herluf Trolles Gade"; $type{'1052'} = "G";
$location{'1053'} = "København K"; $address{'1053'} = "Cort Adelers Gade"; $type{'1053'} = "G";
$location{'1054'} = "København K"; $address{'1054'} = "Peder Skrams Gade"; $type{'1054'} = "G";
$location{'1055'} = "København K"; $address{'1055'} = "August Bournonvilles Passage"; $type{'1055'} = "G";
$location{'1055'} = "København K"; $address{'1055'} = "August Bournonvilles Passage"; $type{'1055'} = "G";
$location{'1056'} = "København K"; $address{'1056'} = "Heibergsgade"; $type{'1056'} = "G";
$location{'1057'} = "København K"; $address{'1057'} = "Holbergsgade"; $type{'1057'} = "G";
$location{'1058'} = "København K"; $address{'1058'} = "Havnegade"; $type{'1058'} = "G";
$location{'1059'} = "København K"; $address{'1059'} = "Niels Juels Gade"; $type{'1059'} = "G";
$location{'1060'} = "København K"; $address{'1060'} = "Holmens Kanal"; $type{'1060'} = "G";
$location{'1061'} = "København K"; $address{'1061'} = "Ved Stranden"; $type{'1061'} = "G";
$location{'1062'} = "København K"; $address{'1062'} = "Boldhusgade"; $type{'1062'} = "G";
$location{'1063'} = "København K"; $address{'1063'} = "Laksegade"; $type{'1063'} = "G";
$location{'1064'} = "København K"; $address{'1064'} = "Asylgade"; $type{'1064'} = "G";
$location{'1065'} = "København K"; $address{'1065'} = "Fortunstræde"; $type{'1065'} = "G";
$location{'1066'} = "København K"; $address{'1066'} = "Admiralgade"; $type{'1066'} = "G";
$location{'1067'} = "København K"; $address{'1067'} = "Nikolaj Plads"; $type{'1067'} = "G";
$location{'1068'} = "København K"; $address{'1068'} = "Nikolajgade"; $type{'1068'} = "G";
$location{'1069'} = "København K"; $address{'1069'} = "Bremerholm"; $type{'1069'} = "G";
$location{'1070'} = "København K"; $address{'1070'} = "Vingårdstræde"; $type{'1070'} = "G";
$location{'1071'} = "København K"; $address{'1071'} = "Dybensgade"; $type{'1071'} = "G";
$location{'1072'} = "København K"; $address{'1072'} = "Lille Kirkestræde"; $type{'1072'} = "G";
$location{'1073'} = "København K"; $address{'1073'} = "Store Kirkestræde"; $type{'1073'} = "G";
$location{'1074'} = "København K"; $address{'1074'} = "Lille Kongensgade"; $type{'1074'} = "G";
$location{'1092'} = "København K"; $owner{'1092'} = "Danske Bank A/S"; $type{'1092'} = "P";
$location{'1093'} = "København K"; $owner{'1093'} = "Danmarks Nationalbank"; $type{'1093'} = "P";
$location{'1095'} = "København K"; $owner{'1095'} = "Magasin du Nord"; $type{'1095'} = "P";
$location{'1098'} = "København K"; $owner{'1098'} = "A.P. Møller"; $type{'1098'} = "P";
$location{'1100'} = "København K"; $address{'1100'} = "Østergade"; $type{'1100'} = "G";
$location{'1101'} = "København K"; $address{'1101'} = "Ny Østergade"; $type{'1101'} = "G";
$location{'1102'} = "København K"; $address{'1102'} = "Pistolstræde"; $type{'1102'} = "G";
$location{'1103'} = "København K"; $address{'1103'} = "Hovedvagtsgade"; $type{'1103'} = "G";
$location{'1104'} = "København K"; $address{'1104'} = "Ny Adelgade"; $type{'1104'} = "G";
$location{'1105'} = "København K"; $address{'1105'} = "Kristen Bernikows Gade"; $type{'1105'} = "G";
$location{'1106'} = "København K"; $address{'1106'} = "Antonigade"; $type{'1106'} = "G";
$location{'1107'} = "København K"; $address{'1107'} = "Grønnegade"; $type{'1107'} = "G";
$location{'1110'} = "København K"; $address{'1110'} = "Store Regnegade"; $type{'1110'} = "G";
$location{'1111'} = "København K"; $address{'1111'} = "Christian IX's Gade"; $type{'1111'} = "G";
$location{'1112'} = "København K"; $address{'1112'} = "Pilestræde"; $type{'1112'} = "G";
$location{'1113'} = "København K"; $address{'1113'} = "Silkegade"; $type{'1113'} = "G";
$location{'1114'} = "København K"; $address{'1114'} = "Kronprinsensgade"; $type{'1114'} = "G";
$location{'1115'} = "København K"; $address{'1115'} = "Klareboderne"; $type{'1115'} = "G";
$location{'1116'} = "København K"; $address{'1116'} = "Møntergade"; $type{'1116'} = "G";
$location{'1117'} = "København K"; $address{'1117'} = "Gammel Mønt"; $type{'1117'} = "G";
$location{'1118'} = "København K"; $address{'1118'} = "Sværtegade"; $type{'1118'} = "G";
$location{'1119'} = "København K"; $address{'1119'} = "Landemærket"; $type{'1119'} = "G";
$location{'1120'} = "København K"; $address{'1120'} = "Vognmagergade"; $type{'1120'} = "G";
$location{'1121'} = "København K"; $address{'1121'} = "Lønporten"; $type{'1121'} = "G";
$location{'1122'} = "København K"; $address{'1122'} = "Sjæleboderne"; $type{'1122'} = "G";
$location{'1123'} = "København K"; $address{'1123'} = "Gothersgade"; $type{'1123'} = "G";
$location{'1124'} = "København K"; $address{'1124'} = "Åbenrå"; $type{'1124'} = "G";
$location{'1125'} = "København K"; $address{'1125'} = "Suhmsgade"; $type{'1125'} = "G";
$location{'1126'} = "København K"; $address{'1126'} = "Pustervig"; $type{'1126'} = "G";
$location{'1127'} = "København K"; $address{'1127'} = "Hauser Plads"; $type{'1127'} = "G";
$location{'1128'} = "København K"; $address{'1128'} = "Hausergade"; $type{'1128'} = "G";
$location{'1129'} = "København K"; $address{'1129'} = "Sankt Gertruds Stræde"; $type{'1129'} = "G";
$location{'1130'} = "København K"; $address{'1130'} = "Rosenborggade"; $type{'1130'} = "G";
$location{'1131'} = "København K"; $address{'1131'} = "Tornebuskegade"; $type{'1131'} = "G";
$location{'1140'} = "København K"; $owner{'1140'} = "Dagbladet Børsen"; $type{'1140'} = "P";
$location{'1147'} = "København K"; $owner{'1147'} = "Berlingske Tidende"; $type{'1147'} = "P";
$location{'1148'} = "København K"; $owner{'1148'} = "Gutenberghus"; $type{'1148'} = "P";
$location{'1150'} = "København K"; $address{'1150'} = "Købmagergade"; $type{'1150'} = "G";
$location{'1151'} = "København K"; $address{'1151'} = "Valkendorfsgade"; $type{'1151'} = "G";
$location{'1152'} = "København K"; $address{'1152'} = "Løvstræde"; $type{'1152'} = "G";
$location{'1153'} = "København K"; $address{'1153'} = "Niels Hemmingsens Gade"; $type{'1153'} = "G";
$location{'1154'} = "København K"; $address{'1154'} = "Gråbrødretorv"; $type{'1154'} = "G";
$location{'1155'} = "København K"; $address{'1155'} = "Kejsergade"; $type{'1155'} = "G";
$location{'1156'} = "København K"; $address{'1156'} = "Gråbrødrestræde"; $type{'1156'} = "G";
$location{'1157'} = "København K"; $address{'1157'} = "Klosterstræde"; $type{'1157'} = "G";
$location{'1158'} = "København K"; $address{'1158'} = "Skoubogade"; $type{'1158'} = "G";
$location{'1159'} = "København K"; $address{'1159'} = "Skindergade"; $type{'1159'} = "G";
$location{'1160'} = "København K"; $address{'1160'} = "Amagertorv"; $type{'1160'} = "G";
$location{'1161'} = "København K"; $address{'1161'} = "Vimmelskaftet"; $type{'1161'} = "G";
$location{'1162'} = "København K"; $address{'1162'} = "Jorcks Passage"; $type{'1162'} = "G";
$location{'1163'} = "København K"; $address{'1163'} = "Klostergården"; $type{'1163'} = "G";
$location{'1164'} = "København K"; $address{'1164'} = "Nygade"; $type{'1164'} = "G";
$location{'1165'} = "København K"; $address{'1165'} = "Nørregade"; $type{'1165'} = "G";
$location{'1166'} = "København K"; $address{'1166'} = "Dyrkøb"; $type{'1166'} = "G";
$location{'1167'} = "København K"; $address{'1167'} = "Bispetorvet"; $type{'1167'} = "G";
$location{'1168'} = "København K"; $address{'1168'} = "Frue Plads"; $type{'1168'} = "G";
$location{'1169'} = "København K"; $address{'1169'} = "Store Kannikestræde"; $type{'1169'} = "G";
$location{'1170'} = "København K"; $address{'1170'} = "Lille Kannikestræde"; $type{'1170'} = "G";
$location{'1171'} = "København K"; $address{'1171'} = "Fiolstræde"; $type{'1171'} = "G";
$location{'1172'} = "København K"; $address{'1172'} = "Krystalgade"; $type{'1172'} = "G";
$location{'1173'} = "København K"; $address{'1173'} = "Peder Hvitfeldts Stræde"; $type{'1173'} = "G";
$location{'1174'} = "København K"; $address{'1174'} = "Rosengården"; $type{'1174'} = "G";
$location{'1175'} = "København K"; $address{'1175'} = "Kultorvet"; $type{'1175'} = "G";
$location{'1200'} = "København K"; $address{'1200'} = "Højbro Plads"; $type{'1200'} = "G";
$location{'1201'} = "København K"; $address{'1201'} = "Læderstræde"; $type{'1201'} = "G";
$location{'1202'} = "København K"; $address{'1202'} = "Gammel Strand"; $type{'1202'} = "G";
$location{'1203'} = "København K"; $address{'1203'} = "Nybrogade"; $type{'1203'} = "G";
$location{'1204'} = "København K"; $address{'1204'} = "Magstræde"; $type{'1204'} = "G";
$location{'1205'} = "København K"; $address{'1205'} = "Snaregade"; $type{'1205'} = "G";
$location{'1206'} = "København K"; $address{'1206'} = "Naboløs"; $type{'1206'} = "G";
$location{'1207'} = "København K"; $address{'1207'} = "Hyskenstræde"; $type{'1207'} = "G";
$location{'1208'} = "København K"; $address{'1208'} = "Kompagnistræde"; $type{'1208'} = "G";
$location{'1209'} = "København K"; $address{'1209'} = "Badstuestræde"; $type{'1209'} = "G";
$location{'1210'} = "København K"; $address{'1210'} = "Knabrostræde"; $type{'1210'} = "G";
$location{'1211'} = "København K"; $address{'1211'} = "Brolæggerstræde"; $type{'1211'} = "G";
$location{'1212'} = "København K"; $address{'1212'} = "Vindebrogade"; $type{'1212'} = "G";
$location{'1213'} = "København K"; $address{'1213'} = "Bertel Thorvaldsens Plads"; $type{'1213'} = "G";
$location{'1214'} = "København K"; $address{'1214'} = "Tøjhusgade"; $type{'1214'} = "G";
$location{'1214'} = "København K"; $address{'1214'} = "Tøjhusgade"; $type{'1214'} = "G";
$location{'1215'} = "København K"; $address{'1215'} = "Børsgade"; $type{'1215'} = "G";
$location{'1216'} = "København K"; $address{'1216'} = "Slotsholmsgade"; $type{'1216'} = "G";
$location{'1217'} = "København K"; $address{'1217'} = "Børsen"; $type{'1217'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1218'} = "København K"; $address{'1218'} = "Christiansborg Slotsplads"; $type{'1218'} = "G";
$location{'1219'} = "København K"; $address{'1219'} = "Christians Brygge ulige nr. + 2-22"; $type{'1219'} = "G";
$location{'1220'} = "København K"; $address{'1220'} = "Frederiksholms Kanal"; $type{'1220'} = "G";
$location{'1240'} = "København K"; $owner{'1240'} = "Folketinget"; $type{'1240'} = "P";
$location{'1250'} = "København K"; $address{'1250'} = "Sankt Annæ Plads"; $type{'1250'} = "G";
$location{'1251'} = "København K"; $address{'1251'} = "Kvæsthusgade"; $type{'1251'} = "G";
$location{'1252'} = "København K"; $address{'1252'} = "Kvæsthusbroen"; $type{'1252'} = "G";
$location{'1253'} = "København K"; $address{'1253'} = "Toldbodgade"; $type{'1253'} = "G";
$location{'1254'} = "København K"; $address{'1254'} = "Lille Strandstræde"; $type{'1254'} = "G";
$location{'1255'} = "København K"; $address{'1255'} = "Store Strandstræde"; $type{'1255'} = "G";
$location{'1256'} = "København K"; $address{'1256'} = "Amaliegade"; $type{'1256'} = "G";
$location{'1257'} = "København K"; $address{'1257'} = "Amalienborg"; $type{'1257'} = "G";
$location{'1258'} = "København K"; $address{'1258'} = "Larsens Plads"; $type{'1258'} = "G";
$location{'1259'} = "København K"; $address{'1259'} = "Trekroner"; $type{'1259'} = "G";
$location{'1259'} = "København K"; $address{'1259'} = "Trekroner"; $type{'1259'} = "G";
$location{'1260'} = "København K"; $address{'1260'} = "Bredgade"; $type{'1260'} = "G";
$location{'1261'} = "København K"; $address{'1261'} = "Palægade"; $type{'1261'} = "G";
$location{'1263'} = "København K"; $address{'1263'} = "Churchillparken"; $type{'1263'} = "G";
$location{'1263'} = "København K"; $address{'1263'} = "Churchillparken"; $type{'1263'} = "G";
$location{'1264'} = "København K"; $address{'1264'} = "Store Kongensgade"; $type{'1264'} = "G";
$location{'1265'} = "København K"; $address{'1265'} = "Frederiksgade"; $type{'1265'} = "G";
$location{'1266'} = "København K"; $address{'1266'} = "Bornholmsgade"; $type{'1266'} = "G";
$location{'1267'} = "København K"; $address{'1267'} = "Hammerensgade"; $type{'1267'} = "G";
$location{'1268'} = "København K"; $address{'1268'} = "Jens Kofods Gade"; $type{'1268'} = "G";
$location{'1270'} = "København K"; $address{'1270'} = "Grønningen"; $type{'1270'} = "G";
$location{'1271'} = "København K"; $address{'1271'} = "Poul Ankers Gade"; $type{'1271'} = "G";
$location{'1291'} = "København K"; $owner{'1291'} = "J. Lauritzen A/S"; $type{'1291'} = "P";
$location{'1300'} = "København K"; $address{'1300'} = "Borgergade"; $type{'1300'} = "G";
$location{'1301'} = "København K"; $address{'1301'} = "Landgreven"; $type{'1301'} = "G";
$location{'1302'} = "København K"; $address{'1302'} = "Dronningens Tværgade"; $type{'1302'} = "G";
$location{'1303'} = "København K"; $address{'1303'} = "Hindegade"; $type{'1303'} = "G";
$location{'1304'} = "København K"; $address{'1304'} = "Adelgade"; $type{'1304'} = "G";
$location{'1306'} = "København K"; $address{'1306'} = "Kronprinsessegade"; $type{'1306'} = "G";
$location{'1307'} = "København K"; $address{'1307'} = "Sølvgade"; $type{'1307'} = "G";
$location{'1307'} = "København K"; $address{'1307'} = "Sølvgade"; $type{'1307'} = "G";
$location{'1308'} = "København K"; $address{'1308'} = "Klerkegade"; $type{'1308'} = "G";
$location{'1309'} = "København K"; $address{'1309'} = "Rosengade"; $type{'1309'} = "G";
$location{'1310'} = "København K"; $address{'1310'} = "Fredericiagade"; $type{'1310'} = "G";
$location{'1311'} = "København K"; $address{'1311'} = "Olfert Fischers Gade"; $type{'1311'} = "G";
$location{'1312'} = "København K"; $address{'1312'} = "Gammelvagt"; $type{'1312'} = "G";
$location{'1313'} = "København K"; $address{'1313'} = "Sankt Pauls Gade"; $type{'1313'} = "G";
$location{'1314'} = "København K"; $address{'1314'} = "Sankt Pauls Plads"; $type{'1314'} = "G";
$location{'1315'} = "København K"; $address{'1315'} = "Rævegade"; $type{'1315'} = "G";
$location{'1316'} = "København K"; $address{'1316'} = "Rigensgade"; $type{'1316'} = "G";
$location{'1317'} = "København K"; $address{'1317'} = "Stokhusgade"; $type{'1317'} = "G";
$location{'1318'} = "København K"; $address{'1318'} = "Krusemyntegade"; $type{'1318'} = "G";
$location{'1319'} = "København K"; $address{'1319'} = "Gernersgade"; $type{'1319'} = "G";
$location{'1320'} = "København K"; $address{'1320'} = "Haregade"; $type{'1320'} = "G";
$location{'1321'} = "København K"; $address{'1321'} = "Tigergade"; $type{'1321'} = "G";
$location{'1322'} = "København K"; $address{'1322'} = "Suensonsgade"; $type{'1322'} = "G";
$location{'1323'} = "København K"; $address{'1323'} = "Hjertensfrydsgade"; $type{'1323'} = "G";
$location{'1324'} = "København K"; $address{'1324'} = "Elsdyrsgade"; $type{'1324'} = "G";
$location{'1325'} = "København K"; $address{'1325'} = "Delfingade"; $type{'1325'} = "G";
$location{'1326'} = "København K"; $address{'1326'} = "Krokodillegade"; $type{'1326'} = "G";
$location{'1327'} = "København K"; $address{'1327'} = "Vildandegade"; $type{'1327'} = "G";
$location{'1328'} = "København K"; $address{'1328'} = "Svanegade"; $type{'1328'} = "G";
$location{'1329'} = "København K"; $address{'1329'} = "Timiansgade"; $type{'1329'} = "G";
$location{'1349'} = "København K"; $owner{'1349'} = "DSB"; $type{'1349'} = "P";
$location{'1350'} = "København K"; $address{'1350'} = "Øster Voldgade"; $type{'1350'} = "G";
$location{'1352'} = "København K"; $address{'1352'} = "Rørholmsgade"; $type{'1352'} = "G";
$location{'1353'} = "København K"; $address{'1353'} = "Øster Farimagsgade 1-19 + 2-2D"; $type{'1353'} = "G";
$location{'1354'} = "København K"; $address{'1354'} = "Ole Suhrs Gade"; $type{'1354'} = "G";
$location{'1355'} = "København K"; $address{'1355'} = "Gammeltoftsgade"; $type{'1355'} = "G";
$location{'1356'} = "København K"; $address{'1356'} = "Bartholinsgade"; $type{'1356'} = "G";
$location{'1357'} = "København K"; $address{'1357'} = "Øster Søgade 1 - 36"; $type{'1357'} = "G";
$location{'1358'} = "København K"; $address{'1358'} = "Nørre Voldgade"; $type{'1358'} = "G";
$location{'1359'} = "København K"; $address{'1359'} = "Ahlefeldtsgade"; $type{'1359'} = "G";
$location{'1360'} = "København K"; $address{'1360'} = "Frederiksborggade"; $type{'1360'} = "G";
$location{'1361'} = "København K"; $address{'1361'} = "Linnésgade"; $type{'1361'} = "G";
$location{'1361'} = "København K"; $address{'1361'} = "Linnésgade"; $type{'1361'} = "G";
$location{'1362'} = "København K"; $address{'1362'} = "Rømersgade"; $type{'1362'} = "G";
$location{'1363'} = "København K"; $address{'1363'} = "Vendersgade"; $type{'1363'} = "G";
$location{'1364'} = "København K"; $address{'1364'} = "Nørre Farimagsgade"; $type{'1364'} = "G";
$location{'1365'} = "København K"; $address{'1365'} = "Schacksgade"; $type{'1365'} = "G";
$location{'1366'} = "København K"; $address{'1366'} = "Nansensgade"; $type{'1366'} = "G";
$location{'1367'} = "København K"; $address{'1367'} = "Kjeld Langes Gade"; $type{'1367'} = "G";
$location{'1368'} = "København K"; $address{'1368'} = "Turesensgade"; $type{'1368'} = "G";
$location{'1369'} = "København K"; $address{'1369'} = "Gyldenløvesgade Lige nr"; $type{'1369'} = "G";
$location{'1370'} = "København K"; $address{'1370'} = "Nørre Søgade"; $type{'1370'} = "G";
$location{'1371'} = "København K"; $address{'1371'} = "Søtorvet"; $type{'1371'} = "G";
$location{'1390'} = "København K"; $owner{'1390'} = "BG-Bank"; $type{'1390'} = "P";
$location{'1400'} = "København K"; $address{'1400'} = "Knippelsbro"; $type{'1400'} = "G";
$location{'1400'} = "København K"; $address{'1400'} = "Knippelsbro"; $type{'1400'} = "G";
$location{'1401'} = "København K"; $address{'1401'} = "Strandgade"; $type{'1401'} = "G";
$location{'1402'} = "København K"; $address{'1402'} = "Hammershøi Kaj"; $type{'1402'} = "G";
$location{'1402'} = "København K"; $address{'1402'} = "Hammershøi Kaj"; $type{'1402'} = "G";
$location{'1402'} = "København K"; $address{'1402'} = "Hammershøi Kaj"; $type{'1402'} = "G";
$location{'1402'} = "København K"; $address{'1402'} = "Hammershøi Kaj"; $type{'1402'} = "G";
$location{'1402'} = "København K"; $address{'1402'} = "Hammershøi Kaj"; $type{'1402'} = "G";
$location{'1403'} = "København K"; $address{'1403'} = "Wilders Plads"; $type{'1403'} = "G";
$location{'1404'} = "København K"; $address{'1404'} = "Krøyers Plads"; $type{'1404'} = "G";
$location{'1405'} = "København K"; $address{'1405'} = "Grønlandske Handels Plads"; $type{'1405'} = "G";
$location{'1406'} = "København K"; $address{'1406'} = "Christianshavns Kanal"; $type{'1406'} = "G";
$location{'1407'} = "København K"; $address{'1407'} = "Bådsmandsstræde"; $type{'1407'} = "G";
$location{'1408'} = "København K"; $address{'1408'} = "Wildersgade"; $type{'1408'} = "G";
$location{'1409'} = "København K"; $address{'1409'} = "Knippelsbrogade"; $type{'1409'} = "G";
$location{'1410'} = "København K"; $address{'1410'} = "Christianshavns Torv"; $type{'1410'} = "G";
$location{'1411'} = "København K"; $address{'1411'} = "Applebys Plads"; $type{'1411'} = "G";
$location{'1411'} = "København K"; $address{'1411'} = "Applebys Plads"; $type{'1411'} = "G";
$location{'1412'} = "København K"; $address{'1412'} = "Voldgården"; $type{'1412'} = "G";
$location{'1413'} = "København K"; $address{'1413'} = "Ved Kanalen"; $type{'1413'} = "G";
$location{'1414'} = "København K"; $address{'1414'} = "Overgaden neden Vandet"; $type{'1414'} = "G";
$location{'1415'} = "København K"; $address{'1415'} = "Overgaden oven Vandet"; $type{'1415'} = "G";
$location{'1416'} = "København K"; $address{'1416'} = "Sankt Annæ Gade"; $type{'1416'} = "G";
$location{'1417'} = "København K"; $address{'1417'} = "Mikkel Vibes Gade"; $type{'1417'} = "G";
$location{'1418'} = "København K"; $address{'1418'} = "Sofiegade"; $type{'1418'} = "G";
$location{'1419'} = "København K"; $address{'1419'} = "Store Søndervoldstræde"; $type{'1419'} = "G";
$location{'1420'} = "København K"; $address{'1420'} = "Dronningensgade"; $type{'1420'} = "G";
$location{'1421'} = "København K"; $address{'1421'} = "Lille Søndervoldstræde"; $type{'1421'} = "G";
$location{'1422'} = "København K"; $address{'1422'} = "Prinsessegade"; $type{'1422'} = "G";
$location{'1423'} = "København K"; $address{'1423'} = "Amagergade"; $type{'1423'} = "G";
$location{'1424'} = "København K"; $address{'1424'} = "Christianshavns Voldgade"; $type{'1424'} = "G";
$location{'1425'} = "København K"; $address{'1425'} = "Ved Volden"; $type{'1425'} = "G";
$location{'1426'} = "København K"; $address{'1426'} = "Voldboligerne"; $type{'1426'} = "G";
$location{'1427'} = "København K"; $address{'1427'} = "Brobergsgade"; $type{'1427'} = "G";
$location{'1428'} = "København K"; $address{'1428'} = "Andreas Bjørns Gade"; $type{'1428'} = "G";
$location{'1429'} = "København K"; $address{'1429'} = "Burmeistersgade"; $type{'1429'} = "G";
$location{'1430'} = "København K"; $address{'1430'} = "Bodenhoffs Plads"; $type{'1430'} = "G";
$location{'1431'} = "København K"; $address{'1431'} = "Islands Plads"; $type{'1431'} = "G";
$location{'1432'} = "København K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "G";
$location{'1432'} = "København K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "G";
$location{'1432'} = "København K"; $address{'1432'} = "Margretheholmsvej"; $type{'1432'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1433'} = "København K"; $address{'1433'} = "Christiansholms Ø"; $type{'1433'} = "G";
$location{'1434'} = "København K"; $address{'1434'} = "Danneskiold-Samsøes Allé"; $type{'1434'} = "G";
$location{'1435'} = "København K"; $address{'1435'} = "Philip de Langes Allé"; $type{'1435'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1436'} = "København K"; $address{'1436'} = "Kuglegården"; $type{'1436'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1437'} = "København K"; $address{'1437'} = "Leo Mathisens Vej"; $type{'1437'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1438'} = "København K"; $address{'1438'} = "Judichærs Kvarter"; $type{'1438'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1439'} = "København K"; $address{'1439'} = "H.C. Sneedorffs Allé"; $type{'1439'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1440'} = "København K"; $address{'1440'} = "Mælkevejen"; $type{'1440'} = "G";
$location{'1441'} = "København K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "G";
$location{'1441'} = "København K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "G";
$location{'1441'} = "København K"; $address{'1441'} = "Norddyssen"; $type{'1441'} = "G";
$location{'1448'} = "København K"; $owner{'1448'} = "Udenrigsministeriet"; $type{'1448'} = "P";
$location{'1450'} = "København K"; $address{'1450'} = "Nytorv"; $type{'1450'} = "G";
$location{'1451'} = "København K"; $address{'1451'} = "Larslejsstræde"; $type{'1451'} = "G";
$location{'1452'} = "København K"; $address{'1452'} = "Teglgårdstræde"; $type{'1452'} = "G";
$location{'1453'} = "København K"; $address{'1453'} = "Sankt Peders Stræde"; $type{'1453'} = "G";
$location{'1454'} = "København K"; $address{'1454'} = "Larsbjørnsstræde"; $type{'1454'} = "G";
$location{'1455'} = "København K"; $address{'1455'} = "Studiestræde 1-49 + 2-42"; $type{'1455'} = "G";
$location{'1456'} = "København K"; $address{'1456'} = "Vestergade"; $type{'1456'} = "G";
$location{'1457'} = "København K"; $address{'1457'} = "Gammeltorv"; $type{'1457'} = "G";
$location{'1458'} = "København K"; $address{'1458'} = "Kattesundet"; $type{'1458'} = "G";
$location{'1459'} = "København K"; $address{'1459'} = "Frederiksberggade"; $type{'1459'} = "G";
$location{'1460'} = "København K"; $address{'1460'} = "Mikkel Bryggers Gade"; $type{'1460'} = "G";
$location{'1461'} = "København K"; $address{'1461'} = "Slutterigade"; $type{'1461'} = "G";
$location{'1462'} = "København K"; $address{'1462'} = "Lavendelstræde"; $type{'1462'} = "G";
$location{'1463'} = "København K"; $address{'1463'} = "Farvergade"; $type{'1463'} = "G";
$location{'1464'} = "København K"; $address{'1464'} = "Hestemøllestræde"; $type{'1464'} = "G";
$location{'1465'} = "København K"; $address{'1465'} = "Gåsegade"; $type{'1465'} = "G";
$location{'1466'} = "København K"; $address{'1466'} = "Rådhusstræde"; $type{'1466'} = "G";
$location{'1467'} = "København K"; $address{'1467'} = "Vandkunsten"; $type{'1467'} = "G";
$location{'1468'} = "København K"; $address{'1468'} = "Løngangstræde"; $type{'1468'} = "G";
$location{'1470'} = "København K"; $address{'1470'} = "Stormgade 2-16"; $type{'1470'} = "G";
$location{'1471'} = "København K"; $address{'1471'} = "Ny Vestergade"; $type{'1471'} = "G";
$location{'1472'} = "København K"; $address{'1472'} = "Ny Kongensgade,  til 17 + til 16"; $type{'1472'} = "G";
$location{'1473'} = "København K"; $address{'1473'} = "Bryghusgade"; $type{'1473'} = "G";
$location{'1500'} = "København V"; $owner{'1500'} = "Vesterbro Postkontor"; $type{'1500'} = "P";
$location{'1501'} = "København V"; $type{'1501'} = "B";
$location{'1502'} = "København V"; $type{'1502'} = "B";
$location{'1503'} = "København V"; $type{'1503'} = "B";
$location{'1504'} = "København V"; $type{'1504'} = "B";
$location{'1505'} = "København V"; $type{'1505'} = "B";
$location{'1506'} = "København V"; $type{'1506'} = "B";
$location{'1507'} = "København V"; $type{'1507'} = "B";
$location{'1508'} = "København V"; $type{'1508'} = "B";
$location{'1509'} = "København V"; $type{'1509'} = "B";
$location{'1510'} = "København V"; $type{'1510'} = "B";
$location{'1532'} = "København V"; $owner{'1532'} = "Internationalt Postcenter, returforsendelser + consignment"; $type{'1532'} = "P";
$location{'1533'} = "København V"; $owner{'1533'} = "Internationalt Postcenter"; $type{'1533'} = "P";
$location{'1550'} = "København V"; $address{'1550'} = "Bag Rådhuset"; $type{'1550'} = "G";
$location{'1550'} = "København V"; $address{'1550'} = "Bag Rådhuset"; $type{'1550'} = "G";
$location{'1551'} = "København V"; $address{'1551'} = "Jarmers Plads"; $type{'1551'} = "G";
$location{'1552'} = "København V"; $address{'1552'} = "Vester Voldgade"; $type{'1552'} = "G";
$location{'1553'} = "København V"; $address{'1553'} = "Langebro"; $type{'1553'} = "G";
$location{'1553'} = "København V"; $address{'1553'} = "Langebro"; $type{'1553'} = "G";
$location{'1554'} = "København V"; $address{'1554'} = "Studiestræde 51-69 + 46-54"; $type{'1554'} = "G";
$location{'1555'} = "København V"; $address{'1555'} = "Stormgade Ulige nr + 18-20"; $type{'1555'} = "G";
$location{'1556'} = "København V"; $address{'1556'} = "Dantes Plads"; $type{'1556'} = "G";
$location{'1557'} = "København V"; $address{'1557'} = "Ny Kongensgade, fra 18 + fra 19"; $type{'1557'} = "G";
$location{'1558'} = "København V"; $address{'1558'} = "Christiansborggade"; $type{'1558'} = "G";
$location{'1559'} = "København V"; $address{'1559'} = "Christians Brygge 24 - 30"; $type{'1559'} = "G";
$location{'1560'} = "København V"; $address{'1560'} = "Kalvebod Brygge"; $type{'1560'} = "G";
$location{'1561'} = "København V"; $address{'1561'} = "Fisketorvet"; $type{'1561'} = "G";
$location{'1561'} = "København V"; $address{'1561'} = "Fisketorvet"; $type{'1561'} = "G";
$location{'1562'} = "København V"; $address{'1562'} = "Hambrosgade"; $type{'1562'} = "G";
$location{'1563'} = "København V"; $address{'1563'} = "Otto Mønsteds Plads"; $type{'1563'} = "G";
$location{'1564'} = "København V"; $address{'1564'} = "Rysensteensgade"; $type{'1564'} = "G";
$location{'1566'} = "København V"; $owner{'1566'} = "Post Danmark A/S"; $type{'1566'} = "P";
$location{'1567'} = "København V"; $address{'1567'} = "Polititorvet"; $type{'1567'} = "G";
$location{'1568'} = "København V"; $address{'1568'} = "Mitchellsgade"; $type{'1568'} = "G";
$location{'1569'} = "København V"; $address{'1569'} = "Edvard Falcks Gade"; $type{'1569'} = "G";
$location{'1570'} = "København V"; $address{'1570'} = "Københavns Hovedbanegård"; $type{'1570'} = "G";
$location{'1570'} = "København V"; $address{'1570'} = "Københavns Hovedbanegård"; $type{'1570'} = "G";
$location{'1571'} = "København V"; $address{'1571'} = "Otto Mønsteds Gade"; $type{'1571'} = "G";
$location{'1572'} = "København V"; $address{'1572'} = "Anker Heegaards Gade"; $type{'1572'} = "G";
$location{'1573'} = "København V"; $address{'1573'} = "Puggaardsgade"; $type{'1573'} = "G";
$location{'1574'} = "København V"; $address{'1574'} = "Niels Brocks Gade"; $type{'1574'} = "G";
$location{'1575'} = "København V"; $address{'1575'} = "Ved Glyptoteket"; $type{'1575'} = "G";
$location{'1576'} = "København V"; $address{'1576'} = "Stoltenbergsgade"; $type{'1576'} = "G";
$location{'1577'} = "København V"; $address{'1577'} = "Bernstorffsgade"; $type{'1577'} = "G";
$location{'1590'} = "København V"; $owner{'1590'} = "Realkredit Danmark"; $type{'1590'} = "P";
$location{'1592'} = "København V"; $owner{'1592'} = "Københavns Socialdirektorat"; $type{'1592'} = "P";
$location{'1599'} = "København V"; $owner{'1599'} = "Københavns Rådhus"; $type{'1599'} = "P";
$location{'1600'} = "København V"; $address{'1600'} = "Gyldenløvesgade Ulige nr."; $type{'1600'} = "G";
$location{'1601'} = "København V"; $address{'1601'} = "Vester Søgade"; $type{'1601'} = "G";
$location{'1602'} = "København V"; $address{'1602'} = "Nyropsgade"; $type{'1602'} = "G";
$location{'1603'} = "København V"; $address{'1603'} = "Dahlerupsgade"; $type{'1603'} = "G";
$location{'1604'} = "København V"; $address{'1604'} = "Kampmannsgade"; $type{'1604'} = "G";
$location{'1605'} = "København V"; $address{'1605'} = "Herholdtsgade"; $type{'1605'} = "G";
$location{'1606'} = "København V"; $address{'1606'} = "Vester Farimagsgade"; $type{'1606'} = "G";
$location{'1607'} = "København V"; $address{'1607'} = "Staunings Plads"; $type{'1607'} = "G";
$location{'1608'} = "København V"; $address{'1608'} = "Jernbanegade"; $type{'1608'} = "G";
$location{'1609'} = "København V"; $address{'1609'} = "Axeltorv"; $type{'1609'} = "G";
$location{'1610'} = "København V"; $address{'1610'} = "Gammel Kongevej 1-51 + 2-10"; $type{'1610'} = "G";
$location{'1611'} = "København V"; $address{'1611'} = "Hammerichsgade"; $type{'1611'} = "G";
$location{'1612'} = "København V"; $address{'1612'} = "Ved Vesterport"; $type{'1612'} = "G";
$location{'1613'} = "København V"; $address{'1613'} = "Meldahlsgade"; $type{'1613'} = "G";
$location{'1614'} = "København V"; $address{'1614'} = "Trommesalen"; $type{'1614'} = "G";
$location{'1615'} = "København V"; $address{'1615'} = "Sankt Jørgens Allé"; $type{'1615'} = "G";
$location{'1616'} = "København V"; $address{'1616'} = "Stenosgade"; $type{'1616'} = "G";
$location{'1617'} = "København V"; $address{'1617'} = "Bagerstræde"; $type{'1617'} = "G";
$location{'1618'} = "København V"; $address{'1618'} = "Tullinsgade"; $type{'1618'} = "G";
$location{'1619'} = "København V"; $address{'1619'} = "Værnedamsvej Lige nr."; $type{'1619'} = "G";
$location{'1620'} = "København V"; $address{'1620'} = "Vesterbros Torv"; $type{'1620'} = "G";
$location{'1620'} = "København V"; $address{'1620'} = "Vesterbros Torv"; $type{'1620'} = "G";
$location{'1621'} = "København V"; $address{'1621'} = "Frederiksberg Allé 1 - 13B"; $type{'1621'} = "G";
$location{'1622'} = "København V"; $address{'1622'} = "Boyesgade Ulige nr"; $type{'1622'} = "G";
$location{'1623'} = "København V"; $address{'1623'} = "Kingosgade 1-9 + 2-6"; $type{'1623'} = "G";
$location{'1624'} = "København V"; $address{'1624'} = "Brorsonsgade"; $type{'1624'} = "G";
$location{'1630'} = "København V"; $owner{'1630'} = "Tivoli A/S"; $type{'1630'} = "P";
$location{'1631'} = "København V"; $address{'1631'} = "Herman Triers Plads"; $type{'1631'} = "G";
$location{'1632'} = "København V"; $address{'1632'} = "Julius Thomsens Gade Lige nr"; $type{'1632'} = "G";
$location{'1633'} = "København V"; $address{'1633'} = "Kleinsgade"; $type{'1633'} = "G";
$location{'1634'} = "København V"; $address{'1634'} = "Rosenørns Allé 2-18"; $type{'1634'} = "G";
$location{'1635'} = "København V"; $address{'1635'} = "Åboulevard 1-13"; $type{'1635'} = "G";
$location{'1639'} = "København V"; $owner{'1639'} = "Københavns Skatteforvaltning"; $type{'1639'} = "P";
$location{'1640'} = "København V"; $owner{'1640'} = "Københavns Folkeregister"; $type{'1640'} = "P";
$location{'1650'} = "København V"; $address{'1650'} = "Istedgade"; $type{'1650'} = "G";
$location{'1651'} = "København V"; $address{'1651'} = "Reventlowsgade"; $type{'1651'} = "G";
$location{'1652'} = "København V"; $address{'1652'} = "Colbjørnsensgade"; $type{'1652'} = "G";
$location{'1653'} = "København V"; $address{'1653'} = "Helgolandsgade"; $type{'1653'} = "G";
$location{'1654'} = "København V"; $address{'1654'} = "Abel Cathrines Gade"; $type{'1654'} = "G";
$location{'1655'} = "København V"; $address{'1655'} = "Viktoriagade"; $type{'1655'} = "G";
$location{'1656'} = "København V"; $address{'1656'} = "Gasværksvej"; $type{'1656'} = "G";
$location{'1657'} = "København V"; $address{'1657'} = "Eskildsgade"; $type{'1657'} = "G";
$location{'1658'} = "København V"; $address{'1658'} = "Absalonsgade"; $type{'1658'} = "G";
$location{'1659'} = "København V"; $address{'1659'} = "Svendsgade"; $type{'1659'} = "G";
$location{'1660'} = "København V"; $address{'1660'} = "Otto Krabbes Plads"; $type{'1660'} = "G";
$location{'1660'} = "København V"; $address{'1660'} = "Otto Krabbes Plads"; $type{'1660'} = "G";
$location{'1661'} = "København V"; $address{'1661'} = "Westend"; $type{'1661'} = "G";
$location{'1662'} = "København V"; $address{'1662'} = "Saxogade"; $type{'1662'} = "G";
$location{'1663'} = "København V"; $address{'1663'} = "Oehlenschlægersgade"; $type{'1663'} = "G";
$location{'1664'} = "København V"; $address{'1664'} = "Kaalundsgade"; $type{'1664'} = "G";
$location{'1665'} = "København V"; $address{'1665'} = "Valdemarsgade"; $type{'1665'} = "G";
$location{'1666'} = "København V"; $address{'1666'} = "Matthæusgade"; $type{'1666'} = "G";
$location{'1667'} = "København V"; $address{'1667'} = "Frederiksstadsgade"; $type{'1667'} = "G";
$location{'1668'} = "København V"; $address{'1668'} = "Mysundegade"; $type{'1668'} = "G";
$location{'1669'} = "København V"; $address{'1669'} = "Flensborggade"; $type{'1669'} = "G";
$location{'1670'} = "København V"; $address{'1670'} = "Enghave Plads"; $type{'1670'} = "G";
$location{'1671'} = "København V"; $address{'1671'} = "Haderslevgade"; $type{'1671'} = "G";
$location{'1671'} = "København V"; $address{'1671'} = "Haderslevgade"; $type{'1671'} = "G";
$location{'1672'} = "København V"; $address{'1672'} = "Broagergade"; $type{'1672'} = "G";
$location{'1673'} = "København V"; $address{'1673'} = "Ullerupgade"; $type{'1673'} = "G";
$location{'1674'} = "København V"; $address{'1674'} = "Enghavevej, til 79 + til 78"; $type{'1674'} = "G";
$location{'1675'} = "København V"; $address{'1675'} = "Kongshøjgade"; $type{'1675'} = "G";
$location{'1676'} = "København V"; $address{'1676'} = "Sankelmarksgade"; $type{'1676'} = "G";
$location{'1677'} = "København V"; $address{'1677'} = "Gråstensgade"; $type{'1677'} = "G";
$location{'1699'} = "København V"; $address{'1699'} = "Staldgade"; $type{'1699'} = "G";
$location{'1700'} = "København V"; $address{'1700'} = "Halmtorvet"; $type{'1700'} = "G";
$location{'1701'} = "København V"; $address{'1701'} = "Reverdilsgade"; $type{'1701'} = "G";
$location{'1702'} = "København V"; $address{'1702'} = "Stampesgade"; $type{'1702'} = "G";
$location{'1703'} = "København V"; $address{'1703'} = "Lille Colbjørnsensgade"; $type{'1703'} = "G";
$location{'1704'} = "København V"; $address{'1704'} = "Tietgensgade"; $type{'1704'} = "G";
$location{'1705'} = "København V"; $address{'1705'} = "Ingerslevsgade"; $type{'1705'} = "G";
$location{'1706'} = "København V"; $address{'1706'} = "Lille Istedgade"; $type{'1706'} = "G";
$location{'1707'} = "København V"; $address{'1707'} = "Maria Kirkeplads"; $type{'1707'} = "G";
$location{'1708'} = "København V"; $address{'1708'} = "Eriksgade"; $type{'1708'} = "G";
$location{'1709'} = "København V"; $address{'1709'} = "Skydebanegade"; $type{'1709'} = "G";
$location{'1710'} = "København V"; $address{'1710'} = "Kvægtorvsgade"; $type{'1710'} = "G";
$location{'1711'} = "København V"; $address{'1711'} = "Flæsketorvet"; $type{'1711'} = "G";
$location{'1712'} = "København V"; $address{'1712'} = "Høkerboderne"; $type{'1712'} = "G";
$location{'1713'} = "København V"; $address{'1713'} = "Kvægtorvet"; $type{'1713'} = "G";
$location{'1714'} = "København V"; $address{'1714'} = "Kødboderne"; $type{'1714'} = "G";
$location{'1715'} = "København V"; $address{'1715'} = "Slagtehusgade"; $type{'1715'} = "G";
$location{'1716'} = "København V"; $address{'1716'} = "Slagterboderne"; $type{'1716'} = "G";
$location{'1717'} = "København V"; $address{'1717'} = "Skelbækgade"; $type{'1717'} = "G";
$location{'1718'} = "København V"; $address{'1718'} = "Sommerstedgade"; $type{'1718'} = "G";
$location{'1719'} = "København V"; $address{'1719'} = "Krusågade"; $type{'1719'} = "G";
$location{'1720'} = "København V"; $address{'1720'} = "Sønder Boulevard"; $type{'1720'} = "G";
$location{'1721'} = "København V"; $address{'1721'} = "Dybbølsgade"; $type{'1721'} = "G";
$location{'1722'} = "København V"; $address{'1722'} = "Godsbanegade"; $type{'1722'} = "G";
$location{'1723'} = "København V"; $address{'1723'} = "Letlandsgade"; $type{'1723'} = "G";
$location{'1724'} = "København V"; $address{'1724'} = "Estlandsgade"; $type{'1724'} = "G";
$location{'1725'} = "København V"; $address{'1725'} = "Esbern Snares Gade"; $type{'1725'} = "G";
$location{'1726'} = "København V"; $address{'1726'} = "Arkonagade"; $type{'1726'} = "G";
$location{'1727'} = "København V"; $address{'1727'} = "Asger Rygs Gade"; $type{'1727'} = "G";
$location{'1728'} = "København V"; $address{'1728'} = "Skjalm Hvides Gade"; $type{'1728'} = "G";
$location{'1729'} = "København V"; $address{'1729'} = "Sigerstedgade"; $type{'1729'} = "G";
$location{'1730'} = "København V"; $address{'1730'} = "Knud Lavards Gade"; $type{'1730'} = "G";
$location{'1731'} = "København V"; $address{'1731'} = "Erik Ejegods Gade"; $type{'1731'} = "G";
$location{'1732'} = "København V"; $address{'1732'} = "Bodilsgade"; $type{'1732'} = "G";
$location{'1733'} = "København V"; $address{'1733'} = "Palnatokesgade"; $type{'1733'} = "G";
$location{'1734'} = "København V"; $address{'1734'} = "Heilsgade"; $type{'1734'} = "G";
$location{'1735'} = "København V"; $address{'1735'} = "Røddinggade"; $type{'1735'} = "G";
$location{'1736'} = "København V"; $address{'1736'} = "Bevtoftgade"; $type{'1736'} = "G";
$location{'1737'} = "København V"; $address{'1737'} = "Bustrupgade"; $type{'1737'} = "G";
$location{'1738'} = "København V"; $address{'1738'} = "Stenderupgade"; $type{'1738'} = "G";
$location{'1739'} = "København V"; $address{'1739'} = "Enghave Passage"; $type{'1739'} = "G";
$location{'1748'} = "København V"; $address{'1748'} = "Kammasvej 2"; $type{'1748'} = "G";
$location{'1749'} = "København V"; $address{'1749'} = "Rahbeks Allé 3-15"; $type{'1749'} = "G";
$location{'1750'} = "København V"; $address{'1750'} = "Vesterfælledvej"; $type{'1750'} = "G";
$location{'1751'} = "København V"; $address{'1751'} = "Sundevedsgade"; $type{'1751'} = "G";
$location{'1752'} = "København V"; $address{'1752'} = "Tøndergade"; $type{'1752'} = "G";
$location{'1753'} = "København V"; $address{'1753'} = "Ballumgade"; $type{'1753'} = "G";
$location{'1754'} = "København V"; $address{'1754'} = "Hedebygade"; $type{'1754'} = "G";
$location{'1755'} = "København V"; $address{'1755'} = "Møgeltøndergade"; $type{'1755'} = "G";
$location{'1756'} = "København V"; $address{'1756'} = "Amerikavej"; $type{'1756'} = "G";
$location{'1757'} = "København V"; $address{'1757'} = "Trøjborggade"; $type{'1757'} = "G";
$location{'1758'} = "København V"; $address{'1758'} = "Lyrskovgade"; $type{'1758'} = "G";
$location{'1759'} = "København V"; $address{'1759'} = "Rejsbygade"; $type{'1759'} = "G";
$location{'1760'} = "København V"; $address{'1760'} = "Ny Carlsberg Vej"; $type{'1760'} = "G";
$location{'1761'} = "København V"; $address{'1761'} = "Ejderstedgade"; $type{'1761'} = "G";
$location{'1762'} = "København V"; $address{'1762'} = "Slesvigsgade"; $type{'1762'} = "G";
$location{'1763'} = "København V"; $address{'1763'} = "Dannevirkegade"; $type{'1763'} = "G";
$location{'1764'} = "København V"; $address{'1764'} = "Alsgade"; $type{'1764'} = "G";
$location{'1765'} = "København V"; $address{'1765'} = "Angelgade"; $type{'1765'} = "G";
$location{'1766'} = "København V"; $address{'1766'} = "Slien"; $type{'1766'} = "G";
$location{'1770'} = "København V"; $address{'1770'} = "Carstensgade"; $type{'1770'} = "G";
$location{'1771'} = "København V"; $address{'1771'} = "Lundbyesgade"; $type{'1771'} = "G";
$location{'1772'} = "København V"; $address{'1772'} = "Ernst Meyers Gade"; $type{'1772'} = "G";
$location{'1773'} = "København V"; $address{'1773'} = "Bissensgade"; $type{'1773'} = "G";
$location{'1774'} = "København V"; $address{'1774'} = "Küchlersgade"; $type{'1774'} = "G";
$location{'1775'} = "København V"; $address{'1775'} = "Freundsgade"; $type{'1775'} = "G";
$location{'1777'} = "København V"; $address{'1777'} = "Jerichausgade"; $type{'1777'} = "G";
$location{'1778'} = "København V"; $address{'1778'} = "Pasteursvej"; $type{'1778'} = "G";
$location{'1780'} = "København V"; $owner{'1780'} = "Erhvervskunder";
$location{'1782'} = "København V"; $type{'1782'} = "U";
$location{'1784'} = "København V"; $owner{'1784'} = "Forlagsgruppen (ufrankerede svarforsendelser)"; $type{'1784'} = "P";
$location{'1785'} = "København V"; $owner{'1785'} = "Politiken og Ekstrabladet"; $type{'1785'} = "P";
$location{'1786'} = "København V"; $owner{'1786'} = "Unibank"; $type{'1786'} = "P";
$location{'1787'} = "København V"; $owner{'1787'} = "Dansk Industri"; $type{'1787'} = "P";
$location{'1788'} = "København V"; $owner{'1788'} = "Erhvervskunder";
$location{'1789'} = "København V"; $owner{'1789'} = "Star Tour A/S"; $type{'1789'} = "P";
$location{'1790'} = "København V"; $owner{'1790'} = "Erhvervskunder";
$location{'1795'} = "København V"; $owner{'1795'} = "Bogklubforlag"; $type{'1795'} = "P";
$location{'1799'} = "København V"; $owner{'1799'} = "Carlsberg"; $type{'1799'} = "P";
$location{'1800'} = "Frederiksberg C"; $address{'1800'} = "Vesterbrogade, fra 152 og 153"; $type{'1800'} = "G";
$location{'1801'} = "Frederiksberg C"; $address{'1801'} = "Rahbeks Allé 2-36 + 17-23"; $type{'1801'} = "G";
$location{'1802'} = "Frederiksberg C"; $address{'1802'} = "Halls Allé"; $type{'1802'} = "G";
$location{'1803'} = "Frederiksberg C"; $address{'1803'} = "Brøndsteds Allé"; $type{'1803'} = "G";
$location{'1804'} = "Frederiksberg C"; $address{'1804'} = "Bakkegårds Allé"; $type{'1804'} = "G";
$location{'1805'} = "Frederiksberg C"; $address{'1805'} = "Kammasvej 1-3 + 4"; $type{'1805'} = "G";
$location{'1806'} = "Frederiksberg C"; $address{'1806'} = "Jacobys Allé"; $type{'1806'} = "G";
$location{'1807'} = "Frederiksberg C"; $address{'1807'} = "Schlegels Allé"; $type{'1807'} = "G";
$location{'1808'} = "Frederiksberg C"; $address{'1808'} = "Asmussens Allé"; $type{'1808'} = "G";
$location{'1809'} = "Frederiksberg C"; $address{'1809'} = "Frydendalsvej"; $type{'1809'} = "G";
$location{'1810'} = "Frederiksberg C"; $address{'1810'} = "Platanvej"; $type{'1810'} = "G";
$location{'1811'} = "Frederiksberg C"; $address{'1811'} = "Asgårdsvej"; $type{'1811'} = "G";
$location{'1812'} = "Frederiksberg C"; $address{'1812'} = "Kochsvej"; $type{'1812'} = "G";
$location{'1813'} = "Frederiksberg C"; $address{'1813'} = "Henrik Ibsens Vej"; $type{'1813'} = "G";
$location{'1814'} = "Frederiksberg C"; $address{'1814'} = "Carit Etlars Vej"; $type{'1814'} = "G";
$location{'1815'} = "Frederiksberg C"; $address{'1815'} = "Paludan Müllers Vej"; $type{'1815'} = "G";
$location{'1816'} = "Frederiksberg C"; $address{'1816'} = "Engtoftevej"; $type{'1816'} = "G";
$location{'1817'} = "Frederiksberg C"; $address{'1817'} = "Carl Bernhards Vej"; $type{'1817'} = "G";
$location{'1818'} = "Frederiksberg C"; $address{'1818'} = "Kingosgade 8-12 + 11-17"; $type{'1818'} = "G";
$location{'1819'} = "Frederiksberg C"; $address{'1819'} = "Værnedamsvej Ulige nr."; $type{'1819'} = "G";
$location{'1820'} = "Frederiksberg C"; $address{'1820'} = "Frederiksberg Allé 15-65 + 2-104"; $type{'1820'} = "G";
$location{'1822'} = "Frederiksberg C"; $address{'1822'} = "Boyesgade Lige nr"; $type{'1822'} = "G";
$location{'1823'} = "Frederiksberg C"; $address{'1823'} = "Haveselskabetsvej"; $type{'1823'} = "G";
$location{'1824'} = "Frederiksberg C"; $address{'1824'} = "Sankt Thomas Allé"; $type{'1824'} = "G";
$location{'1825'} = "Frederiksberg C"; $address{'1825'} = "Hauchsvej"; $type{'1825'} = "G";
$location{'1826'} = "Frederiksberg C"; $address{'1826'} = "Alhambravej"; $type{'1826'} = "G";
$location{'1827'} = "Frederiksberg C"; $address{'1827'} = "Mynstersvej"; $type{'1827'} = "G";
$location{'1828'} = "Frederiksberg C"; $address{'1828'} = "Martensens Allé"; $type{'1828'} = "G";
$location{'1829'} = "Frederiksberg C"; $address{'1829'} = "Madvigs Allé"; $type{'1829'} = "G";
$location{'1835'} = "Frederiksberg C"; $owner{'1835'} = "inkl. Frederiksberg C Postkontor"; $type{'1835'} = "B";
$location{'1850'} = "Frederiksberg C"; $address{'1850'} = "Gammel Kongevej 85-179 + 60-178"; $type{'1850'} = "G";
$location{'1851'} = "Frederiksberg C"; $address{'1851'} = "Nyvej"; $type{'1851'} = "G";
$location{'1852'} = "Frederiksberg C"; $address{'1852'} = "Amicisvej"; $type{'1852'} = "G";
$location{'1853'} = "Frederiksberg C"; $address{'1853'} = "Maglekildevej"; $type{'1853'} = "G";
$location{'1854'} = "Frederiksberg C"; $address{'1854'} = "Dr. Priemes Vej"; $type{'1854'} = "G";
$location{'1855'} = "Frederiksberg C"; $address{'1855'} = "Hollændervej"; $type{'1855'} = "G";
$location{'1856'} = "Frederiksberg C"; $address{'1856'} = "Edisonsvej"; $type{'1856'} = "G";
$location{'1857'} = "Frederiksberg C"; $address{'1857'} = "Hortensiavej"; $type{'1857'} = "G";
$location{'1860'} = "Frederiksberg C"; $address{'1860'} = "Christian Winthers Vej"; $type{'1860'} = "G";
$location{'1861'} = "Frederiksberg C"; $address{'1861'} = "Sagasvej"; $type{'1861'} = "G";
$location{'1862'} = "Frederiksberg C"; $address{'1862'} = "Rathsacksvej"; $type{'1862'} = "G";
$location{'1863'} = "Frederiksberg C"; $address{'1863'} = "Ceresvej"; $type{'1863'} = "G";
$location{'1864'} = "Frederiksberg C"; $address{'1864'} = "Grundtvigsvej"; $type{'1864'} = "G";
$location{'1865'} = "Frederiksberg C"; $address{'1865'} = "Grundtvigs Sidevej"; $type{'1865'} = "G";
$location{'1866'} = "Frederiksberg C"; $address{'1866'} = "Henrik Steffens Vej"; $type{'1866'} = "G";
$location{'1867'} = "Frederiksberg C"; $address{'1867'} = "Acaciavej"; $type{'1867'} = "G";
$location{'1868'} = "Frederiksberg C"; $address{'1868'} = "Bianco Lunos Allé"; $type{'1868'} = "G";
$location{'1870'} = "Frederiksberg C"; $address{'1870'} = "Bülowsvej"; $type{'1870'} = "G";
$location{'1871'} = "Frederiksberg C"; $address{'1871'} = "Thorvaldsensvej"; $type{'1871'} = "G";
$location{'1872'} = "Frederiksberg C"; $address{'1872'} = "Bomhoffs Have"; $type{'1872'} = "G";
$location{'1873'} = "Frederiksberg C"; $address{'1873'} = "Helenevej"; $type{'1873'} = "G";
$location{'1874'} = "Frederiksberg C"; $address{'1874'} = "Harsdorffsvej"; $type{'1874'} = "G";
$location{'1875'} = "Frederiksberg C"; $address{'1875'} = "Amalievej"; $type{'1875'} = "G";
$location{'1876'} = "Frederiksberg C"; $address{'1876'} = "Kastanievej"; $type{'1876'} = "G";
$location{'1877'} = "Frederiksberg C"; $address{'1877'} = "Lindevej"; $type{'1877'} = "G";
$location{'1878'} = "Frederiksberg C"; $address{'1878'} = "Uraniavej"; $type{'1878'} = "G";
$location{'1879'} = "Frederiksberg C"; $address{'1879'} = "H.C. Ørsteds Vej"; $type{'1879'} = "G";
$location{'1900'} = "Frederiksberg C"; $address{'1900'} = "Vodroffsvej"; $type{'1900'} = "G";
$location{'1901'} = "Frederiksberg C"; $address{'1901'} = "Tårnborgvej"; $type{'1901'} = "G";
$location{'1902'} = "Frederiksberg C"; $address{'1902'} = "Lykkesholms Allé"; $type{'1902'} = "G";
$location{'1903'} = "Frederiksberg C"; $address{'1903'} = "Sankt Knuds Vej"; $type{'1903'} = "G";
$location{'1904'} = "Frederiksberg C"; $address{'1904'} = "Forhåbningsholms Allé"; $type{'1904'} = "G";
$location{'1905'} = "Frederiksberg C"; $address{'1905'} = "Svanholmsvej"; $type{'1905'} = "G";
$location{'1906'} = "Frederiksberg C"; $address{'1906'} = "Schønbergsgade"; $type{'1906'} = "G";
$location{'1908'} = "Frederiksberg C"; $address{'1908'} = "Prinsesse Maries Allé"; $type{'1908'} = "G";
$location{'1909'} = "Frederiksberg C"; $address{'1909'} = "Vodroffs Tværgade"; $type{'1909'} = "G";
$location{'1910'} = "Frederiksberg C"; $address{'1910'} = "Danasvej"; $type{'1910'} = "G";
$location{'1911'} = "Frederiksberg C"; $address{'1911'} = "Niels Ebbesens Vej"; $type{'1911'} = "G";
$location{'1912'} = "Frederiksberg C"; $address{'1912'} = "Svend Trøsts Vej"; $type{'1912'} = "G";
$location{'1913'} = "Frederiksberg C"; $address{'1913'} = "Carl Plougs Vej"; $type{'1913'} = "G";
$location{'1914'} = "Frederiksberg C"; $address{'1914'} = "Vodroffslund"; $type{'1914'} = "G";
$location{'1915'} = "Frederiksberg C"; $address{'1915'} = "Danas Plads"; $type{'1915'} = "G";
$location{'1916'} = "Frederiksberg C"; $address{'1916'} = "Norsvej"; $type{'1916'} = "G";
$location{'1917'} = "Frederiksberg C"; $address{'1917'} = "Sveasvej"; $type{'1917'} = "G";
$location{'1920'} = "Frederiksberg C"; $address{'1920'} = "Forchhammersvej"; $type{'1920'} = "G";
$location{'1921'} = "Frederiksberg C"; $address{'1921'} = "Sankt Markus Plads"; $type{'1921'} = "G";
$location{'1922'} = "Frederiksberg C"; $address{'1922'} = "Sankt Markus Allé"; $type{'1922'} = "G";
$location{'1923'} = "Frederiksberg C"; $address{'1923'} = "Johnstrups Allé"; $type{'1923'} = "G";
$location{'1924'} = "Frederiksberg C"; $address{'1924'} = "Steenstrups Allé"; $type{'1924'} = "G";
$location{'1925'} = "Frederiksberg C"; $address{'1925'} = "Julius Thomsens Plads"; $type{'1925'} = "G";
$location{'1926'} = "Frederiksberg C"; $address{'1926'} = "Martinsvej"; $type{'1926'} = "G";
$location{'1927'} = "Frederiksberg C"; $address{'1927'} = "Suomisvej"; $type{'1927'} = "G";
$location{'1928'} = "Frederiksberg C"; $address{'1928'} = "Filippavej"; $type{'1928'} = "G";
$location{'1931'} = "Frederiksberg C"; $type{'1931'} = "U";
$location{'1950'} = "Frederiksberg C"; $address{'1950'} = "Hostrupsvej"; $type{'1950'} = "G";
$location{'1951'} = "Frederiksberg C"; $address{'1951'} = "Christian Richardts Vej"; $type{'1951'} = "G";
$location{'1952'} = "Frederiksberg C"; $address{'1952'} = "Falkonervænget"; $type{'1952'} = "G";
$location{'1953'} = "Frederiksberg C"; $address{'1953'} = "Sankt Nikolaj Vej"; $type{'1953'} = "G";
$location{'1954'} = "Frederiksberg C"; $address{'1954'} = "Hostrups Have"; $type{'1954'} = "G";
$location{'1955'} = "Frederiksberg C"; $address{'1955'} = "Dr. Abildgaards Allé"; $type{'1955'} = "G";
$location{'1956'} = "Frederiksberg C"; $address{'1956'} = "L.I. Brandes Allé"; $type{'1956'} = "G";
$location{'1957'} = "Frederiksberg C"; $address{'1957'} = "N.J. Fjords Allé"; $type{'1957'} = "G";
$location{'1958'} = "Frederiksberg C"; $address{'1958'} = "Rolighedsvej"; $type{'1958'} = "G";
$location{'1959'} = "Frederiksberg C"; $address{'1959'} = "Falkonergårdsvej"; $type{'1959'} = "G";
$location{'1960'} = "Frederiksberg C"; $address{'1960'} = "Åboulevard 15-55"; $type{'1960'} = "G";
$location{'1961'} = "Frederiksberg C"; $address{'1961'} = "J.M. Thieles Vej"; $type{'1961'} = "G";
$location{'1962'} = "Frederiksberg C"; $address{'1962'} = "Fuglevangsvej"; $type{'1962'} = "G";
$location{'1963'} = "Frederiksberg C"; $address{'1963'} = "Bille Brahes Vej"; $type{'1963'} = "G";
$location{'1964'} = "Frederiksberg C"; $address{'1964'} = "Ingemannsvej"; $type{'1964'} = "G";
$location{'1965'} = "Frederiksberg C"; $address{'1965'} = "Erik Menveds Vej"; $type{'1965'} = "G";
$location{'1966'} = "Frederiksberg C"; $address{'1966'} = "Steenwinkelsvej"; $type{'1966'} = "G";
$location{'1967'} = "Frederiksberg C"; $address{'1967'} = "Svanemosegårdsvej"; $type{'1967'} = "G";
$location{'1970'} = "Frederiksberg C"; $address{'1970'} = "Rosenørns Allé 1-65 + 20-70"; $type{'1970'} = "G";
$location{'1971'} = "Frederiksberg C"; $address{'1971'} = "Adolph Steens Allé"; $type{'1971'} = "G";
$location{'1972'} = "Frederiksberg C"; $address{'1972'} = "Worsaaesvej"; $type{'1972'} = "G";
$location{'1973'} = "Frederiksberg C"; $address{'1973'} = "Jakob Dannefærds Vej"; $type{'1973'} = "G";
$location{'1974'} = "Frederiksberg C"; $address{'1974'} = "Julius Thomsens Gade Ulige nr"; $type{'1974'} = "G";
$location{'1999'} = "Frederiksberg C"; $owner{'1999'} = "Danmarks Radio"; $type{'1999'} = "P";
$location{'2000'} = "Frederiksberg";
$location{'2100'} = "København Ø";
$location{'2200'} = "København N";
$location{'2300'} = "København S";
$location{'2400'} = "København NV";
$location{'2450'} = "København SV";
$location{'2500'} = "Valby";
$location{'2600'} = "Glostrup";
$location{'2605'} = "Brøndby";
$location{'2610'} = "Rødovre";
$location{'2620'} = "Albertslund";
$location{'2625'} = "Vallensbæk";
$location{'2630'} = "Taastrup";
$location{'2633'} = "Taastrup"; $owner{'2633'} = "Erhvervskunder";
$location{'2635'} = "Ishøj";
$location{'2640'} = "Hedehusene";
$location{'2650'} = "Hvidovre";
$location{'2660'} = "Brøndby Strand";
$location{'2665'} = "Vallensbæk Strand";
$location{'2670'} = "Greve";
$location{'2680'} = "Solrød Strand";
$location{'2690'} = "Karlslunde";
$location{'2700'} = "Brønshøj";
$location{'2720'} = "Vanløse";
$location{'2730'} = "Herlev";
$location{'2740'} = "Skovlunde";
$location{'2750'} = "Ballerup";
$location{'2760'} = "Måløv";
$location{'2765'} = "Smørum";
$location{'2770'} = "Kastrup";
$location{'2791'} = "Dragør";
$location{'2800'} = "Kongens Lyngby";
$location{'2820'} = "Gentofte";
$location{'2830'} = "Virum";
$location{'2840'} = "Holte";
$location{'2850'} = "Nærum";
$location{'2860'} = "Søborg";
$location{'2870'} = "Dyssegård ";
$location{'2880'} = "Bagsværd";
$location{'2900'} = "Hellerup";
$location{'2920'} = "Charlottenlund";
$location{'2930'} = "Klampenborg";
$location{'2942'} = "Skodsborg";
$location{'2950'} = "Vedbæk";
$location{'2960'} = "Rungsted Kyst";
$location{'2970'} = "Hørsholm";
$location{'2980'} = "Kokkedal";
$location{'2990'} = "Nivå";
$location{'3000'} = "Helsingør";
$location{'3050'} = "Humlebæk";
$location{'3060'} = "Espergærde";
$location{'3070'} = "Snekkersten";
$location{'3080'} = "Tikøb";
$location{'3100'} = "Hornbæk";
$location{'3120'} = "Dronningmølle";
$location{'3140'} = "Ålsgårde";
$location{'3150'} = "Hellebæk";
$location{'3200'} = "Helsinge";
$location{'3210'} = "Vejby";
$location{'3220'} = "Tisvildeleje";
$location{'3230'} = "Græsted";
$location{'3250'} = "Gilleleje";
$location{'3300'} = "Frederiksværk";
$location{'3310'} = "Ølsted";
$location{'3320'} = "Skævinge";
$location{'3330'} = "Gørløse";
$location{'3360'} = "Liseleje";
$location{'3370'} = "Melby";
$location{'3390'} = "Hundested";
$location{'3400'} = "Hillerød";
$location{'3450'} = "Allerød";
$location{'3460'} = "Birkerød";
$location{'3480'} = "Fredensborg";
$location{'3490'} = "Kvistgård";
$location{'3500'} = "Værløse";
$location{'3520'} = "Farum";
$location{'3540'} = "Lynge";
$location{'3550'} = "Slangerup";
$location{'3600'} = "Frederikssund";
$location{'3630'} = "Jægerspris";
$location{'3650'} = "Ølstykke";
$location{'3660'} = "Stenløse";
$location{'3670'} = "Veksø Sjælland";
$location{'3700'} = "Rønne";
$location{'3720'} = "Aakirkeby";
$location{'3730'} = "Nexø";
$location{'3740'} = "Svaneke";
$location{'3751'} = "Østermarie";
$location{'3760'} = "Gudhjem";
$location{'3770'} = "Allinge";
$location{'3782'} = "Klemensker";
$location{'3790'} = "Hasle";
$location{'4000'} = "Roskilde";
$location{'4040'} = "Jyllinge";
$location{'4050'} = "Skibby";
$location{'4060'} = "Kirke Såby";
$location{'4070'} = "Kirke Hyllinge";
$location{'4100'} = "Ringsted";
$location{'4105'} = "Ringsted"; $owner{'4105'} = "Midtsjællands Postcenter + erhvervskunder";
$location{'4129'} = "Ringsted"; $type{'4129'} = "U";
$location{'4130'} = "Viby Sjælland";
$location{'4140'} = "Borup";
$location{'4160'} = "Herlufmagle";
$location{'4171'} = "Glumsø";
$location{'4173'} = "Fjenneslev";
$location{'4174'} = "Jystrup Midtsj";
$location{'4180'} = "Sorø";
$location{'4190'} = "Munke Bjergby";
$location{'4200'} = "Slagelse";
$location{'4220'} = "Korsør";
$location{'4230'} = "Skælskør";
$location{'4241'} = "Vemmelev";
$location{'4242'} = "Boeslunde";
$location{'4243'} = "Rude";
$location{'4250'} = "Fuglebjerg";
$location{'4261'} = "Dalmose";
$location{'4262'} = "Sandved";
$location{'4270'} = "Høng";
$location{'4281'} = "Gørlev";
$location{'4291'} = "Ruds Vedby";
$location{'4293'} = "Dianalund";
$location{'4295'} = "Stenlille";
$location{'4296'} = "Nyrup";
$location{'4300'} = "Holbæk";
$location{'4320'} = "Lejre";
$location{'4330'} = "Hvalsø";
$location{'4340'} = "Tølløse";
$location{'4350'} = "Ugerløse";
$location{'4360'} = "Kirke Eskilstrup";
$location{'4370'} = "Store Merløse";
$location{'4390'} = "Vipperød";
$location{'4400'} = "Kalundborg";
$location{'4420'} = "Regstrup";
$location{'4440'} = "Mørkøv";
$location{'4450'} = "Jyderup";
$location{'4460'} = "Snertinge";
$location{'4470'} = "Svebølle";
$location{'4480'} = "Store Fuglede";
$location{'4490'} = "Jerslev Sjælland";
$location{'4500'} = "Nykøbing Sj";
$location{'4520'} = "Svinninge";
$location{'4532'} = "Gislinge";
$location{'4534'} = "Hørve";
$location{'4540'} = "Fårevejle";
$location{'4550'} = "Asnæs";
$location{'4560'} = "Vig";
$location{'4571'} = "Grevinge";
$location{'4572'} = "Nørre Asmindrup";
$location{'4573'} = "Højby";
$location{'4581'} = "Rørvig";
$location{'4583'} = "Sjællands Odde";
$location{'4591'} = "Føllenslev";
$location{'4592'} = "Sejerø";
$location{'4593'} = "Eskebjerg";
$location{'4600'} = "Køge";
$location{'4621'} = "Gadstrup";
$location{'4622'} = "Havdrup";
$location{'4623'} = "Lille Skensved";
$location{'4632'} = "Bjæverskov";
$location{'4640'} = "Fakse";
$location{'4652'} = "Hårlev";
$location{'4653'} = "Karise";
$location{'4654'} = "Fakse Ladeplads";
$location{'4660'} = "Store Heddinge";
$location{'4671'} = "Strøby";
$location{'4672'} = "Klippinge";
$location{'4673'} = "Rødvig Stevns";
$location{'4681'} = "Herfølge";
$location{'4682'} = "Tureby";
$location{'4683'} = "Rønnede";
$location{'4684'} = "Holmegaard ";
$location{'4690'} = "Haslev";
$location{'4700'} = "Næstved";
$location{'4720'} = "Præstø";
$location{'4733'} = "Tappernøje";
$location{'4735'} = "Mern";
$location{'4736'} = "Karrebæksminde";
$location{'4750'} = "Lundby";
$location{'4760'} = "Vordingborg";
$location{'4771'} = "Kalvehave";
$location{'4772'} = "Langebæk";
$location{'4773'} = "Stensved";
$location{'4780'} = "Stege";
$location{'4791'} = "Borre";
$location{'4792'} = "Askeby";
$location{'4793'} = "Bogø By";
$location{'4800'} = "Nykøbing F";
$location{'4840'} = "Nørre Alslev";
$location{'4850'} = "Stubbekøbing";
$location{'4862'} = "Guldborg";
$location{'4863'} = "Eskilstrup";
$location{'4871'} = "Horbelev";
$location{'4872'} = "Idestrup";
$location{'4873'} = "Væggerløse";
$location{'4874'} = "Gedser";
$location{'4880'} = "Nysted";
$location{'4891'} = "Toreby L";
$location{'4892'} = "Kettinge";
$location{'4894'} = "Øster Ulslev";
$location{'4895'} = "Errindlev";
$location{'4900'} = "Nakskov";
$location{'4912'} = "Harpelunde";
$location{'4913'} = "Horslunde";
$location{'4920'} = "Søllested";
$location{'4930'} = "Maribo";
$location{'4941'} = "Bandholm";
$location{'4943'} = "Torrig L";
$location{'4944'} = "Fejø";
$location{'4951'} = "Nørreballe";
$location{'4952'} = "Stokkemarke";
$location{'4953'} = "Vesterborg";
$location{'4960'} = "Holeby";
$location{'4970'} = "Rødby";
$location{'4983'} = "Dannemare";
$location{'4990'} = "Sakskøbing";
$location{'5000'} = "Odense C";
$location{'5029'} = "Odense C"; $type{'5029'} = "U";
$location{'5090'} = "Odense C"; $owner{'5090'} = "Erhvervskunder";
$location{'5100'} = "Odense C"; $type{'5100'} = "B";
$location{'5200'} = "Odense V";
$location{'5210'} = "Odense NV";
$location{'5220'} = "Odense SØ";
$location{'5230'} = "Odense M";
$location{'5240'} = "Odense NØ";
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
$location{'5471'} = "Søndersø";
$location{'5474'} = "Veflinge";
$location{'5485'} = "Skamby";
$location{'5491'} = "Blommenslyst";
$location{'5492'} = "Vissenbjerg";
$location{'5500'} = "Middelfart";
$location{'5540'} = "Ullerslev";
$location{'5550'} = "Langeskov";
$location{'5560'} = "Aarup";
$location{'5580'} = "Nørre Aaby";
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
$location{'5772'} = "Kværndrup";
$location{'5792'} = "Årslev";
$location{'5800'} = "Nyborg";
$location{'5853'} = "Ørbæk";
$location{'5854'} = "Gislev";
$location{'5856'} = "Ryslinge";
$location{'5863'} = "Ferritslev Fyn";
$location{'5871'} = "Frørup";
$location{'5874'} = "Hesselager";
$location{'5881'} = "Skårup Fyn";
$location{'5882'} = "Vejstrup";
$location{'5883'} = "Oure";
$location{'5884'} = "Gudme";
$location{'5892'} = "Gudbjerg Sydfyn";
$location{'5900'} = "Rudkøbing";
$location{'5932'} = "Humble";
$location{'5935'} = "Bagenkop";
$location{'5953'} = "Tranekær";
$location{'5960'} = "Marstal";
$location{'5970'} = "Ærøskøbing";
$location{'5985'} = "Søby Ærø";
$location{'6000'} = "Kolding";
$location{'6040'} = "Egtved";
$location{'6051'} = "Almind";
$location{'6052'} = "Viuf";
$location{'6064'} = "Jordrup";
$location{'6070'} = "Christiansfeld";
$location{'6091'} = "Bjert";
$location{'6092'} = "Sønder Stenderup";
$location{'6093'} = "Sjølund";
$location{'6094'} = "Hejls";
$location{'6100'} = "Haderslev";
$location{'6200'} = "Aabenraa";
$location{'6230'} = "Rødekro";
$location{'6240'} = "Løgumkloster";
$location{'6261'} = "Bredebro";
$location{'6270'} = "Tønder";
$location{'6280'} = "Højer";
$location{'6300'} = "Gråsten";
$location{'6310'} = "Broager";
$location{'6320'} = "Egernsund";
$location{'6330'} = "Padborg";
$location{'6340'} = "Kruså";
$location{'6360'} = "Tinglev";
$location{'6372'} = "Bylderup-Bov";
$location{'6392'} = "Bolderslev";
$location{'6400'} = "Sønderborg";
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
$location{'6622'} = "Bække";
$location{'6623'} = "Vorbasse";
$location{'6630'} = "Rødding";
$location{'6640'} = "Lunderskov";
$location{'6650'} = "Brørup";
$location{'6660'} = "Lintrup";
$location{'6670'} = "Holsted";
$location{'6682'} = "Hovborg";
$location{'6683'} = "Føvling";
$location{'6690'} = "Gørding";
$location{'6700'} = "Esbjerg";
$location{'6701'} = "Esbjerg"; $type{'6701'} = "B";
$location{'6705'} = "Esbjerg Ø";
$location{'6710'} = "Esbjerg V";
$location{'6715'} = "Esbjerg N";
$location{'6720'} = "Fanø";
$location{'6731'} = "Tjæreborg";
$location{'6740'} = "Bramming";
$location{'6752'} = "Glejbjerg";
$location{'6753'} = "Agerbæk";
$location{'6760'} = "Ribe";
$location{'6771'} = "Gredstedbro";
$location{'6780'} = "Skærbæk";
$location{'6792'} = "Rømø";
$location{'6800'} = "Varde";
$location{'6818'} = "Årre";
$location{'6823'} = "Ansager";
$location{'6830'} = "Nørre Nebel";
$location{'6840'} = "Oksbøl";
$location{'6851'} = "Janderup Vestj";
$location{'6852'} = "Billum";
$location{'6853'} = "Vejers Strand";
$location{'6854'} = "Henne";
$location{'6855'} = "Outrup";
$location{'6857'} = "Blåvand";
$location{'6862'} = "Tistrup";
$location{'6870'} = "Ølgod";
$location{'6880'} = "Tarm";
$location{'6893'} = "Hemmet";
$location{'6900'} = "Skjern";
$location{'6920'} = "Videbæk";
$location{'6933'} = "Kibæk";
$location{'6940'} = "Lem St";
$location{'6950'} = "Ringkøbing";
$location{'6960'} = "Hvide Sande";
$location{'6971'} = "Spjald";
$location{'6973'} = "Ørnhøj";
$location{'6980'} = "Tim";
$location{'6990'} = "Ulfborg";
$location{'7000'} = "Fredericia";
$location{'7007'} = "Fredericia"; $owner{'7007'} = "Sydjyllands Postcenter + erhvervskunder";
$location{'7029'} = "Fredericia"; $type{'7029'} = "U";
$location{'7080'} = "Børkop";
$location{'7100'} = "Vejle";
$location{'7120'} = "Vejle Øst";
$location{'7130'} = "Juelsminde";
$location{'7140'} = "Stouby";
$location{'7150'} = "Barrit";
$location{'7160'} = "Tørring";
$location{'7171'} = "Uldum";
$location{'7173'} = "Vonge";
$location{'7182'} = "Bredsten";
$location{'7183'} = "Randbøl";
$location{'7184'} = "Vandel";
$location{'7190'} = "Billund";
$location{'7200'} = "Grindsted";
$location{'7250'} = "Hejnsvig";
$location{'7260'} = "Sønder Omme";
$location{'7270'} = "Stakroge";
$location{'7280'} = "Sønder Felding";
$location{'7300'} = "Jelling";
$location{'7321'} = "Gadbjerg";
$location{'7323'} = "Give";
$location{'7330'} = "Brande";
$location{'7361'} = "Ejstrupholm";
$location{'7362'} = "Hampen";
$location{'7400'} = "Herning";
$location{'7401'} = "Herning"; $owner{'7401'} = "Erhvervskunder";
$location{'7429'} = "Herning"; $type{'7429'} = "U";
$location{'7430'} = "Ikast";
$location{'7441'} = "Bording";
$location{'7442'} = "Engesvang";
$location{'7451'} = "Sunds";
$location{'7470'} = "Karup J";
$location{'7480'} = "Vildbjerg";
$location{'7490'} = "Aulum";
$location{'7500'} = "Holstebro";
$location{'7540'} = "Haderup";
$location{'7550'} = "Sørvad";
$location{'7560'} = "Hjerm";
$location{'7570'} = "Vemb";
$location{'7600'} = "Struer";
$location{'7620'} = "Lemvig";
$location{'7650'} = "Bøvlingbjerg";
$location{'7660'} = "Bækmarksbro";
$location{'7673'} = "Harboøre";
$location{'7680'} = "Thyborøn";
$location{'7700'} = "Thisted";
$location{'7730'} = "Hanstholm";
$location{'7741'} = "Frøstrup";
$location{'7742'} = "Vesløs";
$location{'7752'} = "Snedsted";
$location{'7755'} = "Bedsted Thy";
$location{'7760'} = "Hurup Thy";
$location{'7770'} = "Vestervig";
$location{'7790'} = "Thyholm";
$location{'7800'} = "Skive";
$location{'7830'} = "Vinderup";
$location{'7840'} = "Højslev";
$location{'7850'} = "Stoholm Jyll";
$location{'7860'} = "Spøttrup";
$location{'7870'} = "Roslev";
$location{'7884'} = "Fur";
$location{'7900'} = "Nykøbing M";
$location{'7950'} = "Erslev";
$location{'7960'} = "Karby";
$location{'7970'} = "Redsted M";
$location{'7980'} = "Vils";
$location{'7990'} = "Øster Assels";
$location{'8000'} = "Århus C";
$location{'8100'} = "Århus C"; $type{'8100'} = "B";
$location{'8200'} = "Århus N";
$location{'8210'} = "Århus V";
$location{'8220'} = "Brabrand";
$location{'8229'} = "Risskov Ø"; $type{'8229'} = "U";
$location{'8230'} = "Åbyhøj";
$location{'8240'} = "Risskov";
$location{'8245'} = "Risskov Ø"; $owner{'8245'} = "Østjyllands Postcenter + erhvervskunder";
$location{'8250'} = "Egå";
$location{'8260'} = "Viby J";
$location{'8270'} = "Højbjerg";
$location{'8300'} = "Odder";
$location{'8305'} = "Samsø";
$location{'8310'} = "Tranbjerg J";
$location{'8320'} = "Mårslet";
$location{'8330'} = "Beder";
$location{'8340'} = "Malling";
$location{'8350'} = "Hundslund";
$location{'8355'} = "Solbjerg";
$location{'8361'} = "Hasselager";
$location{'8362'} = "Hørning";
$location{'8370'} = "Hadsten";
$location{'8380'} = "Trige";
$location{'8381'} = "Tilst";
$location{'8382'} = "Hinnerup";
$location{'8400'} = "Ebeltoft";
$location{'8410'} = "Rønde";
$location{'8420'} = "Knebel";
$location{'8444'} = "Balle";
$location{'8450'} = "Hammel";
$location{'8462'} = "Harlev J";
$location{'8464'} = "Galten";
$location{'8471'} = "Sabro";
$location{'8472'} = "Sporup";
$location{'8500'} = "Grenaa";
$location{'8520'} = "Lystrup";
$location{'8530'} = "Hjortshøj";
$location{'8541'} = "Skødstrup";
$location{'8543'} = "Hornslet";
$location{'8544'} = "Mørke";
$location{'8550'} = "Ryomgård";
$location{'8560'} = "Kolind";
$location{'8570'} = "Trustrup";
$location{'8581'} = "Nimtofte";
$location{'8585'} = "Glesborg";
$location{'8586'} = "Ørum Djurs";
$location{'8592'} = "Anholt";
$location{'8600'} = "Silkeborg";
$location{'8620'} = "Kjellerup";
$location{'8632'} = "Lemming";
$location{'8641'} = "Sorring";
$location{'8643'} = "Ans By";
$location{'8653'} = "Them";
$location{'8654'} = "Bryrup";
$location{'8660'} = "Skanderborg";
$location{'8670'} = "Låsby";
$location{'8680'} = "Ry";
$location{'8700'} = "Horsens";
$location{'8721'} = "Daugård";
$location{'8722'} = "Hedensted";
$location{'8723'} = "Løsning";
$location{'8732'} = "Hovedgård";
$location{'8740'} = "Brædstrup";
$location{'8751'} = "Gedved";
$location{'8752'} = "Østbirk";
$location{'8762'} = "Flemming";
$location{'8763'} = "Rask Mølle";
$location{'8765'} = "Klovborg";
$location{'8766'} = "Nørre Snede";
$location{'8781'} = "Stenderup";
$location{'8783'} = "Hornsyld";
$location{'8800'} = "Viborg";
$location{'8830'} = "Tjele";
$location{'8831'} = "Løgstrup";
$location{'8832'} = "Skals";
$location{'8840'} = "Rødkærsbro";
$location{'8850'} = "Bjerringbro";
$location{'8860'} = "Ulstrup";
$location{'8870'} = "Langå";
$location{'8881'} = "Thorsø";
$location{'8882'} = "Fårvang";
$location{'8883'} = "Gjern";
$location{'8900'} = "Randers";
$location{'8950'} = "Ørsted";
$location{'8961'} = "Allingåbro";
$location{'8963'} = "Auning";
$location{'8970'} = "Havndal";
$location{'8981'} = "Spentrup";
$location{'8983'} = "Gjerlev J";
$location{'8990'} = "Fårup";
$location{'9000'} = "Aalborg";
$location{'9020'} = "Aalborg"; $owner{'9020'} = "Erhvervskunder";
$location{'9029'} = "Aalborg"; $type{'9029'} = "U";
$location{'9100'} = "Aalborg"; $type{'9100'} = "B";
$location{'9200'} = "Aalborg SV";
$location{'9210'} = "Aalborg SØ";
$location{'9220'} = "Aalborg Øst";
$location{'9230'} = "Svenstrup J";
$location{'9240'} = "Nibe";
$location{'9260'} = "Gistrup";
$location{'9270'} = "Klarup";
$location{'9280'} = "Storvorde";
$location{'9293'} = "Kongerslev";
$location{'9300'} = "Sæby";
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
$location{'9400'} = "Nørresundby";
$location{'9430'} = "Vadum";
$location{'9440'} = "Aabybro";
$location{'9460'} = "Brovst";
$location{'9480'} = "Løkken";
$location{'9490'} = "Pandrup";
$location{'9492'} = "Blokhus";
$location{'9493'} = "Saltum";
$location{'9500'} = "Hobro";
$location{'9510'} = "Arden";
$location{'9520'} = "Skørping";
$location{'9530'} = "Støvring";
$location{'9541'} = "Suldrup";
$location{'9550'} = "Mariager";
$location{'9560'} = "Hadsund";
$location{'9574'} = "Bælum";
$location{'9575'} = "Terndrup";
$location{'9600'} = "Aars";
$location{'9610'} = "Nørager";
$location{'9620'} = "Aalestrup";
$location{'9631'} = "Gedsted";
$location{'9632'} = "Møldrup";
$location{'9640'} = "Farsø";
$location{'9670'} = "Løgstør";
$location{'9681'} = "Ranum";
$location{'9690'} = "Fjerritslev";
$location{'9700'} = "Brønderslev";
$location{'9740'} = "Jerslev J";
$location{'9750'} = "Østervrå";
$location{'9760'} = "Vrå";
$location{'9800'} = "Hjørring";
$location{'9830'} = "Tårs";
$location{'9850'} = "Hirtshals";
$location{'9870'} = "Sindal";
$location{'9881'} = "Bindslev";
$location{'9900'} = "Frederikshavn";
$location{'9940'} = "Læsø";
$location{'9970'} = "Strandby";
$location{'9981'} = "Jerup";
$location{'9982'} = "Ålbæk";
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
$location{'100'} = "Tórshavn";
$location{'110'} = "Tórshavn "; $type{'110'} = "B";
$location{'160'} = "Argir";
$location{'165'} = "Argir "; $type{'165'} = "B";
$location{'175'} = "Kirkjubøur";
$location{'176'} = "Velbastadur";
$location{'177'} = "Sydradalur, Streymoy";
$location{'178'} = "Nordradalur";
$location{'180'} = "Kaldbak";
$location{'185'} = "Kaldbaksbotnur";
$location{'186'} = "Sund";
$location{'187'} = "Hvitanes";
$location{'188'} = "Hoyvík";
$location{'210'} = "Sandur";
$location{'215'} = "Sandur"; $type{'215'} = "B";
$location{'220'} = "Skálavík";
$location{'230'} = "Húsavík";
$location{'235'} = "Dalur";
$location{'236'} = "Skarvanes";
$location{'240'} = "Skopun";
$location{'260'} = "Skúvoy";
$location{'270'} = "Nólsoy";
$location{'280'} = "Hestur";
$location{'285'} = "Koltur";
$location{'286'} = "Stóra Dimun";
$location{'330'} = "Stykkid";
$location{'335'} = "Leynar";
$location{'336'} = "Skællingur";
$location{'340'} = "Kvívík";
$location{'350'} = "Vestmanna";
$location{'355'} = "Vestmanna"; $type{'355'} = "B";
$location{'358'} = "Válur";
$location{'360'} = "Sandavágur";
$location{'370'} = "Midvágur";
$location{'375'} = "Midvágur"; $type{'375'} = "B";
$location{'380'} = "Sørvágur";
$location{'385'} = "Vatnsoyrar";
$location{'386'} = "Bøur";
$location{'387'} = "Gásadalur";
$location{'388'} = "Mykines";
$location{'400'} = "Oyrarbakki";
$location{'405'} = "Oyrarbakki"; $type{'405'} = "B";
$location{'410'} = "Kollafjørdur";
$location{'415'} = "Oyrareingir";
$location{'416'} = "Signabøur";
$location{'420'} = "Hósvík";
$location{'430'} = "Hvalvík";
$location{'435'} = "Streymnes";
$location{'436'} = "Saksun";
$location{'437'} = "Nesvík";
$location{'438'} = "Langasandur";
$location{'440'} = "Haldarsvík";
$location{'445'} = "Tjørnuvík";
$location{'450'} = "Oyri";
$location{'460'} = "Nordskáli";
$location{'465'} = "Svináir";
$location{'466'} = "Ljósá";
$location{'470'} = "Eidi";
$location{'475'} = "Funningur";
$location{'476'} = "Gjógv";
$location{'477'} = "Funningsfjørdur";
$location{'478'} = "Elduvík";
$location{'480'} = "Skáli";
$location{'485'} = "Skálafjørdur";
$location{'490'} = "Strendur";
$location{'494'} = "innan Glyvur";
$location{'495'} = "Kolbanargjógv";
$location{'496'} = "Morskranes";
$location{'497'} = "Selatrad";
$location{'510'} = "Gøta";
$location{'511'} = "Gøtugjógv";
$location{'512'} = "Nordragøta";
$location{'513'} = "Sydrugøta";
$location{'515'} = "Gøta"; $type{'515'} = "B";
$location{'520'} = "Leirvík";
$location{'530'} = "Fuglafjørdur";
$location{'535'} = "Fuglafjørdur"; $type{'535'} = "B";
$location{'600'} = "Saltangará";
$location{'610'} = "Saltangará"; $type{'610'} = "B";
$location{'620'} = "Runavík";
$location{'625'} = "Glyvrar";
$location{'626'} = "Lambareidi";
$location{'627'} = "Lambi";
$location{'640'} = "Rituvík";
$location{'645'} = "Æduvík";
$location{'650'} = "Toftir";
$location{'655'} = "Nes, Eysturoy";
$location{'656'} = "Saltnes";
$location{'660'} = "Søldarfjørdur";
$location{'665'} = "Skipanes";
$location{'666'} = "Gøtueidi";
$location{'690'} = "Oyndarfjørdur";
$location{'695'} = "Hellur";
$location{'700'} = "Klaksvík";
$location{'710'} = "Klaksvík"; $type{'710'} = "B";
$location{'725'} = "Nordoyri";
$location{'726'} = "Ánir";
$location{'727'} = "Árnafjørdur";
$location{'730'} = "Norddepil";
$location{'735'} = "Depil";
$location{'736'} = "Nordtoftir";
$location{'737'} = "Múli";
$location{'740'} = "Hvannasund";
$location{'750'} = "Vidareidi";
$location{'765'} = "Svinoy";
$location{'766'} = "Kirkja";
$location{'767'} = "Hattarvík";
$location{'780'} = "Kunoy";
$location{'785'} = "Haraldssund";
$location{'795'} = "Sydradalur, Kalsoy";
$location{'796'} = "Húsar";
$location{'797'} = "Mikladalur";
$location{'798'} = "Trøllanes";
$location{'800'} = "Tvøroyri";
$location{'810'} = "Tvøroyri"; $type{'810'} = "B";
$location{'825'} = "Frodba";
$location{'826'} = "Trongisvágur";
$location{'827'} = "Øravík";
$location{'850'} = "Hvalba";
$location{'860'} = "Sandvík";
$location{'870'} = "Fámjin";
$location{'900'} = "Vágur";
$location{'910'} = "Vágur"; $type{'910'} = "B";
$location{'925'} = "Nes, Vágur";
$location{'926'} = "Lopra";
$location{'927'} = "Akrar";
$location{'928'} = "Vikarbyrgi";
$location{'950'} = "Porkeri";
$location{'960'} = "Hov";
$location{'970'} = "Sumba";


## bin/mkpostalinfo end

1;
__END__

=head1 NAME

Geo::Postcodes::DK - Danish postal codes with names

=head1 SYNOPSIS

This module can be used object oriented, or as procedures.
Take your pick.

=head2 OBJECT ORIENTED

use Geo::Postcodes::DK qw(valid);

my $pnr = '1171';

if (valid($pnr)) # A valid postal code?
{
  my $P = Geo::Postcodes::DK-E<gt>new($pnr);

  print "Postcode"        '" . $P->$pnr        . "'.\n";
  print "Postal location: '" . $P->location_of . "'.\n";
  print "Postcode type:   '" . $P->type        . "'.\n"; 
  print "Owner:           '" . $P->owner       . "'.\n";
  print "Address:         '" . $P->address     . "'.\n";
}

The test for a valid postal code can also be expressed this way:

my $P = Geo::postcodes::DK-E<gt>new($pnr);

if ($P) { ... }

=head2 PROCEDURES

use Geo::postcodes::DK ':all';

my $pnr = "1171";

if (valid($pnr))
{
  print "Postcode"        '" . $postcode              . "'.\n";
  print "Postal location: '" . location_of($postcode) . "'.\n";
  print "Postcode type:   '" . type_of($postcode)     . "'.\n"; 
  print "Owner:           '" . owner_of($postcode)    . "'.\n";
  print "Address:         '" . address_of($postcode)  . "'.\n";
}

=head1 ABSTRACT

Geo::postcodes::DK - Perl extension for the mapping between danish
(including Grønland and Færøerne) postal codes, postal location,
address and address owner.

=head1 DESCRIPTION

Tired og entering the postal name all the time? This is not necessary, as
it is uniquely defined from the postal code. Request the postal code only,
and use this library to get the postal name.

=head2 EXPORT

None by default.

The procedures can be imported individually, or I<en block> with 
B<use Geo::postcodes::DK ':all';>.

=head1 DEPENDENCIES

This module is a subclass of Geo::Postcodes, which must be installed separately.

=head1 PROCEDURES

Note that the I<xxx_of> procedures return I<undef> when passed an illegal
argument.

=head2 legal

C<my $boolean = Geo::postcodes::DK::legal($number);>

Do we have a legal postal code; a code that follows the syntax rules?

=head2 valid

C<my $boolean = Geo::postcodes::DK::valid($number);>

Do we have a valid postal code; a code in actual use?

=head2 location_of

C<my $location = Geo::postcodes::DK::location_of($number);>

The postal place associated with the specified postal code.

=head2 owner_of

C<my $owner = Geo::postcodes::DK::owner_of($number);>

The owner (company) of the postal code, if any.

=head2 address_of

C<my $address = Geo::postcodes::DK::address_of($number);>

The address (street) associated with the specified postal code.

=head2 type_of

C<my $type = Geo::postcodes::DK::type_of($number);>

What kind of postal code is this. Possible values are: I<"Postboks">,
I<"Personlig eier">, I<"Ufrankerede svarforsendelser">, and
I<"Gateadresse">.

This information may not be especially useful.

=head1 METHODS

=head2 new

C<my $P = Geo::postcodes::DK-E<gt>new($number);>

Create a new postal code object. 

The constructor will return I<undef> when passed an illegal postal code.
Legal postal codes consist of four digits, and must also be in use.

Either check the postal code with C<legal> before this call,
or test it afterwards; C<if ($P) { ... }>.

=head2 postcode

C<my $postcode = $P-E<gt>postcode;>

The postcode.

=head2 location

C<my $location = $P-E<gt>location;>

The postal location associated with the specified postcode.

=head2 type

C<my $type = $P-E<gt>type;>

See the description of the procedure I<type_of> above.

=head1 CAVEAT

This module uses "inside out objects".

=head2 POSTCODES

Danish postcodes (including Grønland) are four digit numbers ("0000" to "9999"),
while Færøerne uses three digits numbers ("000" to "999"). This means that
"0010" and "010" are legal, while "10" is not.

Use I<legal> to check for legal postcodes, and I<valid> to check if
the postcode is actually in use. C<Geo::postcodes::NO->new($postcode)>
will return I<undef> if passed an illegal or invalif postcode. 

Attempts to access the methods of a non-existent postal code object will
result in a runtime error. This can be avoided by checking if the postal
code is legal, before creating the object; C<valid($postcode)>
returns true or false.

=head2 CHARACTER SET

The library was written using the ISO-8859-1 (iso-latin1) character set, and the
special danish letters 'Æ', 'Ø' and 'Å' occur regularly in the postal places,
kommune name and fylke name. Usage of other character set may cause havoc.
Unicode is not tested.

=head1 SEE ALSO

The latest version of this library should always be available on CPAN, 
but see also the library home page; L<http://bbop.org/perl/GeoPostcodes>.

=head1 AUTHOR

Arne Sommer, E<lt>arne@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Arne Sommer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
