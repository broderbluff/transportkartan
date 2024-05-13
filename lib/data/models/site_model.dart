import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';

part 'site_model.freezed.dart';
part 'site_model.g.dart';

@freezed
class SiteMarker with _$SiteMarker {
  const factory SiteMarker({
    String? id,
    required SiteType type,
    required String name,
    int? unit,
    UnitType? unitType,
    required List<double> coordinates,
    required String description,
    List<String>? handleGoods,
    List<String>? goodsOfInterest,
    //List<Polyline>? polylinePoints,
  }) = _SiteMarker;

  factory SiteMarker.fromJson(Map<String, dynamic> json) => _$SiteMarkerFromJson(json);
}
