@JS('')
library leafletjs.rectangle;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import '../../lat.lng.bounds.dart';
import 'polyline.js.dart';
import 'polygon.js.dart';

///
/// A class for drawing rectangle overlays on a map. Extends `Polygon`.
///
/// @example
///
/// ```js
/// // define rectangle geographical bounds
/// var bounds = [[54.559322, -5.767822], [56.1210604, -3.021240]];
///
/// // create an orange rectangle
/// L.rectangle(bounds, {color: "#ff7800", weight: 1}).addTo(map);
///
/// // zoom the map to the rectangle bounds
/// map.fitBounds(bounds);
/// ```
@JS('L.rectangle')
class Rectangle extends Polygon {
  ///  constructor
  external factory Rectangle(LatLngBounds latlngbound, [PolylineOptions options]);

  /// @method setBounds(latLngBounds: LatLngBounds): this
  /// Redraws the rectangle with the passed bounds.
  external Rectangle setBounds(LatLngBounds latLngBounds);
}
