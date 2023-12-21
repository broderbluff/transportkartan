import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:uuid/uuid.dart';

class Company {
  final String name;
  final String description;
  final UnionType? union;
  final int employees;
  final String id;
  final String? logoUrl;
  final String? websiteUrl;
  final String? facebookUrl;
  final String orgNumber;
  final String? headquarterAddress;
  final List<String>? sites;

  Company({
    required this.description,
    required this.employees,
    required this.name,
    required this.orgNumber,
    this.facebookUrl,
    this.headquarterAddress,
    id,
    this.logoUrl,
    this.sites,
    this.union,
    this.websiteUrl,
  }) : id = id ?? const Uuid().v4();

  factory Company.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Company(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      union: data['union'] != ''
          ? UnionType.values
              .firstWhere((element) => element.name == data['union'])
          : null,
      employees: data['employees'] ?? 0,
      id: data['id'] ?? '',
      logoUrl: data['logoUrl'] ?? '',
      websiteUrl: data['websiteUrl'] ?? '',
      facebookUrl: data['facebookUrl'] ?? '',
      orgNumber: data['orgNumber'] ?? '',
      headquarterAddress: data['headquarterAddress'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'union': union?.name,
      'employees': employees,
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
      id: id ?? this.id,
      logoUrl: logoUrl ?? this.logoUrl,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      facebookUrl: facebookUrl ?? this.facebookUrl,
      orgNumber: orgNumber ?? this.orgNumber,
      headquarterAddress: headquarterAddress ?? this.headquarterAddress,
    );
  }
}
