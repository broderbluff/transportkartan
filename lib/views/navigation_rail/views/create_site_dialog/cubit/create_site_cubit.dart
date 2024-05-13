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
      ),
    );
  }

  void openSite(SiteMarker marker) {
    emit(marker);
  }
}
