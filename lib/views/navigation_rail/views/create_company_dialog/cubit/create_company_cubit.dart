import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:uuid/uuid.dart';

class CreateCompanyCubit extends Cubit<Company> {
  static final Company _initState = Company(
    id: const Uuid().v4(),
    description: '',
    name: '',
    totalEmployees: 0,
    orgNumber: '',
  );
  CreateCompanyCubit() : super(_initState);

  void updateUnionType(UnionType union) {
    emit(state.copyWith(union: union));
  }

  void updateCompanyName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateWebsiteUrl(String url) {
    emit(state.copyWith(websiteUrl: url));
  }

  void updateOrgNumber(String orgNumber) {
    emit(state.copyWith(orgNumber: orgNumber));
  }

  void updateTotalEmployees(String employees) {
    emit(state.copyWith(totalEmployees: int.tryParse(employees) ?? 0));
  }

  void updateCompanyDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void resetState() {
    emit(
      state.copyWith(
          id: const Uuid().v4(),
          name: '',
          description: '',
          totalEmployees: 0,
          orgNumber: '',
          union: null,
          websiteUrl: '',
          logoUrl: '',
          facebookUrl: '',
          headquarterAddress: ''),
    );
  }

  updateHeadQuartersAdress(String text) {
    emit(state.copyWith(headquarterAddress: text));
  }

  updateLogoUrl(String text) {
    emit(state.copyWith(logoUrl: text));
  }

  updateFacebookUrl(String text) {
    emit(state.copyWith(facebookUrl: text));
  }

  void openCompany(Company company) {
    emit(company);
  }

  updateLinkedInUrl(String text) {}
}
