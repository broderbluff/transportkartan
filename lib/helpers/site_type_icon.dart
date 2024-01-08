import 'package:flutter/material.dart';
import 'package:transportkartan/data/enums/site_type.dart';

class SiteTypeIcon extends StatelessWidget {
  final SiteType siteType;

  const SiteTypeIcon({super.key, required this.siteType});

  @override
  Widget build(BuildContext context) {
    switch (siteType) {
      case SiteType.combiTerminal:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/kombiterminal.png'));
      case SiteType.cargoAirport:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/airport.png'));
      case SiteType.roroPort:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/roro.png'));
      case SiteType.containerPort:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/container.png'));
      case SiteType.measuringPointRoad:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/measurePointTrucks.png'));
      case SiteType.industryPort:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/industryPort.png'));
      case SiteType.oilPort:
        return ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset('assets/icons/oilPort.png'));
      default:
        return const Icon(Icons.error_sharp);
    }
  }
}
