import 'package:transportkartan/enums/marker_type.dart';
import 'package:transportkartan/models/company_model.dart';
import 'package:transportkartan/models/marker_model.dart';

class IndustryPort extends MarkerModel {
  final Company company;

  final List<Company> subContractors;
  final List<Company> staffingCompanies;

  const IndustryPort({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.company,
    required this.subContractors,
    required this.staffingCompanies,
  }) : super(
          type: MarkerType.oilPort,
        );

  IndustryPort copyWith({
    String? id,
    String? name,
    double? lat,
    double? lng,
    String? description,
    Company? company,
    List<Company>? subContractors,
    List<Company>? staffingCompanies,
  }) {
    return IndustryPort(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      description: description ?? this.description,
      company: company ?? this.company,
      subContractors: subContractors ?? this.subContractors,
      staffingCompanies: staffingCompanies ?? this.staffingCompanies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'description': description,
      'company': company.toJson(),
      'subContractors': subContractors.map((e) => e.toJson()).toList(),
      'staffingCompanies': staffingCompanies.map((e) => e.toJson()).toList(),
    };
  }

  factory IndustryPort.fromJson(Map<String, dynamic> json) {
    return IndustryPort(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
      description: json['description'],
      company: Company.fromJson(json['company']),
      subContractors: (json['subContractors'] as List<dynamic>)
          .map((e) => Company.fromJson(e))
          .toList(),
      staffingCompanies: (json['staffingCompanies'] as List<dynamic>)
          .map((e) => Company.fromJson(e))
          .toList(),
    );
  }
}
