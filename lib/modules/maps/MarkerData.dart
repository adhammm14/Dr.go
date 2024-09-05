
import 'package:latlong2/latlong.dart';

class MarkerData {
  final LatLng position;   // The geographical coordinates (latitude and longitude)
  final String title;      // The title of the marker (e.g., the name of a place)
  final String description; // Additional information or details about the marker

  MarkerData({
    required this.position,
    required this.title,
    required this.description,
  });
}
