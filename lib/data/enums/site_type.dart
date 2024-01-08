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
  String getValue() {
    return toString().split('.').last;
  }
}
