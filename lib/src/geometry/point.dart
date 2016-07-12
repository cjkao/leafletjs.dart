@JS()
library leafletjs.point;

import "package:js/js.dart";

@JS("L.point")
class Point {
  external num get x;
  external num get y;

  ///
  ///Creates a Point object with the given x and y coordinates. If optional round is set to true, rounds the x and y values.
  ///
  external Point(num x, num y, [bool round]);

  /// Returns the result of addition of the current and the given points.
  external Point add(Point otherPoint);

  ///	 Returns a copy of the current point.
  external Point clone();

  /// subtract(otherPoint: Point): Point
  /// Returns the result of subtraction of the given point from the current.
  external Point subtract(Point point);

  ///	Returns the result of division of the current point by the given number.
  external divideBy(num number);
  // @method multiplyBy(num: Number): Point
  // Returns the result of multiplication of the current point by the given number.
  external multiplyBy(num number);

  // @method scaleBy(scale: Point): Point
  // Multiply each coordinate of the current point by each coordinate of
  // `scale`. In linear algebra terms, multiply the point by the
  // [scaling matrix](https://en.wikipedia.org/wiki/Scaling_%28geometry%29#Matrix_representation)
  // defined by `scale`.
  external Point scaleBy(Point scale);

  // @method unscaleBy(scale: Point): Point
  // Inverse of `scaleBy`. Divide each coordinate of the current point by
  // each coordinate of `scale`.
  external unscaleBy(Point point);

  // @method round(): Point
  // Returns a copy of the current point with rounded coordinates.
  external Point round();
  // @method floor(): Point
  // Returns a copy of the current point with floored coordinates (rounded down).
  external Point floor();

  // @method ceil(): Point
  // Returns a copy of the current point with ceiled coordinates (rounded up).
  external Point ceil();
  // @method distanceTo(otherPoint: Point): Number
  // Returns the cartesian distance between the current and the given points.
  external num distanceTo(Point point);
  // @method equals(otherPoint: Point): Boolean
  // Returns `true` if the given point has the same coordinates.
  external bool equals(Point point);

  // @method contains(otherPoint: Point): Boolean
  // Returns `true` if both coordinates of the given point are less than the corresponding current point coordinates (in absolute values).
  external bool contains(Point point);

  external String toString();
}
