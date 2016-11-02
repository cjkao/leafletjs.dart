@JS()
library leafletjs.geo.geometry.bounds;

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
@anonymous
@JS()
abstract class Bounds {
  /*external Bounds extend(Point point);*/
  /*external Bounds extend(Tuple of <num,num> point);*/
  external Bounds extend(dynamic /*Point|Tuple of <num,num>*/ point);
  external Point getCenter([bool round]);
  external Point getBottomLeft();
  external Point getTopRight();
  external Point getSize();
  /*external bool contains(Bounds otherBounds);*/
  /*external bool contains(List<Tuple of <num,num>> otherBounds);*/
  /*external bool contains(Point point);*/
  /*external bool contains(Tuple of <num,num> point);*/
  external bool contains(dynamic /*Bounds|List<Tuple of <num,num>>|Point|Tuple of <num,num>*/ otherBounds_point);
  /*external bool intersects(Bounds otherBounds);*/
  /*external bool intersects(List<Tuple of <num,num>> otherBounds);*/
  external bool intersects(dynamic /*Bounds|List<Tuple of <num,num>>*/ otherBounds);
  /*external bool overlaps(Bounds otherBounds);*/
  /*external bool overlaps(List<Tuple of <num,num>> otherBounds);*/
  external bool overlaps(dynamic /*Bounds|List<Tuple of <num,num>>*/ otherBounds);
  external Point get min;
  external set min(Point v);
  external Point get max;
  external set max(Point v);
}

/*type BoundsExpression = Bounds | BoundsLiteral;*/
/*external Bounds bounds(Point topLeft, Point bottomRight);*/
/*external Bounds bounds(Tuple of <num,num> topLeft, Tuple of <num,num> bottomRight);*/
/*external Bounds bounds(List<Point> points);*/
/*external Bounds bounds(List<Tuple of <num,num>> points);*/
@JS("L.bounds")
external Bounds bounds(dynamic /*Point|Tuple of <num,num>|List<Point>|List<Tuple of <num,num>>*/ topLeft_points,
    [dynamic /*Point|Tuple of <num,num>*/ bottomRight]);
