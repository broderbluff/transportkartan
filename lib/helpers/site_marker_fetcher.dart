import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/site_model.dart';

SiteMarker? findSiteMarkerByKey(Key key, List<SiteMarker> listOfMarker) {
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
