enum UnitType {
  millionTons('Miljoner ton'),
  units('Enheter'),
  containerTEU('Containrar TEU'),
  tons('Ton'),
  trucks('Lastbilar'),
  trailers('Trailers');

  const UnitType(this.name);
  final String name;
}
