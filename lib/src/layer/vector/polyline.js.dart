@JS('')
library leafletjs.polyline;

import 'package:js/js.dart';
import '../../lat.lng.dart';
import '../../lat.lng.bounds.dart';
import 'path.js.dart';

////
///
/// A class for drawing polyline overlays on a map. Extends `Path`.
///
/// @example
///
/// ```js
/// // create a red polyline from an array of LatLng points
/// var latlngs = [
/// 	[-122.68, 45.51],
/// 	[-122.43, 37.77],
/// 	[-118.2, 34.04]
/// ];
///
/// var polyline = L.polyline(latlngs, {color: 'red'}).addTo(map);
///
/// // zoom the map to the polyline
/// map.fitBounds(polyline.getBounds());
/// ```
///
/// You can also pass a multi-dimensional array to represent a `MultiPolyline` shape:
///
/// ```js
/// // create a red polyline from an array of arrays of LatLng points
/// var latlngs = [
/// 	[[-122.68, 45.51],
/// 	 [-122.43, 37.77],
/// 	 [-118.2, 34.04]],
/// 	[[-73.91, 40.78],
/// 	 [-87.62, 41.83],
/// 	 [-96.72, 32.76]]
/// ];
/// ```
@JS('L.polyline')
class Polyline extends Path {
  Polyline.x() : this();

  ///  constructor
  external Polyline([List<LatLng> latlngs, PolylineOptions options]);

  /// @method getLatLngs(): LatLng[]
  /// Returns an array of the points in the path, or nested arrays of points in case of multi-polyline.
  external List<LatLng> getLatLngs();

  /// @method setLatLngs(latlngs: LatLng[]): this
  /// Replaces all the points in the polyline with the given array of geographical points.
  external Polyline setLatLngs(List<LatLng> latlngs);

  /// @method isEmpty(): Boolean
  /// Returns `true` if the Polyline has no LatLngs.
  external bool isEmpty();

  external dynamic closestLayerPoint(p);

  /// @method getCenter(): LatLng
  /// Returns the center ([centroid](http://en.wikipedia.org/wiki/Centroid)) of the polyline.
  external LatLng getCenter();

  /// @method getBounds(): LatLngBounds
  /// Returns the `LatLngBounds` of the path.
  external LatLngBounds getBounds();

  /// @method addLatLng(latlng: LatLng, latlngs?: LatLng[]): this
  /// Adds a given point to the polyline. By default, adds to the first ring of
  /// the polyline in case of a multi-polyline, but can be overridden by passing
  /// a specific ring as a LatLng array (that you can earlier access with [`getLatLngs`](#polyline-getlatlngs)).
  external Polyline addLatLng(LatLng latlng, [List<LatLng> latlngs]);
}

@JS()
@anonymous
class PolylineOptions extends PathOptions {
  /// default [smoothFactor] : 1.0
  external num get smoothFactor;
  external void set smoothFactor(num _);

  /// default [noClip] : false
  external bool get noClip;
  external void set noClip(bool _);

  external factory PolylineOptions(
      {num smoothFactor,
      bool noClip,
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
