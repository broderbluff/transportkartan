import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/site_model.dart';

SiteMarker? findSiteMarkerByKey(Key key, List<SiteMarker> listOfMarker) {
  try {
    return listOfMarker.firstWhere((marker) {
      return '[<\'${marker.id}\'>]' == key.toString();
    });
  } catch (e) {
    return null;
  }
}
