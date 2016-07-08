@JS()
library leafletjs.lat.lng;

import "package:js/js.dart";
import 'lat.lng.bounds.dart';

@JS("L.latLng")
class LatLng {
  /// isArray have to be patched
  ///
  /// @factory L.latLng(latitude: Number, longitude: Number, altitude?: Number): LatLng
  /// Creates an object representing a geographical point with the given latitude and longitude (and optionally altitude).
  ///
  /// @alternative
  /// @factory L.latLng(coords: Array): LatLng
  /// Expects an array of the form `[Number, Number]` or `[Number, Number, Number]` instead.
  ///
  /// @alternative
  /// @factory L.latLng(coords: Object): LatLng
  /// Expects an plain object of the form `{lat: Number, lng: Number}` or `{lat: Number, lng: Number, alt: Number}` instead.
  external LatLng(dynamic latitudeOrArrayOrCoords, [dynamic longitude, num altitude]);

  ///
  ///Latitude in degrees.
  ///
  external double get lat;

  ///
  ///Longitude in degrees.
  ///
  external double get lng;
  external set lat(double lat);
  external set lng(double lng);

  ///
  ///Returns the distance (in meters) to the given LatLng calculated using the Haversine formula. See description on wikipedia.
  ///
  external num distanceTo(LatLng otherLatlng);

  ///
  /// Returns a new `LatLngBounds` object in which each boundary is `sizeInMeters` meters apart from the `LatLng`.
  ///
  external LatLngBounds toBounds(num sizeInMeters);

  external LatLng clone();

  ///
  ///Returns true if the given LatLng point is at the same position (within a small margin of error).
  ///
  external bool equals(LatLng otherLatlng, [num maxMargin]);

  ///
  ///Returns a string representation of the point (for debugging purposes).
  ///
  external String toString();

  ///
  ///Returns a new LatLng object with the longitude wrapped around left and right boundaries (-180 to 180 by default).
  ///
  external LatLng wrap(num left, num right);
}
