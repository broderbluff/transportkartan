import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';
import 'package:uuid/uuid.dart';

class SiteMarker implements Equatable {
  final String id;
  final SiteType type;
  final String name;
  final int? unit;
  final UnitType? unitType;
  final List<double> coordinates;
  final String description;

  final List<CompanyId> companies;
  final List<Polyline>? polylinePoints;

  final List<CompanyId>? subContractors;
  final List<CompanyId>? staffingCompanies;

  SiteMarker(
      {id,
      required this.type,
      required this.name,
      required this.coordinates,
      required this.description,
      required this.companies,
      this.unit,
      this.unitType,
      this.subContractors,
      this.staffingCompanies,
      this.polylinePoints})
      : id = id ?? const Uuid().v4();

  factory SiteMarker.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return SiteMarker(
      id: data['id'] ?? '',
      unit: data['unit'] ?? 0,
      type: SiteType.values.firstWhere((element) => element.name == data['type']),
      unitType: UnitType.values.firstWhere((element) => element.name == data['unitType']),
      name: data['name'] ?? '',
      coordinates: (data['coordinates'] as List<dynamic>).cast<double>(),
      polylinePoints: data['polylinePoints'] ?? [],
      description: data['description'] ?? '',
      companies: (data['companies'] as List<dynamic>).cast<String>(),
      subContractors: (data['subContractors'] != null) ? (data['subContractors'] as List<dynamic>).cast<String>() : [],
      staffingCompanies: (data['staffingCompanies'] != null) ? (data['staffingCompanies'] as List<dynamic>).cast<String>() : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'unit': unit,
      'unitType': unitType?.name,
      'name': name,
      'coordinates': coordinates,
      'description': description,
      'polylinePoints': polylinePoints,
      'companies': companies,
      'subContractors': subContractors,
      'staffingCompanies': staffingCompanies,
    };
  }

  SiteMarker copyWith({
    String? id,
    SiteType? type,
    String? name,
    int? unit,
    UnitType? unitType,
    List<double>? coordinates,
    String? description,
    List<CompanyId>? companies,
    List<CompanyId>? subContractors,
    List<CompanyId>? staffingCompanies,
    List<Polyline>? polylinePoints,
  }) {
    return SiteMarker(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      unitType: unitType ?? this.unitType,
      coordinates: coordinates ?? this.coordinates,
      description: description ?? this.description,
      companies: companies ?? this.companies,
      subContractors: subContractors ?? this.subContractors,
      staffingCompanies: staffingCompanies ?? this.staffingCompanies,
      polylinePoints: polylinePoints ?? this.polylinePoints,
    );
  }

  @override
  List<Object?> get props => [
        id,
        type,
        name,
        coordinates,
        description,
        unit,
        unitType,
        companies,
        subContractors,
        staffingCompanies,
        polylinePoints,
      ];

  @override
  bool? get stringify => true;
}
