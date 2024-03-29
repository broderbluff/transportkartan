import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';

class CompanyOnSiteRowCubit extends Cubit<Workplace> {
  static const Workplace _initState = Workplace(
    siteId: '',
    members: 0,
    electedOfficials: 0,
    employees: 0,
    companyType: null,
  );
  CompanyOnSiteRowCubit() : super(_initState);

  void updateSiteId(String siteId) {
    emit(state.copyWith(siteId: siteId));
  }

  void updateMembers(int members) {
    emit(state.copyWith(members: members));
  }

  void updateElectedOfficials(int electedOfficials) {
    emit(state.copyWith(electedOfficials: electedOfficials));
  }

  void updateEmployees(int employees) {
    emit(state.copyWith(employees: employees));
  }

  void updateCompanyType(CompanyType companyType) {
    emit(state.copyWith(companyType: companyType));
  }

  void resetState() {
    emit(_initState);
  }

  void updateState(Workplace site) {
    emit(site);
  }
}
