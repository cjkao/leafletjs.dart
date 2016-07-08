@JS()
library leafletjs.transformation;

import "package:js/js.dart";
import 'point.dart';

@JS("L.Transformation")
class Transformation {
  // @method transform(point: Point, scale?: Number)
  // Returns a transformed point, optionally multiplied by the given scale.
  // Only accepts real `L.Point` instances, not arrays.
  external Point transform(Point point, [num scale]); // (Point, Number) -> Point

  // @method untransform(point: Point, scale?: Number)
  // Returns the reverse transformation of the given point, optionally divided
  // by the given scale. Only accepts real `L.Point` instances, not arrays.
  external Point untransform(Point point, [num scale]);
}
