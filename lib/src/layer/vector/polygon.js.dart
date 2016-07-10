@JS('')
library leafletjs.polygon;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';
import 'polyline.js.dart';
import '../../point.dart';
import '../../lat.lng.dart';
import '../layer.popup.js.dart';

///
/// @class Polygon
///
/// @aka L.Polygon
///
/// @inherits Polyline
///
/// A class for drawing polygon overlays on a map. Extends `Polyline`.
///
/// Note that points you pass when creating a polygon shouldn't have an additional last point equal to the first one — it's better to filter out such points.
///
///
/// @example
///
/// ```js
/// // create a red polygon from an array of LatLng points
/// var latlngs = [[-111.03, 41],[-111.04, 45],[-104.05, 45],[-104.05, 41]];
///
/// var polygon = L.polygon(latlngs, {color: 'red'}).addTo(map);
///
/// // zoom the map to the polygon
/// map.fitBounds(polygon.getBounds());
/// ```
///
/// You can also pass an array of arrays of latlngs, with the first array representing the outer shape and the other arrays representing holes in the outer shape:
///
/// ```js
/// var latlngs = [
///   [[-111.03, 41],[-111.04, 45],[-104.05, 45],[-104.05, 41]], // outer ring
///   [[-108.58,37.29],[-108.58,40.71],[-102.50,40.71],[-102.50,37.29]] // hole
/// ];
/// ```
///
/// Additionally, you can pass a multi-dimensional array to represent a MultiPolygon shape.
///
/// ```js
/// var latlngs = [
///   [ // first polygon
///     [[-111.03, 41],[-111.04, 45],[-104.05, 45],[-104.05, 41]], // outer ring
///     [[-108.58,37.29],[-108.58,40.71],[-102.50,40.71],[-102.50,37.29]] // hole
///   ],
///   [ // second polygon
///     [[-109.05, 37],[-109.03, 41],[-102.05, 41],[-102.04, 37],[-109.05, 38]]
///   ]
/// ];
@JS('L.polygon')
class Polygon extends Polyline {
  ///  constructor
  /// latlng is not options
  external factory Polygon([List<LatLng> latlngs, PolylineOptions options]);

  external bool isEmpty();

  external LatLng getCenter();
}

@JS()
@anonymous
class PolygonOptions {
  /// default [fill] : true
  external bool get fill;
  external void set fill(bool _);

  external factory PolygonOptions({bool fill});
}
