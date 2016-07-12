@JS()
library leafletjs.bounds;

import "package:js/js.dart";
import 'point.dart';

///
/// Represents a rectangular area in pixel coordinates.
///
/// @example
///
/// ```js
/// var p1 = Point(10, 10),
/// p2 = Point(40, 60),
/// bounds = Bounds(p1, p2);
/// ```
///
/// All Leaflet methods that accept `Bounds` objects also accept them in a simple Array form (unless noted otherwise), so the bounds example above can be passed like this:
///
/// ```js
/// otherBounds.intersects([[10, 10], [40, 60]]);
/// ```
////
@JS('L.Bounds')
class Bounds {
  // @method extend(point: Point): this
  // Extends the bounds to contain the given point.
  external extend(Point point);
  // @method getCenter(round?: Boolean): Point
// Returns the center point of the bounds.
  external getCenter([bool round]);

  // @method getBottomLeft(): Point
  // Returns the bottom-left point of the bounds.
  external Point getBottomLeft();

  // @method getTopRight(): Point
  // Returns the top-right point of the bounds.
  external Point getTopRight(); // -> Point

  // @method getSize(): Point
  // Returns the size of the given bounds
  external Point getSize();

  // @method contains(otherBounds: Bounds): Boolean
  // Returns `true` if the rectangle contains the given one.
  // @alternative
  // @method contains(point: Point): Boolean
  // Returns `true` if the rectangle contains the given poing.
  external bool contains(dynamic point);

  // @factory L.bounds(topLeft: Point, bottomRight: Point)
  // Creates a Bounds object from two coordinates (usually top-left and bottom-right corners).
  // @alternative
  // @factory L.bounds(points: Point[])
  // Creates a Bounds object from the points it contains
  external factory Bounds(Point a, Point b);

  external bool intersects(Bounds bounds); // (Bounds) -> Boolean
  // @method overlaps(otherBounds: Bounds): Boolean
  // Returns `true` if the rectangle overlaps the given bounds. Two bounds
  // overlap if their intersection is an area.
  external bool overlaps(bounds); // (Bounds) -> Boolean
}
