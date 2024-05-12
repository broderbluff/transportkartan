import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';

part 'workplace_model.freezed.dart';
part 'workplace_model.g.dart';

@freezed
class Workplace with _$Workplace {
  const factory Workplace({
    String? id,
    CompanyId? companyId,
    String? placeId,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) => _$WorkplaceFromJson(json);
}
