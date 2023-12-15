import 'package:transportkartan/enums/marker_type.dart';
import 'package:transportkartan/models/company_model.dart';
import 'package:transportkartan/models/marker_model.dart';

class ThirdPartyTerminal extends MarkerModel {
  final Company company;

  final List<Company> subContractors;
  final List<Company> staffingCompanies;
  final String ownerCompany;

  const ThirdPartyTerminal({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.ownerCompany,
    required this.company,
    required this.subContractors,
    required this.staffingCompanies,
  }) : super(
          type: MarkerType.combiTerminal,
        );

  factory ThirdPartyTerminal.fromJson(Map<String, dynamic> json) {
    return ThirdPartyTerminal(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
      ownerCompany: json['ownerCompany'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'ownerCompany': ownerCompany,
      'description': description,
      'company': company.toJson(),
      'subContractors': subContractors.map((e) => e.toJson()).toList(),
      'staffingCompanies': staffingCompanies.map((e) => e.toJson()).toList(),
    };
  }

  ThirdPartyTerminal copyWith({
    String? id,
    String? name,
    double? lat,
    double? lng,
    String? description,
    Company? company,
    String? ownerCompany,
    List<Company>? subContractors,
    List<Company>? staffingCompanies,
  }) {
    return ThirdPartyTerminal(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      ownerCompany: ownerCompany ?? this.ownerCompany,
      lng: lng ?? this.lng,
      description: description ?? this.description,
      company: company ?? this.company,
      subContractors: subContractors ?? this.subContractors,
      staffingCompanies: staffingCompanies ?? this.staffingCompanies,
    );
  }
}
