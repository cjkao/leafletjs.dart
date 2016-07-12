@JS()
library leafletjs.transformation;

import "package:js/js.dart";
import '../geometry/point.dart';

////
/// @class Transformation
/// @aka L.Transformation
///
/// Represents an affine transformation: a set of coefficients `a`, `b`, `c`, `d`
/// for transforming a point of a form `(x, y)` into `(a///x + b, c///y + d)` and doing
/// the reverse. Used by Leaflet in its projections code.
///
/// @example
///
/// ```dart
/// var transformation = new Transformation(2, 5, -1, 10),
/// 	p = new Point(1, 2),
/// 	p2 = transformation.transform(p), //  L.point(7, 8)
/// 	p3 = transformation.untransform(p2); //  L.point(1, 2)
/// ```
////
@JS("L.Transformation")
class Transformation {
  /// factory new L.Transformation(a: Number, b: Number, c: Number, d: Number)
  /// Creates a `Transformation` object with the given coefficients
  external Transformation(num a, num b, num c, num d);

  /// @method transform(point: Point, scale?: Number)
  /// Returns a transformed point, optionally multiplied by the given scale.
  /// Only accepts real `L.Point` instances, not arrays.
  external static Point transform(Point point, [num scale]); // (Point, Number) -> Point

  /// @method untransform(point: Point, scale?: Number)
  /// Returns the reverse transformation of the given point, optionally divided
  /// by the given scale. Only accepts real `L.Point` instances, not arrays.
  external Point untransform(Point point, [num scale]);
}
