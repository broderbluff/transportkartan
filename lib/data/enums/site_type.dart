enum SiteType {
  combiTerminal('Kombiterminal'),
  industryPort('Industrihamn'),
  oilPort('Oljehamn'),
  roroPort('Rorohamn'),
  containerPort('Containerhamn'),
  cargoAirport('Fraktflygplats'),
  ferryPort('Färjeterminal'),
  thirdPartyTerminal('Tredjepartsterminal');

  const SiteType(this.name);
  final String name;
}
