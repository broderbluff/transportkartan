// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkplaceImpl _$$WorkplaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceImpl(
      id: json['id'] as String?,
      companyId: json['companyId'] as String,
      siteId: json['siteId'] as String,
      members: (json['members'] as num).toInt(),
      electedOfficials: (json['electedOfficials'] as num).toInt(),
      employees: (json['employees'] as num).toInt(),
      companyType:
          $enumDecodeNullable(_$CompanyTypeEnumMap, json['companyType']),
    );

Map<String, dynamic> _$$WorkplaceImplToJson(_$WorkplaceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'siteId': instance.siteId,
      'members': instance.members,
      'electedOfficials': instance.electedOfficials,
      'employees': instance.employees,
      'companyType': _$CompanyTypeEnumMap[instance.companyType],
    };

const _$CompanyTypeEnumMap = {
  CompanyType.mainCompany: 'mainCompany',
  CompanyType.subContractor: 'subContractor',
  CompanyType.staffingCompany: 'staffingCompany',
  CompanyType.carrierCompany: 'carrierCompany',
  CompanyType.securityCompany: 'securityCompany',
};
