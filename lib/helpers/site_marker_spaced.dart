import 'package:latlong2/latlong.dart';
import 'package:transportkartan/data/models/marker_model.dart';

List<SiteMarker> arrangeMarkers(List<SiteMarker> markers) {
  final Map<LatLng, List<SiteMarker>> groupedMarkers = {};

  // Group markers by their coordinates
  for (final marker in markers) {
    final latLng = LatLng(marker.coordinates[0], marker.coordinates[1]);
    if (groupedMarkers.containsKey(latLng)) {
      groupedMarkers[latLng]!.add(marker);
    } else {
      groupedMarkers[latLng] = [marker];
    }
  }

  // Adjust lng values for markers within each group
  groupedMarkers.forEach((latLng, group) {
    if (group.length > 1) {
      final double initialLng = latLng.longitude;
      const double spacing = 0.0010; // Adjust this value as needed

      for (int i = 0; i < group.length; i++) {
        final double adjustedLng = initialLng + (i * spacing);
        group[i] = group[i].copyWith(coordinates: [latLng.latitude, adjustedLng]);
      }
    }
  });

  // Flatten the grouped markers into a single list
  final List<SiteMarker> arrangedMarkers = groupedMarkers.values.expand((group) => group).toList();

  return arrangedMarkers;
}
