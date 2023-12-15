class Company {
  final String name;
  final String description;
  final Union? union;
  final int employees;
  final int members;
  final int electedOfficials;
  final String id;
  final String? logoUrl;
  final String? websiteUrl;
  final String? facebookUrl;
  final String orgNumber;
  final String? headquarterAddress;

  const Company({
    required this.name,
    required this.description,
    this.union,
    required this.employees,
    required this.members,
    required this.electedOfficials,
    required this.id,
    this.logoUrl,
    this.websiteUrl,
    this.facebookUrl,
    required this.orgNumber,
    this.headquarterAddress,
  });
}

enum Union {
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

  const Union(this.name);
  final String name;
}
