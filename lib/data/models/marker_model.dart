import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:transportkartan/data/enums/marker_type.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';
import 'package:uuid/uuid.dart';

class SiteMarker implements Equatable {
  final String id;
  final SiteType type;
  final String name;
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
      this.subContractors,
      this.staffingCompanies,
      this.polylinePoints})
      : id = id ?? const Uuid().v4();

  factory SiteMarker.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return SiteMarker(
      id: data['id'] ?? '',
      type: SiteType.values.firstWhere((element) => element.name == data['type']),
      name: data['name'] ?? '',
      coordinates: data['coordinates'] ?? [],
      polylinePoints: data['polylinePoints'] ?? [],
      description: data['description'] ?? '',
      companies: data['company'] ?? [],
      subContractors: data['subContractors'] ?? [],
      staffingCompanies: data['staffingCompanies'] ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type.name,
      'name': name,
      'coordinates': coordinates,
      'description': description,
      'polylinePoints': polylinePoints,
      'company': companies,
      'subContractors': subContractors,
      'staffingCompanies': staffingCompanies,
    };
  }

  SiteMarker copyWith({
    String? id,
    SiteType? type,
    String? name,
    List<double>? coordinates,
    String? description,
    List<CompanyId>? company,
    List<CompanyId>? subContractors,
    List<CompanyId>? staffingCompanies,
    List<Polyline>? polylinePoints,
  }) {
    return SiteMarker(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      coordinates: coordinates ?? this.coordinates,
      description: description ?? this.description,
      companies: company ?? companies,
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
        companies,
        subContractors,
        staffingCompanies,
        polylinePoints,
      ];

  @override
  bool? get stringify => true;
}
