enum CompanyType {
  mainCompany('Företag'),
  subContractor('Underentreprenör'),
  staffingCompany('Bemanningsföretag'),
  carrierCompany('Transportör'),
  securityCompany('Bevakningsföretag');

  const CompanyType(this.name);
  final String name;
}
