// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteMarkerImpl _$$SiteMarkerImplFromJson(Map<String, dynamic> json) =>
    _$SiteMarkerImpl(
      id: json['id'] as String?,
      type: $enumDecode(_$SiteTypeEnumMap, json['type']),
      name: json['name'] as String,
      unit: (json['unit'] as num?)?.toInt(),
      unitType: $enumDecodeNullable(_$UnitTypeEnumMap, json['unitType']),
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      description: json['description'] as String,
      companies:
          (json['companies'] as List<dynamic>).map((e) => e as String).toList(),
      subContractors: (json['subContractors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      staffingCompanies: (json['staffingCompanies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      securityCompanies: (json['securityCompanies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      carrierCompanies: (json['carrierCompanies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SiteMarkerImplToJson(_$SiteMarkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SiteTypeEnumMap[instance.type]!,
      'name': instance.name,
      'unit': instance.unit,
      'unitType': _$UnitTypeEnumMap[instance.unitType],
      'coordinates': instance.coordinates,
      'description': instance.description,
      'companies': instance.companies,
      'subContractors': instance.subContractors,
      'staffingCompanies': instance.staffingCompanies,
      'securityCompanies': instance.securityCompanies,
      'carrierCompanies': instance.carrierCompanies,
    };

const _$SiteTypeEnumMap = {
  SiteType.combiTerminal: 'combiTerminal',
  SiteType.industryPort: 'industryPort',
  SiteType.oilPort: 'oilPort',
  SiteType.roroPort: 'roroPort',
  SiteType.containerPort: 'containerPort',
  SiteType.cargoAirport: 'cargoAirport',
  SiteType.ferryPort: 'ferryPort',
  SiteType.thirdPartyTerminal: 'thirdPartyTerminal',
  SiteType.measuringPointRoad: 'measuringPointRoad',
  SiteType.measuringPointRail: 'measuringPointRail',
};

const _$UnitTypeEnumMap = {
  UnitType.units: 'units',
  UnitType.containerTEU: 'containerTEU',
  UnitType.tons: 'tons',
  UnitType.trucks: 'trucks',
  UnitType.trailers: 'trailers',
  UnitType.pallets: 'pallets',
  UnitType.packages: 'packages',
  UnitType.trains: 'trains',
  UnitType.vehicle: 'vehicle',
};
