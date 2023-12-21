import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/helpers/site_marker_spaced.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/data/mockdata/mockdata.dart';

class MarkerCubit extends Cubit<List<Marker>> {
  MarkerCubit() : super(_createMarkers());

  static List<Marker> _createMarkers() {
    return arrangeMarkers(listOfMarker).map((site) {
      return Marker(
        key: ValueKey(site.id),
        point: LatLng(site.coordinates[0], site.coordinates[1]),
        child: SizedBox(
          height: 40,
          width: 40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 8,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SiteTypeIcon(siteType: site.type),
          ),
        ),
      );
    }).toList();
  }
}
