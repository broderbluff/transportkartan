import 'package:transportkartan/data/models/company_model.dart';

int calculateTotalEmployees(List<Company> companies) {
  int totalEmployees = 0;
  for (var company in companies) {
    totalEmployees += company.totalEmployees;
  }
  return totalEmployees;
}
