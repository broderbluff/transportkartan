import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/site_model.dart';

Site? findSiteMarkerByKey(Key key, List<Site> listOfMarker) {
  try {
    return listOfMarker.firstWhere((marker) {
      return getCleandKeyString(key) == marker.id;
    });
  } catch (e) {
    return null;
  }
}

String getCleandKeyString(Key key) {
  final keyString = key.toString();
  final cleanedKeyString = keyString.replaceAll(RegExp(r'[<>\[\]]'), '');
  return cleanedKeyString;
}
