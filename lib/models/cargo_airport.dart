import 'package:transportkartan/enums/marker_type.dart';
import 'package:transportkartan/models/company_model.dart';
import 'package:transportkartan/models/marker_model.dart';

class CargoAirport extends MarkerModel {
  final Company company;

  final List<Company> subContractors;
  final List<Company> staffingCompanies;
  final String iataCode;

  const CargoAirport({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.company,
    required this.subContractors,
    required this.staffingCompanies,
    required this.iataCode,
  }) : super(
          type: MarkerType.oilPort,
        );

  CargoAirport copyWith({
    String? id,
    String? name,
    double? lat,
    double? lng,
    String? description,
    Company? company,
    List<Company>? subContractors,
    List<Company>? staffingCompanies,
  }) {
    return CargoAirport(
      id: id ?? this.id,
      iataCode: iataCode,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      description: description ?? this.description,
      company: company ?? this.company,
      subContractors: subContractors ?? this.subContractors,
      staffingCompanies: staffingCompanies ?? this.staffingCompanies,
    );
  }
}
