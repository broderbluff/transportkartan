import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:uuid/uuid.dart';

class CreateCompanyCubit extends Cubit<Company> {
  static final Company _initState = Company(description: '', name: '', totalEmployees: 0, orgNumber: '', sites: []);
  CreateCompanyCubit() : super(_initState);

  void updateUnionType(UnionType union) {
    emit(state.copyWith(union: union));
  }

  void updateCompanyName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateOrgNumber(String orgNumber) {
    emit(state.copyWith(orgNumber: orgNumber));
  }

  void updateCompanySites(Site site) {
    emit(state.copyWith(sites: [site]));
  }

  void updateTotalEmployees(String employees) {
    emit(state.copyWith(totalEmployees: int.tryParse(employees) ?? 0));
  }

  void updateCompanyDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void resetState() {
    emit(
      state.copyWith(id: const Uuid().v4(), name: '', description: '', sites: List.empty()),
    );
  }
}
