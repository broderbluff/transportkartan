import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/marker_type.dart';
import 'package:transportkartan/data/models/marker_model.dart';

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

  void updateSiteCoordinates(List<double> coordinates) {
    emit(state.copyWith(coordinates: coordinates));
  }

  void updateSiteDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void resetState() {
    emit(_initState);
  }
}
