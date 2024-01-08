import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';
import 'package:uuid/uuid.dart';

class CreateSiteCubit extends Cubit<SiteMarker> {
  static final SiteMarker _initState = SiteMarker(
    type: SiteType.combiTerminal,
    name: '',
    id: const Uuid().v4(),
    coordinates: [0, 0],
    description: '',
    unit: 0,
    unitType: null,
    companies: [],
    subContractors: [],
    staffingCompanies: [],
    securityCompanies: [],
  );
  CreateSiteCubit() : super(_initState);

  void updateSiteType(SiteType type) {
    emit(state.copyWith(type: type));
  }

  void updateSiteName(String name) {
    emit(state.copyWith(name: name));
  }

  void updateSiteUnit(String unit) {
    emit(state.copyWith(unit: int.tryParse(unit) ?? 0));
  }

  void updateSiteUnitType(UnitType unitType) {
    emit(state.copyWith(unitType: unitType));
  }

  void updateSiteCoordinates(List<double> coordinates) {
    emit(state.copyWith(coordinates: coordinates));
  }

  void updateSiteDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void addCompany(CompanyId companyId, CompanyType companyType) {
    switch (companyType) {
      case CompanyType.mainCompany:
        emit(state.copyWith(companies: [...state.companies, companyId]));
        break;
      case CompanyType.subContractor:
        emit(state.copyWith(subContractors: [...?state.subContractors, companyId]));
        break;
      case CompanyType.staffingCompany:
        emit(state.copyWith(staffingCompanies: [...?state.staffingCompanies, companyId]));
        break;
      case CompanyType.securityCompany:
        emit(state.copyWith(securityCompanies: [...?state.securityCompanies, companyId]));
        break;

      case CompanyType.carrierCompany:
        emit(state.copyWith(carrierCompanies: [...?state.carrierCompanies, companyId]));
        break;
    }
  }

  void removeCompany(CompanyId company, CompanyType companyType) {
    switch (companyType) {
      case CompanyType.mainCompany:
        emit(state.copyWith(companies: state.companies.where((element) => element != company).toList()));
        break;
      case CompanyType.subContractor:
        emit(state.copyWith(subContractors: state.subContractors?.where((element) => element != company).toList()));
        break;
      case CompanyType.staffingCompany:
        emit(state.copyWith(staffingCompanies: state.staffingCompanies?.where((element) => element != company).toList()));
        break;
      case CompanyType.securityCompany:
        emit(state.copyWith(securityCompanies: state.securityCompanies?.where((element) => element != company).toList()));
        break;
      case CompanyType.carrierCompany:
        emit(state.copyWith(carrierCompanies: state.carrierCompanies?.where((element) => element != company).toList()));
        break;
    }
  }

  void resetState() {
    emit(
      state.copyWith(
        type: SiteType.combiTerminal,
        id: const Uuid().v4(),
        name: '',
        coordinates: [0, 0],
        description: '',
        unit: 0,
        unitType: null,
        companies: [],
        subContractors: [],
        staffingCompanies: [],
        securityCompanies: [],
      ),
    );
  }

  void openSite(SiteMarker marker) {
    emit(marker);
  }
}
