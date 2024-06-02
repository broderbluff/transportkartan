import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_state.dart';
import 'package:uuid/uuid.dart';

class CreateSiteCubit extends Cubit<CreateSiteState> {
  static final Site _initState = Site(
    type: SiteType.combiTerminal,
    name: '',
    id: const Uuid().v4(),
    coordinates: [55, 13],
    description: '',
    unit: 0,
    unitType: null,
  );
  WorkplaceRepository repository = WorkplaceRepository();
  CreateSiteCubit() : super(CreateSiteState(site: _initState, workplaces: []));

  // void updateSiteType(SiteType type) {
  //   emit(state.copyWith(type: type));
  // }

  // void updateSiteName(String name) {
  //   emit(state.copyWith(name: name));
  // }

  // void updateSiteUnit(String unit) {
  //   emit(state.copyWith(unit: int.tryParse(unit) ?? 0));
  // }

  // void updateSiteUnitType(UnitType unitType) {
  //   emit(state.copyWith(unitType: unitType));
  // }

  // void updateSiteCoordinates(List<double> coordinates) {
  //   emit(state.copyWith(coordinates: coordinates));
  // }

  // void updateSiteDescription(String description) {
  //   emit(state.copyWith(description: description));
  // }

  void updateSiteBName(String newValue) {}

  void addWorkplace(Workplace workplace) {
    CreateSiteState currentState = state;
    emit(
      currentState.copyWith(
        workplaces: [...currentState.workplaces, workplace],
      ),
    );
  }

  void resetState() {
    emit(
      CreateSiteState(
        site: _initState,
        workplaces: [],
      ),
    );
  }

  void openSite(Site site) async {
    print('Site name: ${site.name}');
    emit(CreateSiteState(site: site, workplaces: []));

    List<Workplace> workplaces = await repository.fetchWorkplacesBySiteId(site.id!);

    CreateSiteState currentState = state;
    emit(currentState.copyWith(site: site, workplaces: workplaces));
  }
}
