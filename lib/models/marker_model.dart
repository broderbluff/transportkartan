import 'package:transportkartan/enums/marker_type.dart';

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
