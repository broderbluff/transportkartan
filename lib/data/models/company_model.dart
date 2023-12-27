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
    String? linkedInUrl,
    required String orgNumber,
    String? headquarterAddress,
    List<Site>? sites,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

@freezed
class Site with _$Site {
  const factory Site({
    required String siteId,
    required int members,
    required int electedOfficials,
    required int employees,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:transportkartan/data/enums/union.dart';
// import 'package:uuid/uuid.dart';

// class Company {
//   final String name;
//   final String description;
//   final UnionType? union;
//   final int totalEmployees;

//   final String id;
//   final String? logoUrl;
//   final String? websiteUrl;
//   final String? facebookUrl;
//   final String orgNumber;
//   final String? headquarterAddress;
//   final List<Site>? sites;

//   Company({
//     required this.description,
//     required this.totalEmployees,
//     required this.name,
//     required this.orgNumber,
//     this.facebookUrl,
//     this.headquarterAddress,
//     id,
//     this.logoUrl,
//     this.sites,
//     this.union,
//     this.websiteUrl,
//   }) : id = id ?? const Uuid().v4();

//   factory Company.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;

//     return Company(
//       name: data['name'] ?? '',
//       description: data['description'] ?? '',
//       union: data['union'] != '' ? UnionType.values.firstWhere((element) => element.name == data['union']) : null,
//       totalEmployees: data['employees'] ?? 0,
//       id: data['id'] ?? '',
//       logoUrl: data['logoUrl'] ?? '',
//       websiteUrl: data['websiteUrl'] ?? '',
//       facebookUrl: data['facebookUrl'] ?? '',
//       orgNumber: data['orgNumber'] ?? '',
//       sites: data['sites'] != null ? List<Site>.from(data['sites'].map((x) => Site.fromMap(x))) : [],
//       headquarterAddress: data['headquarterAddress'] ?? '',
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'description': description,
//       'union': union?.name,
//       'employees': totalEmployees,
//       'id': id,
//       'logoUrl': logoUrl,
//       'websiteUrl': websiteUrl,
//       'facebookUrl': facebookUrl,
//       'orgNumber': orgNumber,
//       'headquarterAddress': headquarterAddress,
//       'sites': sites?.map((x) => x.toMap()).toList() ?? '',
//     };
//   }

//   Company copyWith({
//     String? name,
//     String? description,
//     UnionType? union,
//     int? totalEmployees,
//     String? id,
//     String? logoUrl,
//     String? websiteUrl,
//     String? facebookUrl,
//     String? orgNumber,
//     String? headquarterAddress,
//     List<Site>? sites,
//   }) {
//     return Company(
//       name: name ?? this.name,
//       description: description ?? this.description,
//       union: union ?? this.union,
//       totalEmployees: totalEmployees ?? this.totalEmployees,
//       id: id ?? this.id,
//       logoUrl: logoUrl ?? this.logoUrl,
//       websiteUrl: websiteUrl ?? this.websiteUrl,
//       facebookUrl: facebookUrl ?? this.facebookUrl,
//       orgNumber: orgNumber ?? this.orgNumber,
//       headquarterAddress: headquarterAddress ?? this.headquarterAddress,
//       sites: sites ?? this.sites,
//     );
//   }
// }

// class Site {
//   final String siteId;
//   final int members;
//   final int electedOfficials;
//   final int employees;

//   Site({
//     required this.siteId,
//     required this.members,
//     required this.electedOfficials,
//     required this.employees,
//   });

//   toMap() {
//     return {
//       'siteId': siteId,
//       'members': members,
//       'electedOfficials': electedOfficials,
//       'employees': employees,
//     };
//   }

//   factory Site.fromMap(Map<String, dynamic> data) {
//     return Site(
//       siteId: data['siteId'] ?? '',
//       members: data['members'] ?? 0,
//       electedOfficials: data['electedOfficials'] ?? 0,
//       employees: data['employees'] ?? 0,
//     );
//   }

//   Site copyWith({
//     String? siteId,
//     int? members,
//     int? electedOfficials,
//     int? employees,
//   }) {
//     return Site(
//       siteId: siteId ?? this.siteId,
//       members: members ?? this.members,
//       electedOfficials: electedOfficials ?? this.electedOfficials,
//       employees: employees ?? this.employees,
//     );
//   }
// }
