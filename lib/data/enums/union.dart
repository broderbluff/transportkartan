enum UnionType {
  transport('Transportarbetareförbundet'),

  seko('Seko'),
  dock('Hamnarbetarförbundet'),
  kommunal('Kommunal'),
  ifMetall('IF Metall'),
  handels('Handels'),
  fastighets('Fastighets'),
  hotell('Hotell- och restaurangfacket'),
  byggnads('Byggnads'),
  elektriker('Elektrikerförbundet');

  const UnionType(this.name);
  final String name;
}
