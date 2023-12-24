import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';
import 'package:uuid/uuid.dart';

class CreateSiteCubit extends Cubit<SiteMarker> {
  static final SiteMarker _initState = SiteMarker(
    type: SiteType.combiTerminal,
    name: '',
    coordinates: [0, 0],
    description: '',
    companies: [],
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

  void addCompany(CompanyId companyId) {
    emit(state.copyWith(companies: [...state.companies, companyId]));
  }

  void removeCompany(CompanyId company) {
    emit(
      state.copyWith(
        companies: state.companies.where((element) => element != company).toList(),
      ),
    );
  }

  void resetState() {
    emit(
      state.copyWith(
        type: SiteType.combiTerminal,
        id: const Uuid().v4(),
        name: '',
        coordinates: [0, 0],
        description: '',
      ),
    );
  }

  void openSite(SiteMarker marker) {
    emit(marker);
  }
}
