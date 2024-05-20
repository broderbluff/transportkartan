import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/crud/site_firestore_cubit.dart';
import 'package:transportkartan/data/models/state/site_firestore_state.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/helpers/site_marker_to_markers.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_popup/popup_view.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<LatLng> builtPoints = [];
  double markerAngle = 0.0;
  LatLng markerPoint = const LatLng(0.0, 0.0);
  late List<LatLng> points;
  bool isReversed = false;
  ValueNotifier<LatLng> latLng = ValueNotifier<LatLng>(const LatLng(0.0, 0.0));

  @override
  void initState() {
    points = [
      const LatLng(62.3875, 16.325556),
      const LatLng(53.3875, 16.325556),
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<MapControllerCubit, MapState>(
        builder: (context, state) {
          return FlutterMap(
              mapController: state.mapController,
              options: const MapOptions(
                initialCenter: LatLng(62.3875, 16.325556),
                initialZoom: 5,
              ),
              children: [
                TileLayer(
                  tileProvider: CancellableNetworkTileProvider(),
                  urlTemplate:
                      'https://maps.geoapify.com/v1/tile/osm-bright-smooth/{z}/{x}/{y}.png?apiKey=fb622ee8c7a048f1b766548572313f5a',
                  userAgentPackageName: 'se.transport.trasnportkartan',
                ),
                // PolylineLayer(
                //   polylineCulling: true,
                //   polylines: state.polylinePoints,
                // ),
                BlocBuilder<SiteFirestoreCubit, SiteFirestoreState>(
                  bloc: context.read<SiteFirestoreCubit>()..fetchAllSites(),
                  builder: (context, firestoreState) {
                    if (firestoreState is SiteInitialState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (firestoreState is AllSites) {
                      return PopupMarkerLayer(
                        options: PopupMarkerLayerOptions(
                          popupController: state.popupController,
                          markers: siteMarkerToMarkers(firestoreState.sitesList),
                          markerTapBehavior: MarkerTapBehavior.togglePopupAndHideRest(),
                          markerCenterAnimation:
                              const MarkerCenterAnimation(curve: Curves.easeOut, duration: Duration(milliseconds: 300)),
                          popupDisplayOptions: PopupDisplayOptions(
                            snap: PopupSnap.markerRight,
                            animation: const PopupAnimation.fade(duration: Duration(milliseconds: 200)),
                            builder: (BuildContext context, Marker marker) => Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 33,
                                      ),
                                      Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                MapPopup(marker, firestoreState.sitesList),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    return const Text('Error');
                  },
                ),
              ]);
        },
      );
    });
  }
}
