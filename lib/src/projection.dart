@JS()
library leafletjs.projection;

import "package:js/js.dart";
import 'point.dart';
import 'lat.lng.dart';
import 'bounds.dart';

@JS("L.Projection.LonLat.project")
external Point project(latlng);

@JS("L.Projection.LonLat")
class PLat {
  @JS("project")
  external static Point project(latlng);
  @JS("unproject")
  external static LatLng unproject(Point p);
//  @JS()
//  Bounds bounds;
  //external project(latlng);
}
