import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/site_model.dart';

SiteMarker? findSiteMarkerByKey(Key key, List<SiteMarker> listOfMarker) {
  try {
    final keyString = key.toString();
    final cleanedKeyString = keyString.replaceAll(RegExp(r'[<>\[\]]'), '');
    return listOfMarker.firstWhere((marker) {
      return cleanedKeyString == marker.id;
    });
  } catch (e) {
    return null;
  }
}
