import 'package:flutter/material.dart';
import 'package:transportkartan/data/enums/site_type.dart';

class SiteTypeIcon extends StatelessWidget {
  final SiteType siteType;

  const SiteTypeIcon({super.key, required this.siteType});

  @override
  Widget build(BuildContext context) {
    switch (siteType) {
      case SiteType.combiTerminal:
        return Image.asset('assets/icons/kombiterminal.png');
      case SiteType.cargoAirport:
        return Image.asset('assets/icons/airport.png');
      case SiteType.roroPort:
        return Image.asset('assets/icons/roro.png');
      default:
        return const Icon(Icons.error_sharp);
    }
  }
}
