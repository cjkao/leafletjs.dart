@JS('')
library leafletjs.circle;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../lat.lng.bounds.dart';
import 'circlemarker.js.dart';
import '../../lat.lng.dart';

@JS('L.circle')
class Circle extends CircleMarker {
  ///  constructor
  // @factory L.circle(latlng: LatLng, options?: Circle options)
  // Instantiates a circle object given a geographical point, and an options object
  // which contains the circle radius.
  // @alternative
  // @factory L.circle(latlng: LatLng, radius: Number, options?: Circle options)
  // Obsolete way of instantiating a circle, for compatibility with 0.7.x code.
  // Do not use in new applications or plugins.
  external Circle(LatLng latlng, [CircleMarkerOptions options]);

  /// @method setRadius(radius: Number): this
  /// Sets the radius of a circle. Units are in meters.
  external Circle setRadius(num radius);

  /// @method getRadius(): Number
  /// Returns the current radius of a circle. Units are in meters.
  external num getRadius();

  /// @method getBounds(): LatLngBounds
  /// Returns the `LatLngBounds` of the path.
  external LatLngBounds getBounds();
}
