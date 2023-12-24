import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/site_model.dart';

var listOfMarker = [
  SiteMarker(
    type: SiteType.combiTerminal,
    name: 'Malmö Kombiterminal',
    coordinates: [55.6206149, 13.0440592],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.roroPort,
    name: 'Malmö Rorohamn',
    coordinates: [55.620389, 13.004260],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.oilPort,
    name: 'Malmö Oljehamn',
    coordinates: [55.63165, 13.0291626],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.cargoAirport,
    name: 'Malmö Airport',
    coordinates: [55.5347595, 13.3677646],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.roroPort,
    name: 'Trelleborg rorohamn',
    coordinates: [55.3682814, 13.1585348],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.roroPort,
    name: 'Trelleborg industrihamn',
    coordinates: [55.3682814, 13.1585348],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.ferryPort,
    name: 'Trelleborg färjeterminal',
    coordinates: [55.3682814, 13.1585348],
    description: 'description',
    companies: [], // Updated attribute

    polylinePoints: [
      Polyline(
        isDotted: true,
        points: [
          const LatLng(55.3680882, 13.1518364),
          const LatLng(55.3385178, 13.1451416),
          const LatLng(55.2963199, 13.2824707),
          const LatLng(55.2133563, 13.9855957),
          const LatLng(55.2102222, 14.2465210),
          const LatLng(55.4040698, 14.6255493),
          const LatLng(55.4796317, 14.9826050),
          const LatLng(55.6651932, 20.5224609),
          const LatLng(55.7247900, 20.9426880),
          const LatLng(55.7255634, 21.0882568),
          const LatLng(55.7199560, 21.1054230),
          const LatLng(55.7008074, 21.1256790),
          const LatLng(55.6580277, 21.1565781),
        ],
        strokeWidth: 4.0,
        color: Colors.purple,
      ),
      Polyline(
        isDotted: true,
        points: [
          const LatLng(55.3680882, 13.1518364),
          const LatLng(54.6492071, 13.7823486),
          const LatLng(54.2668281, 14.1394043),
          const LatLng(53.9326455, 14.2863464),
          const LatLng(53.9141468, 14.2784500),
          const LatLng(53.9012535, 14.2573357),
        ],
        strokeWidth: 4.0,
        color: Colors.red,
      ),
      Polyline(
        isDotted: true,
        points: [
          const LatLng(55.3680882, 13.1518364),
          const LatLng(55.0500559, 12.6947021),
          const LatLng(54.5083265, 12.1783447),
          const LatLng(54.1109429, 11.1456299),
          const LatLng(54.0194693, 10.9822083),
          const LatLng(53.9661850, 10.8998108),
          const LatLng(53.9516410, 10.8627319),
          const LatLng(53.9404708, 10.8622169),
        ],
        strokeWidth: 4.0,
        color: Colors.blue,
      ),
    ],
  ),
  SiteMarker(
    type: SiteType.combiTerminal,
    name: 'Trelleborg kombiterminal',
    coordinates: [55.3682814, 13.1585348],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.roroPort,
    name: 'Ystad rorohamn',
    coordinates: [55.423481, 13.829728],
    description: 'description',
    companies: [], // Updated attribute
  ),
  SiteMarker(
    type: SiteType.industryPort,
    name: 'Ystad industrihamn',
    coordinates: [55.423481, 13.829728],
    description: 'description',
    companies: [], // Updated attribute
  ),
];
var listOfCompanies = [
  Company(
    id: '1',
    name: 'Mertz',
    description: 'Mertz är ett företag som gör saker',
    totalEmployees: 100,
    orgNumber: '1234567890',
    union: UnionType.transport,
    sites: [],
  ),
  Company(
    id: '2',
    name: 'CMP',
    description: 'CMP är ett företag som gör saker',
    totalEmployees: 100,
    orgNumber: '1234567890',
    union: UnionType.transport,
    sites: [],
  ),
];
