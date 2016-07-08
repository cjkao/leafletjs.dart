@JS()
library leafletjs.projection;

import "package:js/js.dart";
import 'point.dart';
import 'lat.lng.dart';
import 'bounds.dart';

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
  @JS("project")
  external static Point project(LatLng latlng);
  @JS("unproject")
  external static LatLng unproject(Point p);
  @JS()
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

///
///
/// @class CRS
/// @aka L.CRS
/// Abstract class that defines coordinate reference systems for projecting
/// geographical points into pixel (screen) coordinates and back (and to
/// coordinates in other units for WMS services). See
/// [spatial reference system](http://en.wikipedia.org/wiki/Coordinate_reference_system).
///
/// Leaflet defines the most usual CRSs by default. If you want to use a
/// CRS not defined by default, take a look at the
/// [Proj4Leaflet](https://github.com/kartena/Proj4Leaflet) plugin.
////
@JS('L.CRS')
class CRS {
  ///
  /// Projects geographical coordinates into pixel coordinates for a given zoom.
  ///
  external Point latLngToPoint(LatLng latlng, num zoom);

  ///
  /// The inverse of `latLngToPoint`. Projects pixel coordinates on a given
  /// zoom into geographical coordinates.
  ///
  external LatLng pointToLatLng(Point point, num zoom);

  ///
  /// Projects geographical coordinates into coordinates in units accepted for
  /// this CRS (e.g. meters for EPSG:3857, for passing it to WMS services).
  ///
  external Point project(LatLng latlng);

  ///
  /// Given a projected coordinate returns the corresponding LatLng.
  /// The inverse of `project`.
  ///
  external LatLng unproject(Point point);

  ///
  /// Returns the scale used when transforming projected coordinates into
  /// pixel coordinates for a particular zoom. For example, it returns
  /// `256 * 2^zoom` for Mercator-based CRS.
  ///
  external num scale(num zoom);

  // @method zoom(scale: Number): Number
  // Inverse of `scale()`, returns the zoom level correspondingto a scale
  // factor of `scale`.
  external num zoom(num scale);

  // @method getProjectedBounds(zoom): Bounds
  // Returns the projection's bounds scaled and transformed for the provided `zoom`.
  external Bounds getProjectedBounds(num zoom);

  // @property code: String
  // Standard code name of the CRS passed into WMS services (e.g. `'EPSG:3857'`)
  //
  // @property wrapLng: Number[]
  // An array of two numbers defining whether the longitude coordinate axis
  // wraps around a given range and how. Defaults to `[-180, 180]` in most
  // geographical CRSs.
  //
  // @property wrapLat: Number[]
  // Like `wrapLng`, but for the latitude axis.

  // wrapLng: [min, max],
  // wrapLat: [min, max],

  // @property infinite: Boolean = false
  // If true, the coordinate space will be unbounded (infinite in both axes)
  external bool get infinite;
  external void set infinite(bool _);

  // @method wrapLatLng(latlng: LatLng): LatLng
  // Returns a `LatLng` where lat and lng has been wrapped according to the
  // CRS's `wrapLat` and `wrapLng` properties, if they are outside the CRS's bounds.
  external wrapLatLng(LatLng latlng);
}
