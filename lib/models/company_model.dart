import 'package:transportkartan/enums/union.dart';

class Company {
  final String name;
  final String description;
  final UnionType? union;
  final int employees;
  final int members;
  final int electedOfficials;
  final String id;
  final String? logoUrl;
  final String? websiteUrl;
  final String? facebookUrl;
  final String orgNumber;
  final String? headquarterAddress;
  final List<String>? sites;

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
    this.sites,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'] as String,
      description: json['description'] as String,
      union: json['union'] != null
          ? UnionType.values
              .firstWhere((element) => element.name == json['union'])
          : null,
      employees: json['employees'] as int,
      members: json['members'] as int,
      electedOfficials: json['electedOfficials'] as int,
      id: json['id'] as String,
      logoUrl: json['logoUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      orgNumber: json['orgNumber'] as String,
      headquarterAddress: json['headquarterAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'union': union?.name,
      'employees': employees,
      'members': members,
      'electedOfficials': electedOfficials,
      'id': id,
      'logoUrl': logoUrl,
      'websiteUrl': websiteUrl,
      'facebookUrl': facebookUrl,
      'orgNumber': orgNumber,
      'headquarterAddress': headquarterAddress,
    };
  }

  Company copyWith({
    String? name,
    String? description,
    UnionType? union,
    int? employees,
    int? members,
    int? electedOfficials,
    String? id,
    String? logoUrl,
    String? websiteUrl,
    String? facebookUrl,
    String? orgNumber,
    String? headquarterAddress,
  }) {
    return Company(
      name: name ?? this.name,
      description: description ?? this.description,
      union: union ?? this.union,
      employees: employees ?? this.employees,
      members: members ?? this.members,
      electedOfficials: electedOfficials ?? this.electedOfficials,
      id: id ?? this.id,
      logoUrl: logoUrl ?? this.logoUrl,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      orgNumber: orgNumber ?? this.orgNumber,
      headquarterAddress: headquarterAddress ?? this.headquarterAddress,
    );
  }
}
