import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/data/models/site_model.dart';

class MapControllerCubit extends Cubit<MapState> {
  late PopupController popupController;
  late MapController mapController;
  late List<Polyline> polylinePoints;

  MapControllerCubit()
      : super(MapState(
          MapController(),
          PopupController(),
        )) {
    popupController = PopupController();
    mapController = MapController();
    polylinePoints = [];

    emit(MapState(mapController, popupController));
  }

  void triggerControllers(LatLng latLng, Marker marker, List<SiteMarker> listOfMarker) {
    popupController.hideAllPopups();
    // var polypoints = findSiteMarkerByKey(marker.key!, listOfMarker)?.polylinePoints ?? [];
    emit(MapState(state.mapController, popupController));
    mapController.move(latLng, 12);
    popupController.togglePopup(marker);
    emit(MapState(mapController, popupController));
  }

  void hidePopup() {
    popupController.hideAllPopups();
    emit(MapState(state.mapController, popupController));
  }
}

class MapState extends Equatable {
  final MapController mapController;
  final PopupController popupController;
  // final List<Polyline> polylinePoints;
  const MapState(this.mapController, this.popupController);

  @override
  List<Object> get props => [mapController, popupController];
}
