@JS()
library leafletjs.transformatin;

import "package:js/js.dart";
import 'point.dart';

@JS("L.Transformation")
class Transformatin {
  // @method transform(point: Point, scale?: Number)
  // Returns a transformed point, optionally multiplied by the given scale.
  // Only accepts real `L.Point` instances, not arrays.
  external transform(Point point, [num scale]); // (Point, Number) -> Point

	// @method untransform(point: Point, scale?: Number)
	// Returns the reverse transformation of the given point, optionally divided
	// by the given scale. Only accepts real `L.Point` instances, not arrays.
	external untransform (Point point, [num scale]); 
}
