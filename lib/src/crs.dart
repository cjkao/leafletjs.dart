@JS()
library leafletjs.crs;

import "package:js/js.dart";
import 'point.dart';
import 'lat.lng.dart';
import 'bounds.dart';
import 'transformation.dart';
import 'projection.dart';

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
@JS()
abstract class ICRS {
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

  /// @property infinite: Boolean = false
  /// If true, the coordinate space will be unbounded (infinite in both axes)
  external bool get infinite;
  external void set infinite(bool _);

  // @method wrapLatLng(latlng: LatLng): LatLng
  // Returns a `LatLng` where lat and lng has been wrapped according to the
  // CRS's `wrapLat` and `wrapLng` properties, if they are outside the CRS's bounds.
  external wrapLatLng(LatLng latlng);
}

///
/// move L.CRS to library cause Chrome error
///
/// A simple CRS that maps longitude and latitude into `x` and `y` directly.
/// May be used for maps of flat surfaces (e.g. game maps). Note that the `y`
/// axis should still be inverted (going from bottom to top).
///
@JS("L.CRS.Simple")
@anonymous
class CrsSimple extends ICRS {
  external Transformation get transformation;
  external LonLat get projection;
  external num distance(LatLng latlng1, LatLng latlng2);
}

/*
 * @namespace CRS
 * @crs L.CRS.Earth
 *
 * Serves as the base for CRS that are global such that they cover the earth.
 * Can only be used as the base for other CRS and cannot be used directly,
 * since it does not have a `code`, `projection` or `transformation`.
 */
@JS('L.CRS.Earth')
@anonymous
class CrsEarth extends ICRS {
  external List<num> get wrapLng;
  external num get R;
  external num distance(LatLng latlng1, LatLng latlng2);
}

/*
 * @namespace CRS
 * @crs L.CRS.EPSG3857
 *
 * The most common CRS for online maps, used by almost all free and commercial
 * tile providers. Uses Spherical Mercator projection. Set in by default in
 * Map's `crs` option.
 */
@JS('L.CRS.EPSG3857')
@anonymous
class CrsEPSG3857 extends CrsEarth {
  external String get code; //: 'EPSG:3857',
  external void set code(_); //: 'EPSG:3857',

  external SphericalMercator get projection; //: L.Projection.SphericalMercator,

  external Transformation get transformation; //: (function () {

}

@JS('L.CRS.EPSG900913')
@anonymous
class CrsEPSG900913 extends CrsEPSG3857 {}

/*
 * @namespace CRS
 * @crs L.CRS.EPSG4326
 *
 * A common CRS among GIS enthusiasts. Uses simple Equirectangular projection.
 */
@JS('L.CRS.EPSG4326')
@anonymous
class CrsEPSG4326 extends CrsEarth {}

@JS("L.CRS.Simple")
external CrsSimple get Simple;

@JS("L.CRS.Earth")
external CrsEarth get Earth;

@JS("L.CRS.EPSG3857")
external CrsEPSG3857 get EPSG3857;

@JS("L.CRS.EPSG900913")
external CrsEPSG900913 get EPSG900913;
