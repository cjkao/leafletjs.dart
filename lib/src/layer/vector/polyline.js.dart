@JS('')
library leafletjs.polyline;

import '../../map.dart' as L;
import 'dart:html' as html;
import 'package:js/js.dart';

@JS('L.polyline')
class Polyline {
  ///  constructor
  external Polyline([options]);

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
class PolylineOptions {
  /// default [smoothFactor] : 1.0
  external num get smoothFactor;
  external void set smoothFactor(num _);

  /// default [noClip] : false
  external bool get noClip;
  external void set noClip(bool _);

  external factory PolylineOptions({num smoothFactor, bool noClip});
}
