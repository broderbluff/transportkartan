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
      totalEmployees: (json['totalEmployees'] as num).toInt(),
      id: json['id'] as String,
      logoUrl: json['logoUrl'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      facebookUrl: json['facebookUrl'] as String?,
      isITF: json['isITF'] as bool?,
      linkedInUrl: json['linkedInUrl'] as String?,
      orgNumber: json['orgNumber'] as String,
      headquarterAddress: json['headquarterAddress'] as String?,
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
      'isITF': instance.isITF,
      'linkedInUrl': instance.linkedInUrl,
      'orgNumber': instance.orgNumber,
      'headquarterAddress': instance.headquarterAddress,
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
