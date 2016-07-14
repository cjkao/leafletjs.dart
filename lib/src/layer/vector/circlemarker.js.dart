@JS('')
library leafletjs.circlemarker;

import 'package:js/js.dart';

import '../../lat.lng.dart';
import 'path.js.dart';

@JS('L.circleMarker')
class CircleMarker extends Path {
  ///  constructor
  /// latlng is not optional
  external CircleMarker([LatLng latlng, CircleMarkerOptions options]);

  /// @method setLatLng(latLng: LatLng): this
  /// Sets the position of a circle marker to a new location.
  external CircleMarker setLatLng(LatLng latLng);

  /// @method getLatLng(): LatLng
  /// Returns the current geographical position of the circle marker
  external LatLng getLatLng();

  /// @method setRadius(radius: Number): this
  /// Sets the radius of a circle marker. Units are in pixels.
  external CircleMarker setRadius(num radius);

  /// @method getRadius(): Number
  /// Returns the current radius of the circle
  external num getRadius();

  external dynamic setStyle(options);
}

@JS()
@anonymous
class CircleMarkerOptions extends PathOptions {
  /// default [fill] : true
  external bool get fill;
  external void set fill(bool _);

  /// default [radius] : 10
  external num get radius;
  external void set radius(num _);

  external factory CircleMarkerOptions(
      {num radius,
      bool stroke,
      String color,
      num weight,
      num opacity,
      String lineCap,
      String lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      num fillOpacity,
      String fillRule,
      bool interactive});
}
