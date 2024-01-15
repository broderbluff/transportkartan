import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';

Workplace? getCompanySite(
  Company company,
  String siteId,
) {
  final companySite = company.workplaces?.firstWhere(
    (element) => element.siteId == siteId,
    orElse: () => Workplace(
      siteId: siteId,
      members: 0,
      electedOfficials: 0,
      employees: 0,
    ),
  );
  return companySite;
}

List<Company> getCompaniesFromCompanyIdOnSite(List<CompanyId> companyIds, List<Company> companies) {
//Match companyIds with companies.id and return companies
  final companiesOnSite = companies.where((company) => companyIds.any((companyId) => companyId == company.id)).toList();

  return companiesOnSite;
}
