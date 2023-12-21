import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/data/mockdata/mockdata.dart';
import 'package:transportkartan/helpers/site_marker_fetcher.dart';

class MapControllerCubit extends Cubit<MapState> {
  late PopupController popupController;
  late MapController mapController;
  late List<Polyline> polylinePoints;

  MapControllerCubit() : super(MapState(MapController(), PopupController(), List<Polyline>.empty())) {
    popupController = PopupController();
    mapController = MapController();
    polylinePoints = [];

    emit(MapState(mapController, popupController, polylinePoints));
  }

  void triggerControllers(LatLng latLng, Marker marker) {
    popupController.hideAllPopups();
    var polypoints = findSiteMarkerByKey(marker.key!, listOfMarker)?.polylinePoints ?? [];
    emit(MapState(state.mapController, popupController, polypoints));
    mapController.move(latLng, 12);
    popupController.togglePopup(marker);
    emit(MapState(mapController, popupController, polypoints));
  }

  void hidePopup() {
    popupController.hideAllPopups();
    emit(MapState(state.mapController, popupController, polylinePoints));
  }
}

class MapState extends Equatable {
  final MapController mapController;
  final PopupController popupController;
  final List<Polyline> polylinePoints;
  const MapState(this.mapController, this.popupController, this.polylinePoints);

  @override
  List<Object> get props => [mapController, popupController, polylinePoints];
}
