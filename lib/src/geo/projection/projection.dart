@JS()
library leafletjs.projection;

import "package:js/js.dart";
import '../../geometry/point.dart';
import '../../lat.lng.dart';
import '../../geometry/bounds.dart';
import '../../geometry/transformation.dart';

///
/// @namespace Projection
/// @section
/// Leaflet comes with a set of already defined Projections out of the box:
///
/// @projection L.Projection.LonLat
///
/// Equirectangular, or Plate Carree projection — the most simple projection,
/// mostly used by GIS enthusiasts. Directly maps `x` as longitude, and `y` as
/// latitude. Also suitable for flat worlds, e.g. game maps. Used by the
/// `EPSG:3395` and `Simple` CRS.
////
@JS("L.Projection.LonLat")
class LonLat {
  external static Point project(LatLng latlng);
  external static LatLng unproject(Point p);
  external static Bounds get bounds;
}

////
/// @namespace Projection
/// @projection L.Projection.SphericalMercator
///
/// Spherical Mercator projection — the most common projection for online maps,
/// used by almost all free and commercial tile providers. Assumes that Earth is
/// a sphere. Used by the `EPSG:3857` CRS.
////
@JS('L.Projection.SphericalMercator')
class SphericalMercator {
  external static num get R;
  external static void set R(_);
  external static num get MAX_LATITUDE;
  external static void set MAX_LATITUDE(_);
  external static Point project(LatLng latlng);
  external static LatLng unproject(Point p);
  external static Bounds get bounds;
}
