enum UnitType {
  units('enheter'),
  containerTEU('containrar TEU'),
  tons('ton'),
  trucks('lastbilar'),
  trailers('trailers'),
  pallets('pallar'),
  packages('paket'),
  trains('godståg'),
  vehicle('fordon');

  const UnitType(this.name);
  final String name;
}
