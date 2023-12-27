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
      sites: (json['sites'] as List<dynamic>?)
          ?.map((e) => Site.fromJson(e as Map<String, dynamic>))
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
      'sites': instance.sites,
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

_$SiteImpl _$$SiteImplFromJson(Map<String, dynamic> json) => _$SiteImpl(
      siteId: json['siteId'] as String,
      members: json['members'] as int,
      electedOfficials: json['electedOfficials'] as int,
      employees: json['employees'] as int,
    );

Map<String, dynamic> _$$SiteImplToJson(_$SiteImpl instance) =>
    <String, dynamic>{
      'siteId': instance.siteId,
      'members': instance.members,
      'electedOfficials': instance.electedOfficials,
      'employees': instance.employees,
    };
