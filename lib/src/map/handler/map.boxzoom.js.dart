@JS('')
library leafletjs.mapboxzoom;

import 'package:js/js.dart';

import '../../map.dart' as L;

/*
 * L.Handler.BoxZoom is used to add shift-drag zoom interaction to the map
 * (zoom to a selected bounding box), enabled by default.
 */
@JS('L.mapboxzoom')
class MapBoxZoom {
  ///  constructor
  external MapBoxZoom([L.Map map]);

  external void addHooks();

  external void removeHooks();

  external dynamic moved();
}
