import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';

part 'workplace_model.freezed.dart';
part 'workplace_model.g.dart';

@freezed
class Workplace with _$Workplace {
  const factory Workplace({
    String? id,
    required CompanyId companyId,
    required String siteId,
    required int members,
    required int electedOfficials,
    required int employees,
    CompanyType? companyType,
  }) = _Workplace;

  factory Workplace.fromJson(Map<String, dynamic> json) => _$WorkplaceFromJson(json);

  factory Workplace.empty() => const Workplace(
        id: null,
        companyId: '',
        siteId: '',
        members: 0,
        electedOfficials: 0,
        employees: 0,
        companyType: null,
      );
}
