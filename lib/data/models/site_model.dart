import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    String? id,
    required SiteType type,
    required String name,
    int? unit,
    UnitType? unitType,
    required List<double> coordinates,
    required String description,
    List<String>? handleGoods,
    List<String>? goodsOfInterest,
    bool? isITF,
    String? updatedAt,
    //List<Polyline>? polylinePoints,
  }) = _SiteMarker;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}
