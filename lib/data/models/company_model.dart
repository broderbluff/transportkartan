import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/enums/union.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required String name,
    required String description,
    UnionType? union,
    required int totalEmployees,
    required String id,
    String? logoUrl,
    String? websiteUrl,
    String? facebookUrl,
    bool? isITF,
    String? linkedInUrl,
    required String orgNumber,
    String? headquarterAddress,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  factory Company.empty() => const Company(
        name: '',
        description: '',
        union: null,
        totalEmployees: 0,
        id: '',
        logoUrl: null,
        websiteUrl: null,
        facebookUrl: null,
        linkedInUrl: null,
        orgNumber: '',
        headquarterAddress: null,
      );
}
