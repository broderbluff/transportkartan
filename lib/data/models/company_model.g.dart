// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      union: $enumDecodeNullable(_$UnionTypeEnumMap, json['union']),
      totalEmployees: json['totalEmployees'] as int,
      id: json['id'] as String,
      logoUrl: json['logoUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      linkedInUrl: json['linkedInUrl'] as String?,
      orgNumber: json['orgNumber'] as String,
      headquarterAddress: json['headquarterAddress'] as String?,
      workplaces: (json['workplaces'] as List<dynamic>?)
          ?.map((e) => Workplace.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'union': _$UnionTypeEnumMap[instance.union],
      'totalEmployees': instance.totalEmployees,
      'id': instance.id,
      'logoUrl': instance.logoUrl,
      'websiteUrl': instance.websiteUrl,
      'facebookUrl': instance.facebookUrl,
      'linkedInUrl': instance.linkedInUrl,
      'orgNumber': instance.orgNumber,
      'headquarterAddress': instance.headquarterAddress,
      'workplaces': instance.workplaces,
    };

const _$UnionTypeEnumMap = {
  UnionType.transport: 'transport',
  UnionType.seko: 'seko',
  UnionType.dock: 'dock',
  UnionType.kommunal: 'kommunal',
  UnionType.ifMetall: 'ifMetall',
  UnionType.handels: 'handels',
  UnionType.fastighets: 'fastighets',
  UnionType.hotell: 'hotell',
  UnionType.byggnads: 'byggnads',
  UnionType.elektriker: 'elektriker',
};

_$WorkplaceImpl _$$WorkplaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkplaceImpl(
      siteId: json['siteId'] as String,
      members: json['members'] as int,
      electedOfficials: json['electedOfficials'] as int,
      employees: json['employees'] as int,
      companyType:
          $enumDecodeNullable(_$CompanyTypeEnumMap, json['companyType']),
    );

Map<String, dynamic> _$$WorkplaceImplToJson(_$WorkplaceImpl instance) =>
    <String, dynamic>{
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

_$CompanyListModelImpl _$$CompanyListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyListModelImpl(
      mainCompanies: (json['mainCompanies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      subContractors: (json['subContractors'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffingCompanies: (json['staffingCompanies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      securityCompanies: (json['securityCompanies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      carrierCompanies: (json['carrierCompanies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompanyListModelImplToJson(
        _$CompanyListModelImpl instance) =>
    <String, dynamic>{
      'mainCompanies': instance.mainCompanies,
      'subContractors': instance.subContractors,
      'staffingCompanies': instance.staffingCompanies,
      'securityCompanies': instance.securityCompanies,
      'carrierCompanies': instance.carrierCompanies,
    };
