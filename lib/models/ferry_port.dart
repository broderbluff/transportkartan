import 'package:transportkartan/enums/marker_type.dart';
import 'package:transportkartan/models/company_model.dart';
import 'package:transportkartan/models/marker_model.dart';

import 'ferry_line.dart';

class FerryPort extends MarkerModel {
  final Company company;
  final FerryLine ferryLine;

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

  FerryPort copyWith({
    String? id,
    String? name,
    double? lat,
    double? lng,
    String? description,
    Company? company,
    FerryLine? ferryLine,
  }) {
    return FerryPort(
      id: id ?? this.id,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      description: description ?? this.description,
      company: company ?? this.company,
      ferryLine: ferryLine ?? this.ferryLine,
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
      'ferryLine': ferryLine.toJson(),
    };
  }

  factory FerryPort.fromJson(Map<String, dynamic> json) {
    return FerryPort(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
      description: json['description'],
      company: Company.fromJson(json['company']),
      ferryLine: FerryLine.fromJson(json['ferryLine']),
    );
  }
}
