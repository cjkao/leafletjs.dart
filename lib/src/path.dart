@JS()
library leafletjs.path;

import "package:js/js.dart";
import 'layer/layer.dart';
import 'map.dart' as L;

@JS()
@anonymous
class Path extends Layer {
  ///
  ///Adds the layer to the map.
  ///
  external Path addTo(L.Map map);
}
