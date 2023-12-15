enum MarkerType {
  combiTerminal('Kombiterminal'),
  industryPort('Industrihamn'),
  oilPort('Oljehamn'),
  roroPort('Rorohamn'),
  containerPort('Containerhamn'),
  cargoAirport('Fraktflygplats'),
  ferryPort('Färjeterminal'),
  thirdPartyTerminal('Tredjepartsterminal');

  const MarkerType(this.name);
  final String name;
}
