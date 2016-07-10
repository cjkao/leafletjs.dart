@JS('')
library leafletjs.circle;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../lat.lng.bounds.dart';

@JS('L.circle')
class Circle {
  ///  constructor
  external Circle([options]);

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
