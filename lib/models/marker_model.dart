import 'package:transportkartan/models/company_model.dart';

abstract class MarkerModel {
  final String id;
  final MarkerType type;
  final String name;
  final double lat;
  final double lng;
  final String description;

  const MarkerModel({
    required this.id,
    required this.type,
    required this.name,
    required this.lat,
    required this.lng,
    required this.description,
  });
}

enum MarkerType {
  combiTerminal('Kombiterminal'),
  industryPort('Industrihamn'),
  oilPort('Oljehamn'),
  roroPort('Rorohamn'),
  containerPort('Containerhamn'),
  cargoAirport('Fraktflygplats'),
  ferryPort('Färjeterminal');

  const MarkerType(this.name);
  final String name;
}

class CombiTerminal extends MarkerModel {
  final Company company;

  final List<Company> subContractors;
  final List<Company> staffingCompanies;

  const CombiTerminal({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.company,
    required this.subContractors,
    required this.staffingCompanies,
  }) : super(
          type: MarkerType.combiTerminal,
        );
}

class FerryPort extends MarkerModel {
  final Company company;

  final List<FerryLine> ferryLine;

  const FerryPort({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.company,
    required this.ferryLine,
  }) : super(
          type: MarkerType.ferryPort,
        );
}

class FerryLine {
  final String destination;
  final String country;

  const FerryLine({
    required this.destination,
    required this.country,
  });
}

class OilPort extends MarkerModel {
  final Company company;

  final List<Company> subContractors;
  final List<Company> staffingCompanies;

  const OilPort({
    required super.id,
    required super.name,
    required super.lat,
    required super.lng,
    required super.description,
    required this.company,
    required this.subContractors,
    required this.staffingCompanies,
  }) : super(
          type: MarkerType.combiTerminal,
        );
}
