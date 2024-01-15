import 'package:flutter/material.dart';
import 'package:transportkartan/constants/colors.dart';

enum SiteType {
  combiTerminal('Kombiterminal'),
  industryPort('Industrihamn'),
  oilPort('Oljehamn'),
  roroPort('Rorohamn'),
  containerPort('Containerhamn'),
  cargoAirport('Fraktflygplats'),
  ferryPort('Färjeterminal'),
  thirdPartyTerminal('Tredjepartsterminal'),
  measuringPointRoad('Mätpunkt lastbil'),
  measuringPointRail('Mätpunkt järnväg');

  const SiteType(this.name);
  final String name;
}

extension SiteTypeExtension on SiteType {
  String returnLast() {
    return toString().split('.').last;
  }
}

extension SiteTypeColorExtension on SiteType {
  Color getHeaderColor() {
    switch (this) {
      case SiteType.combiTerminal:
        return Colors.green;
      case SiteType.industryPort:
        return Colors.blue;
      case SiteType.oilPort:
        return oilportColor;
      case SiteType.roroPort:
        return roroColor;
      case SiteType.containerPort:
        return Colors.orange;
      case SiteType.cargoAirport:
        return airportColor;
      case SiteType.ferryPort:
        return Colors.blueGrey;
      case SiteType.thirdPartyTerminal:
        return Colors.grey;
      case SiteType.measuringPointRoad:
        return Colors.cyan.shade800;
      case SiteType.measuringPointRail:
        return Colors.pink.shade800;
      default:
        return Colors.transparent;
    }
  }
}
